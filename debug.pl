#!/usr/bin/perl

use strict;
use warnings;

use lib 'lib';

use TeX::Encode;

warn "Requires UTF-8 Support in Terminal (CTRL+C now to exit)!\n";

binmode(STDOUT,":utf8");

my @terms = split '\|', $TeX::Encode::LATEX_Math_mode_re;
print "LATEX_Math_mode_re:\n",
	join("\n", map { join("\t", $_, ord($TeX::Encode::LATEX_Math_mode{$_}), $TeX::Encode::LATEX_Math_mode{$_}) } keys %TeX::Encode::LATEX_Math_mode), "\n";
