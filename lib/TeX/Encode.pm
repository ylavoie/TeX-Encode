package TeX::Encode;

use 5.008;
use strict;
use warnings;

use AutoLoader qw(AUTOLOAD);

use Encode::Encoding;
use Pod::LaTeX;
use HTML::Entities;

our @ISA = qw(Encode::Encoding);

our $VERSION = '0.3';

__PACKAGE__->Define(qw(LaTeX BibTeX latex bibtex));

use vars qw( %LATEX_Escapes %LATEX_Escapes_inv %LATEX_Math_mode );

# Missing entities in HTML::Entities?
@HTML::Entities::entity2char{qw(sol verbar)} = qw(\textfractionsolidus{} |);

# Use the mapping from Pod::LaTeX, but we use HTML::Entities
# to get the Unicode character
while( my ($entity,$tex) = each %Pod::LaTeX::HTML_Escapes ) {
	my $c = $HTML::Entities::entity2char{$entity};
	$LATEX_Escapes{$c} = $tex;
	if( $tex =~ s/^\$\\(.+)\$/$1/ ) {
		$LATEX_Math_mode{quotemeta($tex)} = $c;
#		warn "MM: ", quotemeta($tex), " => ", $c, "\n";
	} elsif( $tex =~ s/^\\// ) {
		$LATEX_Escapes_inv{quotemeta($tex)} = $c;
#		warn quotemeta($tex), " => ", $c, "\n";
	}
}

# Additional LaTeX sequences (greek letters)
{
	my $i = 0;
	for(qw( alpha beta gamma delta epsilon zeta eta theta iota kappa lamda mu nu xi omicron pi rho final_sigma sigma tau upsilon phi chi psi omega )) {
		$LATEX_Escapes_inv{quotemeta($_)} = chr(0x3b1+$i);
		$LATEX_Escapes_inv{quotemeta("\u$_")} = chr(0x391+$i);
		$i++;
	}
	$LATEX_Escapes_inv{'lambda'} = $LATEX_Escapes_inv{'lamda'}; # Spelling mistake in LaTeX/charmap?
}

# Additional LaTeX mathematical sequences
%LATEX_Math_mode = (
	%LATEX_Math_mode,
	'AA' => chr(0xc5), # &aring; Angstrom
	'sin' => 'sin', # sin (should be romanised), other trigonometric functions???
	'to' => chr(0x2192), # -->
	'leftarrow' => chr(0x2190), # <--
	'rightarrow' => chr(0x2192), # -->
	'approx' => chr(0x2248), # &asymp; Approximately equal to
	'lesssim' => chr(0x2272), # May not exist!
	'gtrsim' => chr(0x2273), # May not exist!
	'simeq' => chr(0x2243),
	'pm' => chr(0xb1), # &plusmn; Plus-minus
	'times' => chr(0xd7), # &times; Times
	# Sets, http://www.unicode.org/charts/PDF/Unicode-4.1/U41-2100.pdf
	'N' => chr(0x2115),
	'R' => chr(0x211d),
	'Z' => chr(0x2124),
);
# TODO
# e.g. \acute{e} => \'e
# Math-mode accents: hat, acute, bar, dot, breve, check, grave, vec, ddot, tilde

# encode($string [,$check])
sub encode
{
	use utf8;
	my ($self,$str,$check) = @_;
	$str =~ s/([^\x00-\x80])/$LATEX_Escapes{$1}/sg;
	return $str;
}
# decode($octets [,$check])
sub decode
{
	my ($self,$str,$check) = @_;
	while( my ($re,$char) = each %LATEX_Escapes_inv ) {
		$str =~ s/\\$re/$char/sg;
	}
	# Convert some LaTeX macros into HTML equivalents
	_htmlise(\$str);
	# Anything between dollars is italicised ('math mode')
	$str =~ s/\$([^\$]+?)\$/"<i>".&_mathmode($1)."<\/i>"/sge;
	$str;
}
# Math-mode symbols
sub _mathmode
{
	my $str = shift;
	while( my ($re,$char) = each %LATEX_Math_mode ) {
		$str =~ s/\\$re/$char/sg;
	}
	$str;
}
# Superscript/subscript
# sqrt
# Overline for /bar
# LaTeX
sub _htmlise
{
	my $str = shift;
	
	$$str =~ s/\^\{([^\{\}]+)\}/<sup>$1<\/sup>/sg;
	$$str =~ s/\^(\\\w+|.)/<sup>$1<\/sup>/sg;
	$$str =~ s/_\{([^\{\}]+)\}/<sub>$1<\/sub>/sg;
	$$str =~ s/_(\\\w+|.)/<sub>$1<\/sub>/sg;
	
	$$str =~ s/\\sqrt/chr(0x221a)."\\bar"/seg; # &radic; Sqrt, put the next thing under a line
	
	$$str =~ s/\\(?:bar|overline)\{([^\{\}]+)\}/<span style='text-decoration: overline'>$1<\/span>/sg;
	$$str =~ s/\\(?:bar|overline) (\w+|.)/<span style='text-decoration: overline'>$1<\/span>/sg;
	$$str =~ s/\\(?:bar|overline)([^A-Za-z])/<span style='text-decoration: overline'>$1<\/span>/sg;

	$$str =~ s/LaTeX/L<sup>A<\/sup>T<small>E<\/small>X/sg;
}

sub perlio_ok { 0 }

# Autoload methods go after =cut, and are processed by the autosplit program.

1;
__END__

=head1 NAME

TeX::Encode - Encode/decode Perl utf-8 strings into TeX

=head1 SYNOPSIS

  use TeX::Encode;
  use Encode;

  $tex = encode('latex', "This will encode an e-acute (".chr(0xe9).") as \'e");
  $str = decode('latex', $tex); # Will decode the \'e too!

=head1 DESCRIPTION

This module provides encoding to LaTeX escapes from utf8 using mapping tables in L<Pod::LaTeX> and L<HTML::Entities>. This covers only a subset of the Unicode character table (undef warnings will occur for non-mapped chars).

Mileage will vary when decoding (converting TeX to utf8), as TeX is in essence a programming language, and this module does not implement TeX.

I use this module to encode author names in BibTeX and to do a rough job at presenting LaTeX abstracts in HTML. Using decode rather than seeing $\sqrt{\Omega^2\zeta_n}$ you get something that looks like the formula.

The next logical step for this module is to integrate some level of TeX grammar to improve the decoding, in particular to handle fractions and font changes (which should probably be dropped).

=head1 CAVEATS

Proper Encode checking is not implemented.

=head2 encode()

Converts non-ASCII Unicode characters their equivalent TeX symbols (unTeXable characters will result in undef warnings).

=head2 decode()

Attempts to convert TeX symbols (e.g. \ae) to Unicode characters. As an experimental feature this also handles Math-mode TeX by inserting HTML into the resulting string (so you end up with an HTML approximation of the maths).

=head1 SEE ALSO

L<Pod::LaTeX>

=head1 AUTHOR

Timothy D Brody, E<lt>tdb01r@ecs.soton.ac.ukE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2005 by Timothy D Brody

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.7 or,
at your option, any later version of Perl 5 you may have available.

=cut
