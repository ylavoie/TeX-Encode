# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Encode-LaTeX.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test::More tests => 9;
use Encode;
BEGIN { use_ok('TeX::Encode') };

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

my $str = "eacute = '" . chr(0xe9) . "'";

is(encode('LaTeX', $str), "eacute = '\\'e'", "eacute => '\\'e'");

is(decode('latex', "eacute = '\\'e'"), $str, $str);

is(decode('latex', "\\sqrt{2}"), chr(0x221a) . "<span style='text-decoration: overline'>2<\/span>");
# Unsupported
#$str = "blah \$\\acute{e}\$ blah";
#is(decode('latex',$str), "blah <i>".chr(0xe9)."</i> blah", $str);

$str = 'hyper-K\"ahler background';

is(decode('latex', $str), 'hyper-K'.chr(0xe4).'hler background', '\"a => '.chr(0xe4));

$str = '$0<\\sigma\\leq2$';

is(decode('latex', $str), '0&lt;'.chr(0x3c3).chr(0x2264).'2');

# Check misquoting of tex strings ({})
$str = 'foo $\\mathrm{E}$ bar';
is(decode('latex', $str), 'foo '.chr(917).' bar');

$str = 'foo \\{ bar';
is(decode('latex', $str), 'foo { bar');

ok(1);
