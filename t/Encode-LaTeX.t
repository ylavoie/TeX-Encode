# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Encode-LaTeX.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test::More tests => 14;
use Encode;
BEGIN { use_ok('TeX::Encode') };

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

# decode of an encode should be equivalent
my $str = "eacute = '" . chr(0xe9) . "'";
is(encode('LaTeX', $str), "eacute = '\\'e'", "eacute => '\\'e'");
is(decode('latex', "eacute = '\\'e'"), $str, $str);

# General decode tests
my %DECODE_TESTS = (
	'\\sqrt{2}' => (chr(0x221a) . "<span style='text-decoration: overline'>2<\/span>"),
	'hyper-K\"ahler background' => ('hyper-K'.chr(0xe4).'hler background'),
	'$0<\\sigma\\leq2$' => ('<span class=\'mathrm\'>0&lt;'.chr(0x3c3).chr(0x2264).'2</span>'),
	'foo \\{ bar' => 'foo { bar', # Unescaping Tex escapes
	'foo \\\\ bar' => 'foo <br /> bar', # Tex newline
	'foo $mathrm$ bar' => 'foo <span class=\'mathrm\'>mathrm</span> bar', # Math mode test (strictly should eat spaces inside math mode too)
);

# General encode tests
my %ENCODE_TESTS = (
	'underscores _ should be escaped' => "underscores \\_ should be escaped",
	'#$%&~_^{}><\\' => '\\#\\$\\%\\&\\~\\_\\^\\{\\}$>$$<$\\\\',
);

while( my( $in, $out ) = each %DECODE_TESTS ) {
	is( decode('latex', $in), $out );
}

while( my( $in, $out ) = each %ENCODE_TESTS ) {
	is( encode('latex', $in), $out );
}

# Check misquoting of tex strings ({})
SKIP: {
	skip "Pod::LaTeX::HTML_Escapes doesn't have mathrm{E}", 1 unless exists($TeX::Encode::LATEX_Math_mode{'mathrm{E}'});
	
	$str = 'mathrm $\\mathrm{E}$';
	is(decode('latex', $str), 'mathrm <span class=\'mathrm\'>'.chr(917).'</span>');
};

# Unsupported
TODO: {
	local $TODO = "No support yet for macro-based text twiddles";

	my $str = "blah \$\\acute{e}\$ blah";
	is(decode('latex',$str), "blah <i>".chr(0xe9)."</i> blah", $str);
}

ok(1);
