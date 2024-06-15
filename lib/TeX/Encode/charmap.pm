package TeX::Encode::charmap;
# VERSION

=head1 NAME

TeX::Encode::charmap - Character mappings between TeX and Unicode

=head1 DESCRIPTION

Most of the mapping was built from Tralics, see http://www-sop.inria.fr/apics/tralics/

A part was built from Clark Grubb's L<latex-input|https://github.com/clarkgrubb/latex-input>.

=begin comment

latex-input is avilable under following terms:

Copyright (C) 2014 Clark Grubb


Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

=end comment

=cut

use vars qw( %RESERVED %BIBTEX_RESERVED %CHARS %ACCENTED_CHARS %LATEX_MACROS %CYR %GREEK %TEX_GREEK %MATH %MATH_CHARS %ASTRONOMY %GAMES %KEYS %IPA );

# reserved latex characters
%RESERVED = (
'#' => '\\#',
'$' => '\\$',
'%' => '\\%',
'&' => '\\&',
'_' => '\\_',
'{' => '\\{',
'}' => '\\}',
'\\' => '\\texttt{\\char92}',
'^' => '\^{ }', # '\\texttt{\\char94}',
'~' => '\\texttt{\\char126}',
);

%BIBTEX_RESERVED = (
'#' => '\\#',
'$' => '\\$',
'%' => '\\%',
'&' => '\\&',
'_' => '\\_',
'{' => '\\{',
'}' => '\\}',
'\\' => '{$\\backslash$}',
'^' => '{\^{ }}',
'~' => '{\\texttt{\\char126}}',
);

# single, non-ligature characters
%CHARS = (

# ASCII characters
'<' => "\\ensuremath{<}",
'>' => "\\ensuremath{>}",
'|' => "\\ensuremath{|}",
'[' => '{[}', # opening argument(s)
']' => '{]}', # closing argument(s)
chr(0x2014) => "--", # emdash

# non-accented
chr(0x00a3) => '\\pounds', # £
chr(0x00a7) => '\\S', # §
chr(0x00a9) => '\\copyright',
chr(0x00b6) => '\\P', # ¶
chr(0x00c6) => '\\AE', # Æ
chr(0x00d0) => '\\DH', # Ð
chr(0x00d8) => '\\O', # Ø
chr(0x00de) => '\\TH', # Þ
chr(0x00df) => '\\ss', # ß
chr(0x00e6) => '\\ae', # æ
chr(0x00f0) => '\\dh', # ð
chr(0x00f8) => '\\o', # ø
chr(0x00fe) => '\\th', # þ
chr(0x0110) => '\\DJ', # Đ
chr(0x0111) => '\\dj', # đ
chr(0x0131) => '\\i', # ı
chr(0x0132) => '\\IJ', # Ĳ
chr(0x0133) => '\\ij', # ĳ
chr(0x0141) => '\\L', # Ł
chr(0x0142) => '\\l', # ł
chr(0x014a) => '\\NG', # Ŋ
chr(0x014b) => '\\ng', # ŋ
chr(0x0152) => '\\OE', # Œ
chr(0x0153) => '\\oe', # œ

# superscript/subscript (maths)
chr(0x2070) => '$^0$',
chr(0x2071) => '$^i$',
chr(0x2074) => '$^4$',
chr(0x2075) => '$^5$',
chr(0x2076) => '$^6$',
chr(0x2077) => '$^7$',
chr(0x2078) => '$^8$',
chr(0x2079) => '$^9$',
chr(0x207A) => '$^+$',
chr(0x207B) => '$^-$',
chr(0x207C) => '$^=$',
chr(0x207D) => '$^($',
chr(0x207E) => '$^)$',
chr(0x207F) => '$^n$',
chr(0x2080) => '$_0$',
chr(0x2081) => '$_1$',
chr(0x2082) => '$_2$',
chr(0x2083) => '$_3$',
chr(0x2084) => '$_4$',
chr(0x2085) => '$_5$',
chr(0x2086) => '$_6$',
chr(0x2087) => '$_7$',
chr(0x2088) => '$_8$',
chr(0x2089) => '$_9$',
chr(0x208A) => '$_+$',
chr(0x208B) => '$_-$',
chr(0x208C) => '$_=$',
chr(0x208D) => '$_($',
chr(0x208E) => '$_)$',

chr(0x1D43) => '^a', # ᵃ
chr(0x2090) => '_a', # ₐ
chr(0x1D47) => '^b', # ᵇ
chr(0x1D9C) => '^c', # ᶜ
chr(0x1D2C) => '^A', # ᴬ
chr(0x1D2E) => '^B', # ᴮ
chr(0x1D45) => '^\alpha', # ᵅ
chr(0x1D5D) => '^\beta', # ᵝ
chr(0x1D66) => '_\beta', # ᵦ
chr(0x1D5E) => '^\gamma', # ᵞ
chr(0x1D67) => '_\gamma', # ᵧ

);

# accented characters
%ACCENTED_CHARS = (

### Æ

chr(0x01fc) => "\\\'{\\AE}", # Ǽ
chr(0x01e2) => "\\\={\\AE}", # Ǣ

### æ

chr(0x01fd) => "\\\'{\\ae}", # ǽ
chr(0x01e3) => "\\\={\\ae}", # ǣ

### Å

chr(0x01fa) => "\\\'{\\AA}", # Ǻ

### å

chr(0x01fb) => "\\\'{\\aa}", # ǻ

### Ø

chr(0x01fe) => "\\\'{\\O}", # Ǿ

### ø

chr(0x01ff) => "\\\'{\\o}", # ǿ

### 


### 


### A

chr(0x00c1) => "\\\'A", # Á
chr(0x00c0) => "\\\`A", # À
chr(0x00c2) => "\\\^A", # Â
chr(0x00c4) => "\\\"A", # Ä
chr(0x00c3) => "\\\~A", # Ã
chr(0x0104) => "\\k{A}", # Ą
chr(0x01cd) => "\\v{A}", # Ǎ
chr(0x0102) => "\\u{A}", # Ă
chr(0x0226) => "\\\.A", # Ȧ
chr(0x0100) => "\\\=A", # Ā
chr(0x00c5) => "\\r{A}", # Å
chr(0x1ea0) => "\\d{A}", # Ạ
chr(0x0200) => "\\C{A}", # Ȁ
chr(0x0202) => "\\f{A}", # Ȃ
chr(0x1e00) => "\\D{A}", # Ḁ
chr(0x1ea2) => "\\h{A}", # Ả

### B

chr(0x1e02) => "\\\.B", # Ḃ
chr(0x1e06) => "\\b{B}", # Ḇ
chr(0x1e04) => "\\d{B}", # Ḅ

### C

chr(0x0106) => "\\\'C", # Ć
chr(0x0108) => "\\\^C", # Ĉ
chr(0x010c) => "\\v{C}", # Č
chr(0x00c7) => "\\c{C}", # Ç
chr(0x010a) => "\\\.C", # Ċ

### D

chr(0x010e) => "\\v{D}", # Ď
chr(0x1e10) => "\\c{D}", # Ḑ
chr(0x1e0a) => "\\\.D", # Ḋ
chr(0x1e0e) => "\\b{D}", # Ḏ
chr(0x1e0c) => "\\d{D}", # Ḍ
chr(0x1e12) => "\\V{D}", # Ḓ

### E

chr(0x00c9) => "\\\'E", # É
chr(0x00c8) => "\\\`E", # È
chr(0x00ca) => "\\\^E", # Ê
chr(0x00cb) => "\\\"E", # Ë
chr(0x1ebc) => "\\\~E", # Ẽ
chr(0x0118) => "\\k{E}", # Ę
chr(0x011a) => "\\v{E}", # Ě
chr(0x0114) => "\\u{E}", # Ĕ
chr(0x0228) => "\\c{E}", # Ȩ
chr(0x0116) => "\\\.E", # Ė
chr(0x0112) => "\\\=E", # Ē
chr(0x1eb8) => "\\d{E}", # Ẹ
chr(0x0204) => "\\C{E}", # Ȅ
chr(0x0206) => "\\f{E}", # Ȇ
chr(0x1e1a) => "\\T{E}", # Ḛ
chr(0x1e18) => "\\V{E}", # Ḙ
chr(0x1eba) => "\\h{E}", # Ẻ

### F

chr(0x1e1e) => "\\\.F", # Ḟ

### G

chr(0x01f4) => "\\\'G", # Ǵ
chr(0x011c) => "\\\^G", # Ĝ
chr(0x01e6) => "\\v{G}", # Ǧ
chr(0x011e) => "\\u{G}", # Ğ
chr(0x0122) => "\\c{G}", # Ģ
chr(0x0120) => "\\\.G", # Ġ
chr(0x1e20) => "\\\=G", # Ḡ

### H

chr(0x0124) => "\\\^H", # Ĥ
chr(0x1e26) => "\\\"H", # Ḧ
chr(0x021e) => "\\v{H}", # Ȟ
chr(0x1e28) => "\\c{H}", # Ḩ
chr(0x1e22) => "\\\.H", # Ḣ
chr(0x0126) => "\\\=H", # Ħ
chr(0x1e24) => "\\d{H}", # Ḥ

### I

chr(0x00cd) => "\\\'I", # Í
chr(0x00cc) => "\\\`I", # Ì
chr(0x00ce) => "\\\^I", # Î
chr(0x00cf) => "\\\"I", # Ï
chr(0x0128) => "\\\~I", # Ĩ
chr(0x012e) => "\\k{I}", # Į
chr(0x01cf) => "\\v{I}", # Ǐ
chr(0x012c) => "\\u{I}", # Ĭ
chr(0x0130) => "\\\.I", # İ
chr(0x012a) => "\\\=I", # Ī
chr(0x1eca) => "\\d{I}", # Ị
chr(0x0208) => "\\C{I}", # Ȉ
chr(0x020a) => "\\f{I}", # Ȋ
chr(0x1e2c) => "\\T{I}", # Ḭ
chr(0x1ec8) => "\\h{I}", # Ỉ

### J

chr(0x0134) => "\\\^J", # Ĵ

### K

chr(0x1e30) => "\\\'K", # Ḱ
chr(0x01e8) => "\\v{K}", # Ǩ
chr(0x0136) => "\\c{K}", # Ķ
chr(0x1e34) => "\\b{K}", # Ḵ
chr(0x1e32) => "\\d{K}", # Ḳ

### L

chr(0x0139) => "\\\'L", # Ĺ
chr(0x013d) => "\\v{L}", # Ľ
chr(0x013b) => "\\c{L}", # Ļ
chr(0x013f) => "\\\.L", # Ŀ
chr(0x1e3a) => "\\b{L}", # Ḻ
chr(0x1e36) => "\\d{L}", # Ḷ
chr(0x1e3c) => "\\V{L}", # Ḽ

### M

chr(0x1e3e) => "\\\'M", # Ḿ
chr(0x1e40) => "\\\.M", # Ṁ
chr(0x1e42) => "\\d{M}", # Ṃ

### N

chr(0x0143) => "\\\'N", # Ń
chr(0x01f8) => "\\\`N", # Ǹ
chr(0x00d1) => "\\\~N", # Ñ
chr(0x0147) => "\\v{N}", # Ň
chr(0x0145) => "\\c{N}", # Ņ
chr(0x1e44) => "\\\.N", # Ṅ
chr(0x1e48) => "\\b{N}", # Ṉ
chr(0x1e46) => "\\d{N}", # Ṇ
chr(0x1e4a) => "\\V{N}", # Ṋ

### O

chr(0x00d3) => "\\\'O", # Ó
chr(0x00d2) => "\\\`O", # Ò
chr(0x00d4) => "\\\^O", # Ô
chr(0x00d6) => "\\\"O", # Ö
chr(0x00d5) => "\\\~O", # Õ
chr(0x01ea) => "\\k{O}", # Ǫ
chr(0x0150) => "\\H{O}", # Ő
chr(0x01d1) => "\\v{O}", # Ǒ
chr(0x014e) => "\\u{O}", # Ŏ
chr(0x022e) => "\\\.O", # Ȯ
chr(0x014c) => "\\\=O", # Ō
chr(0x1ecc) => "\\d{O}", # Ọ
chr(0x020c) => "\\C{O}", # Ȍ
chr(0x020e) => "\\f{O}", # Ȏ
chr(0x1ece) => "\\h{O}", # Ỏ

### P

chr(0x1e54) => "\\\'P", # Ṕ
chr(0x1e56) => "\\\.P", # Ṗ

### Q


### R

chr(0x0154) => "\\\'R", # Ŕ
chr(0x0158) => "\\v{R}", # Ř
chr(0x0156) => "\\c{R}", # Ŗ
chr(0x1e58) => "\\\.R", # Ṙ
chr(0x1e5e) => "\\b{R}", # Ṟ
chr(0x1e5a) => "\\d{R}", # Ṛ
chr(0x0210) => "\\C{R}", # Ȑ
chr(0x0212) => "\\f{R}", # Ȓ

### S

chr(0x015a) => "\\\'S", # Ś
chr(0x015c) => "\\\^S", # Ŝ
chr(0x0160) => "\\v{S}", # Š
chr(0x015e) => "\\c{S}", # Ş
chr(0x1e60) => "\\\.S", # Ṡ
chr(0x1e62) => "\\d{S}", # Ṣ

### T

chr(0x0164) => "\\v{T}", # Ť
chr(0x0162) => "\\c{T}", # Ţ
chr(0x1e6a) => "\\\.T", # Ṫ
chr(0x0166) => "\\\=T", # Ŧ
chr(0x1e6e) => "\\b{T}", # Ṯ
chr(0x1e6c) => "\\d{T}", # Ṭ
chr(0x1e70) => "\\V{T}", # Ṱ

### U

chr(0x00da) => "\\\'U", # Ú
chr(0x00d9) => "\\\`U", # Ù
chr(0x00db) => "\\\^U", # Û
chr(0x00dc) => "\\\"U", # Ü
chr(0x0168) => "\\\~U", # Ũ
chr(0x0172) => "\\k{U}", # Ų
chr(0x0170) => "\\H{U}", # Ű
chr(0x01d3) => "\\v{U}", # Ǔ
chr(0x016c) => "\\u{U}", # Ŭ
chr(0x016a) => "\\\=U", # Ū
chr(0x016e) => "\\r{U}", # Ů
chr(0x1ee4) => "\\d{U}", # Ụ
chr(0x0214) => "\\C{U}", # Ȕ
chr(0x0216) => "\\f{U}", # Ȗ
chr(0x1e74) => "\\T{U}", # Ṵ
chr(0x1e76) => "\\V{U}", # Ṷ
chr(0x1ee6) => "\\h{U}", # Ủ

### V

chr(0x1e7c) => "\\\~V", # Ṽ
chr(0x1e7e) => "\\d{V}", # Ṿ

### W

chr(0x1e82) => "\\\'W", # Ẃ
chr(0x1e80) => "\\\`W", # Ẁ
chr(0x0174) => "\\\^W", # Ŵ
chr(0x1e84) => "\\\"W", # Ẅ
chr(0x1e86) => "\\\.W", # Ẇ
chr(0x1e88) => "\\d{W}", # Ẉ

### X

chr(0x1e8c) => "\\\"X", # Ẍ
chr(0x1e8a) => "\\\.X", # Ẋ

### Y

chr(0x00dd) => "\\\'Y", # Ý
chr(0x1ef2) => "\\\`Y", # Ỳ
chr(0x0176) => "\\\^Y", # Ŷ
chr(0x0178) => "\\\"Y", # Ÿ
chr(0x1ef8) => "\\\~Y", # Ỹ
chr(0x1e8e) => "\\\.Y", # Ẏ
chr(0x0232) => "\\\=Y", # Ȳ
chr(0x1ef4) => "\\d{Y}", # Ỵ
chr(0x1ef6) => "\\h{Y}", # Ỷ

### Z

chr(0x0179) => "\\\'Z", # Ź
chr(0x1e90) => "\\\^Z", # Ẑ
chr(0x017d) => "\\v{Z}", # Ž
chr(0x017b) => "\\\.Z", # Ż
chr(0x1e94) => "\\b{Z}", # Ẕ
chr(0x1e92) => "\\d{Z}", # Ẓ

### [


### \


### ]


### ^


### _


### `


### a

chr(0x00e1) => "\\\'a", # á
chr(0x00e0) => "\\\`a", # à
chr(0x00e2) => "\\\^a", # â
chr(0x00e4) => "\\\"a", # ä
chr(0x00e3) => "\\\~a", # ã
chr(0x0105) => "\\k{a}", # ą
chr(0x01ce) => "\\v{a}", # ǎ
chr(0x0103) => "\\u{a}", # ă
chr(0x0227) => "\\\.a", # ȧ
chr(0x0101) => "\\\=a", # ā
chr(0x00e5) => "\\r{a}", # å
chr(0x1ea1) => "\\d{a}", # ạ
chr(0x0201) => "\\C{a}", # ȁ
chr(0x0203) => "\\f{a}", # ȃ
chr(0x1e01) => "\\D{a}", # ḁ
chr(0x1ea3) => "\\h{a}", # ả

### b

chr(0x1e03) => "\\\.b", # ḃ
chr(0x1e07) => "\\b{b}", # ḇ
chr(0x1e05) => "\\d{b}", # ḅ

### c

chr(0x0107) => "\\\'c", # ć
chr(0x0109) => "\\\^c", # ĉ
chr(0x010d) => "\\v{c}", # č
chr(0x00e7) => "\\c{c}", # ç
chr(0x010b) => "\\\.c", # ċ

### d

chr(0x010f) => "\\v{d}", # ď
chr(0x1e11) => "\\c{d}", # ḑ
chr(0x1e0b) => "\\\.d", # ḋ
chr(0x1e0f) => "\\b{d}", # ḏ
chr(0x1e0d) => "\\d{d}", # ḍ
chr(0x1e13) => "\\V{d}", # ḓ

### e

chr(0x00e9) => "\\\'e", # é
chr(0x00e8) => "\\\`e", # è
chr(0x00ea) => "\\\^e", # ê
chr(0x00eb) => "\\\"e", # ë
chr(0x1ebd) => "\\\~e", # ẽ
chr(0x0119) => "\\k{e}", # ę
chr(0x011b) => "\\v{e}", # ě
chr(0x0115) => "\\u{e}", # ĕ
chr(0x0229) => "\\c{e}", # ȩ
chr(0x0117) => "\\\.e", # ė
chr(0x0113) => "\\\=e", # ē
chr(0x1eb9) => "\\d{e}", # ẹ
chr(0x0205) => "\\C{e}", # ȅ
chr(0x0207) => "\\f{e}", # ȇ
chr(0x1e1b) => "\\T{e}", # ḛ
chr(0x1e19) => "\\V{e}", # ḙ
chr(0x1ebb) => "\\h{e}", # ẻ

### f

chr(0x1e1f) => "\\\.f", # ḟ

### g

chr(0x01f5) => "\\\'g", # ǵ
chr(0x011d) => "\\\^g", # ĝ
chr(0x01e7) => "\\v{g}", # ǧ
chr(0x011f) => "\\u{g}", # ğ
chr(0x0123) => "\\c{g}", # ģ
chr(0x0121) => "\\\.g", # ġ
chr(0x1e21) => "\\\=g", # ḡ

### h

chr(0x0125) => "\\\^h", # ĥ
chr(0x1e27) => "\\\"h", # ḧ
chr(0x021f) => "\\v{h}", # ȟ
chr(0x1e29) => "\\c{h}", # ḩ
chr(0x1e23) => "\\\.h", # ḣ
chr(0x0127) => "\\\=h", # ħ
chr(0x1e96) => "\\b{h}", # ẖ

### i

chr(0x00ed) => "\\\'i", # í
chr(0x00ec) => "\\\`i", # ì
chr(0x00ee) => "\\\^i", # î
chr(0x00ef) => "\\\"i", # ï
chr(0x0129) => "\\\~i", # ĩ
chr(0x012f) => "\\k{i}", # į
chr(0x01d0) => "\\v{i}", # ǐ
chr(0x012d) => "\\u{i}", # ĭ
chr(0x012b) => "\\\=i", # ī
chr(0x1ecb) => "\\d{i}", # ị
chr(0x0209) => "\\C{i}", # ȉ
chr(0x020b) => "\\f{i}", # ȋ
chr(0x1e2d) => "\\T{i}", # ḭ
chr(0x1ec9) => "\\h{i}", # ỉ

### j

chr(0x0135) => "\\\^j", # ĵ
chr(0x01f0) => "\\v{j}", # ǰ

### k

chr(0x1e31) => "\\\'k", # ḱ
chr(0x01e9) => "\\v{k}", # ǩ
chr(0x0137) => "\\c{k}", # ķ
chr(0x1e35) => "\\b{k}", # ḵ
chr(0x1e33) => "\\d{k}", # ḳ

### l

chr(0x013a) => "\\\'l", # ĺ
chr(0x013e) => "\\v{l}", # ľ
chr(0x013c) => "\\c{l}", # ļ
chr(0x0140) => "\\\.l", # ŀ
chr(0x1e3b) => "\\b{l}", # ḻ
chr(0x1e37) => "\\d{l}", # ḷ
chr(0x1e3d) => "\\V{l}", # ḽ

### m

chr(0x1e3f) => "\\\'m", # ḿ
chr(0x1e41) => "\\\.m", # ṁ
chr(0x1e43) => "\\d{m}", # ṃ

### n

chr(0x0144) => "\\\'n", # ń
chr(0x01f9) => "\\\`n", # ǹ
chr(0x00f1) => "\\\~n", # ñ
chr(0x0148) => "\\v{n}", # ň
chr(0x0146) => "\\c{n}", # ņ
chr(0x1e45) => "\\\.n", # ṅ
chr(0x1e49) => "\\b{n}", # ṉ
chr(0x1e47) => "\\d{n}", # ṇ
chr(0x1e4b) => "\\V{n}", # ṋ

### o

chr(0x00f3) => "\\\'o", # ó
chr(0x00f2) => "\\\`o", # ò
chr(0x00f4) => "\\\^o", # ô
chr(0x00f6) => "\\\"o", # ö
chr(0x00f5) => "\\\~o", # õ
chr(0x01eb) => "\\k{o}", # ǫ
chr(0x0151) => "\\H{o}", # ő
chr(0x01d2) => "\\v{o}", # ǒ
chr(0x014f) => "\\u{o}", # ŏ
chr(0x022f) => "\\\.o", # ȯ
chr(0x014d) => "\\\=o", # ō
chr(0x1ecd) => "\\d{o}", # ọ
chr(0x020d) => "\\C{o}", # ȍ
chr(0x020f) => "\\f{o}", # ȏ
chr(0x1ecf) => "\\h{o}", # ỏ

### p

chr(0x1e55) => "\\\'p", # ṕ
chr(0x1e57) => "\\\.p", # ṗ

### q


### r

chr(0x0155) => "\\\'r", # ŕ
chr(0x0159) => "\\v{r}", # ř
chr(0x0157) => "\\c{r}", # ŗ
chr(0x1e59) => "\\\.r", # ṙ
chr(0x1e5f) => "\\b{r}", # ṟ
chr(0x1e5b) => "\\d{r}", # ṛ
chr(0x0211) => "\\C{r}", # ȑ
chr(0x0213) => "\\f{r}", # ȓ

### s

chr(0x015b) => "\\\'s", # ś
chr(0x015d) => "\\\^s", # ŝ
chr(0x0161) => "\\v{s}", # š
chr(0x015f) => "\\c{s}", # ş
chr(0x1e61) => "\\\.s", # ṡ
chr(0x1e63) => "\\d{s}", # ṣ

### t

chr(0x1e97) => "\\\"t", # ẗ
chr(0x0165) => "\\v{t}", # ť
chr(0x0163) => "\\c{t}", # ţ
chr(0x1e6b) => "\\\.t", # ṫ
chr(0x0167) => "\\\=t", # ŧ
chr(0x1e6f) => "\\b{t}", # ṯ
chr(0x1e6d) => "\\d{t}", # ṭ
chr(0x1e71) => "\\V{t}", # ṱ

### u

chr(0x00fa) => "\\\'u", # ú
chr(0x00f9) => "\\\`u", # ù
chr(0x00fb) => "\\\^u", # û
chr(0x00fc) => "\\\"u", # ü
chr(0x0169) => "\\\~u", # ũ
chr(0x0173) => "\\k{u}", # ų
chr(0x0171) => "\\H{u}", # ű
chr(0x01d4) => "\\v{u}", # ǔ
chr(0x016d) => "\\u{u}", # ŭ
chr(0x016b) => "\\\=u", # ū
chr(0x016f) => "\\r{u}", # ů
chr(0x1ee5) => "\\d{u}", # ụ
chr(0x0215) => "\\C{u}", # ȕ
chr(0x0217) => "\\f{u}", # ȗ
chr(0x1e75) => "\\T{u}", # ṵ
chr(0x1e77) => "\\V{u}", # ṷ
chr(0x1ee7) => "\\h{u}", # ủ

### v

chr(0x1e7d) => "\\\~v", # ṽ
chr(0x1e7f) => "\\d{v}", # ṿ

### w

chr(0x1e83) => "\\\'w", # ẃ
chr(0x1e81) => "\\\`w", # ẁ
chr(0x0175) => "\\\^w", # ŵ
chr(0x1e85) => "\\\"w", # ẅ
chr(0x1e87) => "\\\.w", # ẇ
chr(0x1e98) => "\\r{w}", # ẘ
chr(0x1e89) => "\\d{w}", # ẉ

### x

chr(0x1e8d) => "\\\"x", # ẍ
chr(0x1e8b) => "\\\.x", # ẋ

### y

chr(0x00fd) => "\\\'y", # ý
chr(0x1ef3) => "\\\`y", # ỳ
chr(0x0177) => "\\\^y", # ŷ
chr(0x00ff) => "\\\"y", # ÿ
chr(0x1ef9) => "\\\~y", # ỹ
chr(0x1e8f) => "\\\.y", # ẏ
chr(0x0233) => "\\\=y", # ȳ
chr(0x1e99) => "\\r{y}", # ẙ
chr(0x1ef5) => "\\d{y}", # ỵ
chr(0x1ef7) => "\\h{y}", # ỷ

### z

chr(0x017a) => "\\\'z", # ź
chr(0x1e91) => "\\\^z", # ẑ
chr(0x017e) => "\\v{z}", # ž
chr(0x017c) => "\\\.z", # ż
chr(0x1e95) => "\\b{z}", # ẕ
chr(0x1e93) => "\\d{z}", # ẓ

);

# latex character references
%LATEX_MACROS = (

"\\\\" => "\n",

"\\char92" => '\\',
"\\char94" => '^',
"\\char126" => '~',

"--" => chr(0x2014), # --

"\\acute{e}" => chr(0x00e9), # é
"\\textunderscore" => chr(0x005f), # _
"\\textbraceleft" => chr(0x007b), # {
"\\textbraceright" => chr(0x007d), # }
"\\textasciitilde" => chr(0x007e), # ~
"\\textexclamdown" => chr(0x00a1), # ¡
"\\textcent" => chr(0x00a2), # ¢
"\\textsterling" => chr(0x00a3), # £
"\\textcurrency" => chr(0x00a4), # ¤
"\\textyen" => chr(0x00a5), # ¥
"\\textbrokenbar" => chr(0x00a6), # ¦
"\\textsection" => chr(0x00a7), # §
"\\textasciidieresis" => chr(0x00a8), # ¨
"\\copyright" => chr(0x00a9), # ©
"\\textcopyright" => chr(0x00a9), # ©
"\\textordfeminine" => chr(0x00aa), # ª
"\\guillemotleft" => chr(0x00ab), # «
"\\textlnot" => chr(0x00ac), # ¬
"\\textsofthyphen" => chr(0x00ad), # ­
"\\textregistered" => chr(0x00ae), # ®
"\\textasciimacron" => chr(0x00af), # ¯
"\\textdegree" => chr(0x00b0), # °
"\\textpm" => chr(0x00b1), # ±
"\\texttwosuperior" => chr(0x00b2), # ²
"\\textthreesuperior" => chr(0x00b3), # ³
"\\apostrophe" => chr(0x00b4), # ´
"\\textasciiacute" => chr(0x00b4), # ´
"\\textmu" => chr(0x00b5), # µ
"\\textpilcrow" => chr(0x00b6), # ¶
"\\textparagraph" => chr(0x00b6), # ¶
"\\textperiodcentered" => chr(0x00b7), # ·
"\\textasciicedilla" => chr(0x00b8), # ¸
"\\textonesuperior" => chr(0x00b9), # ¹
"\\textordmasculine" => chr(0x00ba), # º
"\\guillemotright" => chr(0x00bb), # »
"\\textonequarter" => chr(0x00bc), # ¼
"\\textonehalf" => chr(0x00bd), # ½
"\\textthreequarters" => chr(0x00be), # ¾
"\\textquestiondown" => chr(0x00bf), # ¿
"\\texttimes" => chr(0x00d7), # ×
"\\textdiv" => chr(0x00f7), # ÷
"\\textflorin" => chr(0x0192), # ƒ
"\\textasciibreve" => chr(0x0306), # ̆
"\\textasciicaron" => chr(0x030c), # ̌
"\\textbaht" => chr(0x0e3f), # ฿
"\\textnospace" => chr(0x200b), # ​
"\\textendash" => chr(0x2013), # –
"\\textemdash" => chr(0x2014), # —
"\\textbardbl" => chr(0x2016), # ‖
"\\textquoteleft" => chr(0x2018), # ‘
"\\textquoteright" => chr(0x2019), # ’
"\\textquotedblleft" => chr(0x201c), # “
"\\textquotedblright" => chr(0x201d), # ”
"\\textdagger" => chr(0x2020), # †
"\\textdaggerdbl" => chr(0x2021), # ‡
"\\textbullet" => chr(0x2022), # •
"\\textellipsis" => chr(0x2026), # …
"\\textperthousand" => chr(0x2030), # ‰
"\\textpertenthousand" => chr(0x2031), # ‱
"\\textacutedbl" => chr(0x2033), # ″
"\\textasciigrave" => chr(0x2035), # ‵
"\\textgravedbl" => chr(0x2036), # ‶
"\\textreferencemark" => chr(0x203b), # ※
"\\textinterrobang" => chr(0x203d), # ‽
"\\textfractionsolidus" => chr(0x2044), # ⁄
"\\textlquill" => chr(0x2045), # ⁅
"\\textrquill" => chr(0x2046), # ⁆
"\\textasteriskcentered" => chr(0x204e), # ⁎
"\\textcolonmonetary" => chr(0x20a1), # ₡
"\\textfrenchfranc" => chr(0x20a3), # ₣
"\\textlira" => chr(0x20a4), # ₤
"\\textnaira" => chr(0x20a6), # ₦
"\\textwon" => chr(0x20a9), # ₩
"\\textdong" => chr(0x20ab), # ₫
"\\texteuro" => chr(0x20ac), # €
"\\textpeso" => chr(0x20b1), # ₱
"\\textcelsius" => chr(0x2103), # ℃
"\\textnumero" => chr(0x2116), # №
"\\textcircledP" => chr(0x2117), # ℗
"\\textrecipe" => chr(0x211e), # ℞
"\\textservicemark" => chr(0x2120), # ℠
"\\texttrademark" => chr(0x2122), # ™
"\\textohm" => chr(0x2126), # Ω
"\\textmho" => chr(0x2127), # ℧
"\\textestimated" => chr(0x212e), # ℮
"\\textleftarrow" => chr(0x2190), # ←
"\\textuparrow" => chr(0x2191), # ↑
"\\textrightarrow" => chr(0x2192), # →
"\\textdownarrow" => chr(0x2193), # ↓
"\\textsurd" => chr(0x221a), # √
"\\textasciicircum" => chr(0x2303), # ⌃
"\\textvisiblespace" => chr(0x2423), # ␣
"\\textopenbullet" => chr(0x25e6), # ◦
"\\textbigcircle" => chr(0x25ef), # ◯
"\\textmusicalnote" => chr(0x266a), # ♪
"\\textlangle" => chr(0x3008), # 〈
"\\textrangle" => chr(0x3009), # 〉

);

%GREEK = %TEX_GREEK = ();
{
	my $i = 0;
	for(qw( alpha beta gamma delta epsilon zeta eta theta iota kappa lambda mu nu xi omicron pi rho varsigma sigma tau upsilon phi chi psi omega )) {
		# lowercase
		$GREEK{$TEX_GREEK{"\\$_"} = chr(0x3b1+$i)} = "\\ensuremath{\\$_}";
		# uppercase
		$GREEK{$TEX_GREEK{"\\\u$_"} = chr(0x391+$i)} = "\\ensuremath{\\\u$_}";
		$i++;
	}
	# lamda/lambda
	$TEX_GREEK{"\\lamda"} = $LATEX_Escapes_inv{"\\lambda"};
	$TEX_GREEK{"\\Lamda"} = $LATEX_Escapes_inv{"\\Lambda"};
	# Remove Greek letters that aren't available in TeX
	# http://www.artofproblemsolving.com/Wiki/index.php/LaTeX:Symbols
	for(qw( omicron Alpha Beta Epsilon Zeta Eta Iota Kappa Mu Nu Omicron Rho Varsigma Tau Chi Omega ))
	{
		delete $GREEK{delete $TEX_GREEK{"\\$_"}};
	}
}

%MATH_CHARS = (
	# Sets, http://www.unicode.org/charts/PDF/Unicode-4.1/U41-2100.pdf
	'N' => chr(0x2115),
	'R' => chr(0x211d),
	'Z' => chr(0x2124),

);

%MATH = (
	# 'sin' => 'sin', # sin (should be romanised), other trigonometric functions???
	chr(0x2192) => '\\to', # -->
	chr(0x2190) => '\\leftarrow', # <--
	chr(0x2192) => '\\rightarrow', # -->
	chr(0x2248) => '\\approx', # &asymp; Approximately equal to
	chr(0x2272) => '\\lesssim', # May not exist!
	chr(0x2273) => '\\gtrsim', # May not exist!
	chr(0x2243) => '\\simeq',
	chr(0x2264) => '\\leq',
	chr(0x00b1) => '\\pm', # &plusmn; Plus-minus
	chr(0x00d7) => '\\times', # &times; Times
	chr(0x2299) => '\\odot', # odot
	chr(0x222b) => '\\int', # integral
	chr(0x221a) => '\\sqrt', # square root
	chr(0x223c) => '\\sim', # tilda/mathematical similar
	chr(0x22c5) => '\\cdot', # dot

    # Relations and Operators
    chr(0x2265) => '\ge', # ≥
    chr(0x2213) => '\mp', # ∓
    chr(0x2260) => '\neq', # ≠
    chr(0x2249) => '\not\approx', # ≉
    chr(0x2218) => '\circ', # ∘
    chr(0x2245) => '\cong', # ≅
    chr(0x2261) => '\equiv', # ≡
    chr(0x2262) => '\not\equiv', # ≢
    chr(0x226E) => '\not<', # ≮
    chr(0x226F) => '\not>', # ≯
    chr(0x2270) => '\not\le', # ≰
    chr(0x2271) => '\not\ge', # ≱

    # Sets and Logic
    chr(0x2205) => '\emptyset', # ∅
    chr(0x2135) => '\aleph', # ℵ
    chr(0x2208) => '\in', # ∈
    chr(0x2136) => '\beth', # ℶ
    chr(0x2209) => '\notin', # ∉
    chr(0x220B) => '\ni', # ∋
    chr(0x2227) => '\wedge', # ∧
    chr(0x220C) => '\not\ni', # ∌
    chr(0x2228) => '\vee', # ∨
    chr(0x2282) => '\subset', # ⊂
    chr(0x22BB) => '\veebar', # ⊻
    chr(0x2286) => '\subseteq', # ⊆
    chr(0x2200) => '\forall', # ∀
    chr(0x2284) => '\not\subset', # ⊄
    chr(0x2203) => '\exists', # ∃
    chr(0x2288) => '\not\subseteq', # ⊈
    chr(0x22A4) => '\top', # ⊤
    chr(0x228A) => '\subsetneq', # ⊊
    chr(0x22A5) => '\bot', # ⊥
    chr(0x228B) => '\supsetneq', # ⊋
    chr(0x2234) => '\therefore', # ∴
    chr(0x2283) => '\supset', # ⊃
    chr(0x22A2) => '\vdash', # ⊢
    chr(0x2287) => '\supseteq', # ⊇
    chr(0x22A8) => '\models', # ⊨
    chr(0x222A) => '\cup', # ∪
    chr(0x25A1) => '\Box', # □
    chr(0x2229) => '\cap', # ∩
    chr(0x22C3) => '\bigcup', # ⋃
    chr(0x22C2) => '\bigcap', # ⋂
    chr(0x2216) => '\setminus', # ∖

    # Geometry
    chr(0x2220) => '\angle', # ∠
    chr(0x25B3) => '\triangle', # △
    chr(0x22A5) => '\perp', # ⊥
    chr(0x2225) => '\parallel', # ∥
    chr(0x2245) => '\cong', # ≅

    # Analysis
    chr(0x221E) => '\infty', # ∞
    chr(0x230A) => '\lfloor', # ⌊
    chr(0x0394) => '\Delta', # Δ
    chr(0x230B) => '\rfloor', # ⌋
    chr(0x2207) => '\nabla', # ∇
    chr(0x2308) => '\lceil', # ⌈
    chr(0x2202) => '\partial', # ∂
    chr(0x2309) => '\rceil', # ⌉
    chr(0x2211) => '\sum', # ∑
    #chr(0x2225) => '\|', # ∥
    chr(0x220F) => '\prod', # ∏
    chr(0x27E8) => '\langle', # ⟨
    chr(0x27E9) => '\rangle', # ⟩
    chr(0x222C) => '\iint', # ∬
    #chr(0x2032) => q"'", # ′
    chr(0x222D) => '\iiint', # ∭
    chr(0x2A0C) => '\iiiint', # ⨌
    #chr(0x2034) => q"'''", # ‴
    chr(0x222E) => '\oint', # ∮
    chr(0x211C) => '\Re', # ℜ
    chr(0x2111) => '\Im', # ℑ
    chr(0x2118) => '\wp', # ℘

    # Algebra
    chr(0x2295) => '\oplus', # ⊕
    chr(0x2A01) => '\bigoplus', # ⨁
    chr(0x2297) => '\otimes', # ⊗
    chr(0x2A02) => '\bigotimes', # ⨂
    chr(0x25C3) => '\triangleleft', # ◃
    chr(0x22B4) => '\unlhd', # ⊴
    chr(0x22CA) => '\rtimes', # ⋊
    chr(0x2240) => '\wr', # ≀

    # Arrows
    chr(0x21D2) => '\Rightarrow', # ⇒
    chr(0x21D0) => '\Leftarrow', # ⇐
    chr(0x21D1) => '\Uparrow', # ⇑
    chr(0x21D3) => '\Downarrow', # ⇓
    chr(0x2196) => '\nwarrow', # ↖
    chr(0x2197) => '\nearrow', # ↗
    chr(0x2198) => '\searrow', # ↘
    chr(0x2199) => '\swarrow', # ↙
    chr(0x21A6) => '\mapsto', # ↦
    chr(0x2194) => '\leftrightarrow', # ↔
    chr(0x21D4) => '\Leftrightarrow', # ⇔
    chr(0x21A3) => '\rightarrowtail', # ↣
    chr(0x21A0) => '\twoheadrightarrow', # ↠
    chr(0x21AA) => '\hookrightarrow', # ↪

    # Dots
    chr(0x22EF) => '\cdots', # ⋯
    chr(0x22F1) => '\ddots', # ⋱
    chr(0x22EE) => '\vdots', # ⋮

    chr(0x1d538) => '\mathbb{A}', # 𝔸
    chr(0x1d552) => '\mathbb{a}', # 𝕒
    chr(0x1d539) => '\mathbb{B}', # 𝔹
    chr(0x1d553) => '\mathbb{b}', # 𝕓
    chr(0x2102) => '\mathbb{C}', # ℂ
    chr(0x1d554) => '\mathbb{c}', # 𝕔
    chr(0x1d7d8) => '\mathbb{0}', # 𝟘
    chr(0x1d7d9) => '\mathbb{1}', # 𝟙
    chr(0x1d7da) => '\mathbb{2}', # 𝟚

    chr(0x1d504) => '\mathfrak{A}', # 𝔄
    chr(0x1d51e) => '\mathfrak{a}', # 𝔞
    chr(0x1d505) => '\mathfrak{B}', # 𝔅
    chr(0x1d51f) => '\mathfrak{b}', # 𝔟
    chr(0x212d) => '\mathfrak{C}', # ℭ
    chr(0x1d520) => '\mathfrak{c}', # 𝔠

    chr(0x1d49c) => '\mathcal{A}', # 𝒜
    chr(0x1d4b6) => '\mathcal{a}', # 𝒶
    chr(0x212c) => '\mathcal{B}', # ℬ
    chr(0x1d4b7) => '\mathcal{b}', # 𝒷
    chr(0x1d49e) => '\mathcal{C}', # 𝒞
    chr(0x1d4b8) => '\mathcal{c}', # 𝒸

    # var greek characters
    chr(0x03B5) => '\varepsilon', # ε
    chr(0x03F0) => '\varkappa', # ϰ
    chr(0x03C6) => '\varphi', # φ
    chr(0x03D6) => '\varpi', # ϖ
    chr(0x03F1) => '\varrho', # ϱ
    chr(0x03C2) => '\varsigma', # ς
    chr(0x03D1) => '\vartheta', # ϑ
);

%ASTRONOMY = (
    chr(0x263F) => '\mercury', # ☿
    chr(0x2648) => '\aries', # ♈
    chr(0x2640) => '\venus', # ♀
    chr(0x2649) => '\taurus', # ♉
    chr(0x2295) => '\earth', # ⊕
    chr(0x264A) => '\gemini', # ♊
    chr(0x2642) => '\mars', # ♂
    chr(0x264B) => '\cancer', # ♋
    chr(0x2643) => '\jupiter', # ♃
    chr(0x264C) => '\leo', # ♌
    chr(0x2644) => '\saturn', # ♄
    chr(0x264D) => '\virgo', # ♍
    chr(0x26E2) => '\uranus', # ⛢
    chr(0x264E) => '\libra', # ♎
    chr(0x2646) => '\neptune', # ♆
    chr(0x264F) => '\scorpio', # ♏
    chr(0x2647) => '\pluto', # ♇
    chr(0x2650) => '\sagittarius', # ♐
    chr(0x2609) => '\astrosun', # ☉
    chr(0x2651) => '\capricornus', # ♑
    chr(0x263D) => '\rightmoon', # ☽
    chr(0x2652) => '\aquarius', # ♒
    chr(0x263E) => '\leftmoon', # ☾
    chr(0x2653) => '\pisces', # ♓
    chr(0x260A) => '\ascnode', # ☊
    chr(0x260B) => '\descnode', # ☋
    chr(0x260C) => '\conjunction', # ☌
    chr(0x260D) => '\opposition', # ☍

);

%GAMES = (
    chr(0x265D) => '\blackbishop', # ♝
    chr(0x2680) => '\epsdice{1}', # ⚀
    chr(0x265A) => '\blackking', # ♚
    chr(0x2681) => '\epsdice{2}', # ⚁
    chr(0x265E) => '\blackknight', # ♞
    chr(0x2682) => '\epsdice{3}', # ⚂
    chr(0x265F) => '\blackpawn', # ♟
    chr(0x2683) => '\epsdice{4}', # ⚃
    chr(0x265B) => '\blackqueen', # ♛
    chr(0x2684) => '\epsdice{5}', # ⚄
    chr(0x265C) => '\blackrook', # ♜
    chr(0x2685) => '\epsdice{6}', # ⚅
    chr(0x2657) => '\whitebishop', # ♗
    chr(0x2663) => '\clubsuit', # ♣
    chr(0x2654) => '\whiteking', # ♔
    chr(0x2661) => '\heartsuit', # ♡
    chr(0x2658) => '\whiteknight', # ♘
    chr(0x2660) => '\spadesuit', # ♠
    chr(0x2659) => '\whitepawn', # ♙
    chr(0x2662) => '\diamondsuit', # ♢
    chr(0x2655) => '\whitequeen', # ♕
    chr(0x2656) => '\whiterook', # ♖
);

%KEYS = (
    chr(0x2318) => '\cmdkey', # ⌘
    chr(0x21E5) => '\tabkey', # ⇥
    chr(0x2325) => '\optkey', # ⌥
    chr(0x21E4) => '\revtabkey', # ⇤
    chr(0x21E7) => '\shiftkey', # ⇧
    chr(0x238B) => '\esckey', # ⎋
    chr(0x232B) => '\delkey', # ⌫
    chr(0x23CE) => '\returnkey', # ⏎
    chr(0x21EA) => '\capslockkey', # ⇪
    chr(0x2324) => '\enterkey', # ⌤
    chr(0x23CF) => '\ejectkey', # ⏏
    chr(0x2326) => '\rightdelkey', # ⌦
);

# International Phonetic Alphabet
%IPA = (
    # Plosives
    chr(0x0062) => 'b', # b    voiced bilabial plosive
    chr(0x0063) => 'c', # c    voiceless palatal plosive (e.g. Hungarian ty)
    chr(0x0064) => 'd', # d    voiced dental/alveolar plosive
    chr(0x0256) => '\textrtaild', # ɖ    voiced retroflex plosive
    chr(0x0067) => 'g', # g    voiced velar plosive
    chr(0x0262) => '\textscg', # ɢ    voiced uvular plosive
    chr(0x006B) => 'k', # k    voiceless velar plosive
    chr(0x0070) => 'p', # p    voiceless bilabial plosive
    chr(0x0071) => 'q', # q    voiceless uvular plosive
    chr(0x0074) => 't', # t    voiceless dental/alveolar plosive
    chr(0x0288) => '\textrtailt', # ʈ    voiceless retroflex plosive
    chr(0x0294) => '\textglotstop', # ʔ    glottal plosive
    chr(0x02A1) => '\textbarglotstop', # ʡ    epiglottal plosive

    # Nasals
    chr(0x006D) => 'm', # m    voiced bilabial nasal
    chr(0x0271) => '\textltailm', # ɱ    voiced labiodental nasal
    chr(0x006E) => 'n', # n    voiced dental/alveolar nasal
    chr(0x0273) => '\textrtailn', # ɳ    voiced retroflex nasal
    chr(0x0272) => '\textltailn', # ɲ    voiced palatal nasal
    chr(0x0274) => '\textscn', # ɴ    voiced uvular nasal

    # Fricatives & Approximants
    chr(0x03B2) => '\textbeta', # β    voiced bilabial fricative
    chr(0x0255) => '\textctc', # ɕ    voicelss alveolo-palatal median laminal fricative
    chr(0x0066) => 'f', # f    voiceless labiodental fricative
    chr(0x0263) => '\textgamma', # ɣ    voiced velar fricative
    chr(0x0068) => 'h', # h    voiceless glottal fricative/approximant
    chr(0x0265) => '\textturnh', # ɥ    voiced rounded palatal median approximant (i.e. rounded [j])
    chr(0x029C) => '\textsch', # ʜ    voiceless epiglottal fricative
    chr(0x0266) => '\texthth', # ɦ    voiced glottal fricative
    chr(0x0267) => '\texththeng', # ɧ    combination of [x] and [ʃ] (e.g. Swedish tj, kj)
    chr(0x006A) => 'j', # j    voiced palatal median approximant
    chr(0x029D) => '\textctj', # ʝ    voiced palatal median fricative
    chr(0x006C) => 'l', # l    voiced alveolar lateral approximant
    chr(0x026D) => '\textrtaill', # ɭ    voiced retroflex lateral approximant
    chr(0x026C) => '\textbeltl', # ɬ    voiceless alveolar lateral fricative
    chr(0x026B) => '\textltilde', # ɫ    velarized voiced alveolar lateral approximant
    chr(0x026E) => '\textlyoghlig', # ɮ    voiced alveolar lateral fricative
    chr(0x029F) => '\textscl', # ʟ    voiced velar lateral approximant
    chr(0x0270) => '\textturnmrleg', # ɰ    voiced velar median approximant
    chr(0x03B8) => '\texttheta', # θ    voiceless interdental median fricative
    chr(0x0278) => '\textphi', # ɸ    voiceless bilabial fricative
    chr(0x0072) => 'r', # r    voiced apico-alveolar trill
    chr(0x0279) => '\textturnr', # ɹ    voiced alveolar/postalveolar approximant
    chr(0x027A) => '\textturnlonglegr', # ɺ    voiced alveolar lateral flap
    chr(0x027E) => '\textfishhookr', # ɾ    voiced alveolar flap
    chr(0x027B) => '\textturnrrtail', # ɻ    voiced retroflex approximant
    chr(0x0280) => '\textscr', # ʀ    voiced uvular trill or flap
    chr(0x0281) => '\textinvscr', # ʁ    voiced uvular fricative or approximant (e.g. French r)
    chr(0x027D) => '\textrtailr', # ɽ    voiced retroflex flap
    chr(0x0073) => 's', # s    voiceless alveolar median fricative
    chr(0x0282) => '\textrtails', # ʂ    voiceless retroflex median fricative
    chr(0x0283) => '\textesh', # ʃ    voiceless palato-alveolar median laminal fricative
    chr(0x0076) => 'v', # v    voiced labiodental fricative
    chr(0x028B) => '\textscriptv', # ʋ    voiced labiodental approximant
    chr(0x0077) => 'w', # w    voiced rounded labial-velar approximant
    chr(0x028D) => '\textturnw', # ʍ    voiceless rounded labial-velar approximant/fricative (i.e. voiceless [w])
    chr(0x0078) => 'x', # x    voiceless velar median fricative
    chr(0x03C7) => '\textchi', # χ    voicelss uvular median fricative
    chr(0x028E) => '\textturny', # ʎ    voiced palatal lateral approximant (e.g. Italian gl)
    chr(0x007A) => 'z', # z    voiced alveolar/dental median fricative
    chr(0x0290) => '\textrtailz', # ʐ    voiced retroflex median fricative
    chr(0x0291) => '\textctz', # ʑ    voiced alveolo-palatal median laminal fricative
    chr(0x0292) => '\textyogh', # ʒ    voiced palato-alveolar median laminal fricative
    chr(0x0295) => '\textrevglotstop', # ʕ    voiced pharyngeal fricative
    chr(0x02A2) => '\textbarrevglotstop', # ʢ    voiced epiglottal fricative

    # Vowels
    chr(0x0061) => 'a', # a    unrounded front low vowel (cardinal vowel no. 4)
    chr(0x0250) => '\textturna', # ɐ    unrounded central low vowel
    chr(0x0251) => '\textscripta', # ɑ    unrounded back low vowel (cardinal vowel no. 5)
    chr(0x0252) => '\textturnscripta', # ɒ    rounded back low vowel (cardinal vowel no. 13)
    chr(0x0065) => 'e', # e    unrounded front high-mid vowel (cardinal vowel no. 2)
    chr(0x0259) => '\textschwa', # ə    unrounded central mid vowel
    chr(0x0258) => '\textreve', # ɘ    unrounded central high-mid vowel
    chr(0x025A) => '\textrighthookschwa', # ɚ    rhotacized [ə]
    chr(0x025B) => '\textepsilon', # ɛ    unrounded front low-mid vowel (cardinal vowel no. 3)
    chr(0x025C) => '\textrevepsilon', # ɜ    unrounded central low-mid vowel
    chr(0x025D) => '\textrhookrevepsilon', # ɝ    rhotacized [ɜ]
    chr(0x025E) => '\textcloserevepsilon', # ɞ    rounded central low-mid vowel
    chr(0x0264) => '\textbabygamma', # ɤ    unrounded back high-mid vowel (cardinal vowel no. 15)
    chr(0x026F) => '\textturnm', # ɯ    unrounded back high vowel (cardinal vowel no. 16)
    chr(0x0069) => 'i', # i    unrounded front high vowel (cardinal vowel no. 1)
    chr(0x03B9) => '\textiota', # ι    unrounded front semi-high vowel
    chr(0x026A) => '\textsci', # ɪ    synonym for [ι]
    chr(0x0268) => '\textbari', # ɨ    unrounded central high vowel (cardinal vowel no. 17)
    chr(0x006F) => 'o', # o    rounded back high-mid vowel (cardinal vowel no. 7)
    chr(0x0275) => '\textbaro', # ɵ    rounded central high-mid vowel
    chr(0x0276) => '\textscoelig', # ɶ    rounded front low vowel (cardinal vowel no. 12)
    chr(0x0254) => '\textopeno', # ɔ    rounded back low-md vowel (cardinal vowel no. 6)
    chr(0x0075) => 'u', # u    rounded back high vowel (cardinal vowel no. 8)
    chr(0x0289) => '\textbaru', # ʉ    rounded central high vowel (cardinal vowel no. 18)
    chr(0x028A) => '\textupsilon', # ʊ    rounded back semi-high vowel
    chr(0x028C) => '\textturnv', # ʌ    unrounded back low-mid vowel (cardinal vowel no. 14)
    chr(0x0079) => 'y', # y    rounded front high vowel (cardinal vowel no. 9)
    chr(0x028F) => '\textscy', # ʏ    rounded front semi-high vowel

    # Implosives & Clicks
    chr(0x0253) => '\texthtb', # ɓ    voiced glottalic ingressive bilabial stop
    chr(0x0257) => '\texthtd', # ɗ    voiced glottalic ingressive dental/postalveolar stop
    chr(0x0260) => '\texthtg', # ɠ    voiced glottalic ingressive velar stop
    chr(0x029B) => '\texthtscg', # ʛ    voiced glottalic ingressive uvular stop
    chr(0x0298) => '\textbullseye', # ʘ    bilabial click
    chr(0x01C0) => '\textpipe', # ǀ    dental click
    chr(0x01C1) => '\textdoublepipe', # ǁ    lateral click
    chr(0x0021) => '!', # !    alveloar/postalveolar click
);

# Cyrillic alphabet (russian part only)
%CYR = (
chr(0X0400) => '\`\CYRE', # Ѐ
chr(0X0401) => '\CYRYO', # Ё
chr(0X0402) => '\CYRDJE', # Ђ
chr(0X0403) => '\'\CYRG', # Ѓ
chr(0X0404) => '\CYRIE', # Є
chr(0X0405) => '\CYRDZE', # Ѕ
chr(0X0406) => '\CYRII', # І
chr(0X0407) => '\CYRYI', # Ї
chr(0X0408) => '\CYRJE', # Ј
chr(0X0409) => '\CYRLJE', # Љ
chr(0X040A) => '\CYRNJE', # Њ
chr(0X040B) => '\CYRTSHE', # Ћ
chr(0X040C) => '\'\CYRK', # Ќ
chr(0X040D) => '\`\CYRI', # Ѝ
chr(0X040E) => '\CYRUSHRT', # Ў
chr(0X040F) => '\CYRDZHE', # Џ
chr(0X0410) => '\CYRA', # А
chr(0X0411) => '\CYRB', # Б
chr(0X0412) => '\CYRV', # В
chr(0X0413) => '\CYRG', # Г
chr(0X0414) => '\CYRD', # Д
chr(0X0415) => '\CYRE', # Е
chr(0X0416) => '\CYRZH', # Ж
chr(0X0417) => '\CYRZ', # З
chr(0X0418) => '\CYRI', # И
chr(0X0419) => '\CYRISHRT', # Й
chr(0X041A) => '\CYRK', # К
chr(0X041B) => '\CYRL', # Л
chr(0X041C) => '\CYRM', # М
chr(0X041D) => '\CYRN', # Н
chr(0X041E) => '\CYRO', # О
chr(0X041F) => '\CYRP', # П
chr(0X0420) => '\CYRR', # Р
chr(0X0421) => '\CYRS', # С
chr(0X0422) => '\CYRT', # Т
chr(0X0423) => '\CYRU', # У
chr(0X0424) => '\CYRF', # Ф
chr(0X0425) => '\CYRH', # Х
chr(0X0426) => '\CYRC', # Ц
chr(0X0427) => '\CYRCH', # Ч
chr(0X0428) => '\CYRSH', # Ш
chr(0X0429) => '\CYRSHCH', # Щ
chr(0X042A) => '\CYRHRDSN', # Ъ
chr(0X042B) => '\CYRERY', # Ы
chr(0X042C) => '\CYRSFTSN', # Ь
chr(0X042D) => '\CYREREV', # Э
chr(0X042E) => '\CYRYU', # Ю
chr(0X042F) => '\CYRYA', # Я
chr(0X0430) => '\cyra', # а
chr(0X0431) => '\cyrb', # б
chr(0X0432) => '\cyrv', # в
chr(0X0433) => '\cyrg', # г
chr(0X0434) => '\cyrd', # д
chr(0X0435) => '\cyre', # е
chr(0X0436) => '\cyrzh', # ж
chr(0X0437) => '\cyrz', # з
chr(0X0438) => '\cyri', # и
chr(0X0439) => '\cyrishrt', # й
chr(0X043A) => '\cyrk', # к
chr(0X043B) => '\cyrl', # л
chr(0X043C) => '\cyrm', # м
chr(0X043D) => '\cyrn', # н
chr(0X043E) => '\cyro', # о
chr(0X043F) => '\cyrp', # п
chr(0X0440) => '\cyrr', # р
chr(0X0441) => '\cyrs', # с
chr(0X0442) => '\cyrt', # т
chr(0X0443) => '\cyru', # у
chr(0X0444) => '\cyrf', # ф
chr(0X0445) => '\cyrh', # х
chr(0X0446) => '\cyrc', # ц
chr(0X0447) => '\cyrch', # ч
chr(0X0448) => '\cyrsh', # ш
chr(0X0449) => '\cyrshch', # щ
chr(0X044A) => '\cyrhrdsn', # ъ
chr(0X044B) => '\cyrery', # ы
chr(0X044C) => '\cyrsftsn', # ь
chr(0X044D) => '\cyrerev', # э
chr(0X044E) => '\cyryu', # ю
chr(0X044F) => '\cyrya', # я
chr(0X0450) => '\`\cyre', # ѐ
chr(0X0451) => '\cyryo', # ё
chr(0X0452) => '\cyrdje', # ђ
chr(0X0453) => '\'\cyrg', # ѓ
chr(0X0454) => '\cyrie', # є
chr(0X0455) => '\cyrdze', # ѕ
chr(0X0456) => '\cyrii', # і
chr(0X0457) => '\cyryi', # ї
chr(0X0458) => '\cyrje', # ј
chr(0X0459) => '\cyrlje', # љ
chr(0X045A) => '\cyrnje', # њ
chr(0X045B) => '\cyrtshe', # ћ
chr(0X045C) => '\'\cyrk', # ќ
chr(0X045D) => '\`\cyri', # ѝ
chr(0X045E) => '\cyrushrt', # ў
chr(0X045F) => '\cyrdzhe', # џ
chr(0X0460) => '\CYROMGA', # Ѡ
chr(0X0461) => '\cyromga', # ѡ
chr(0X0462) => '\CYRYAT', # Ѣ
chr(0X0463) => '\cyryat', # ѣ
chr(0X0464) => '\CYRIOTEST', # Ѥ
chr(0X0465) => '\cyriotest', # ѥ
chr(0X0466) => '\CYRLYUS', # Ѧ
chr(0X0467) => '\cyrlyus', # ѧ
chr(0X0468) => '\CYRIOTLYUS', # Ѩ
chr(0X0469) => '\cyriotlyus', # ѩ
chr(0X046A) => '\CYRBYUS', # Ѫ
chr(0X046B) => '\cyrbyus', # ѫ
chr(0X046C) => '\CYRIOTBYUS', # Ѭ
chr(0X046D) => '\cyriotbyus', # ѭ
chr(0X046E) => '\CYRKSI', # Ѯ
chr(0X046F) => '\cyrksi', # ѯ
chr(0X0470) => '\CYRPSI', # Ѱ
chr(0X0471) => '\cyrpsi', # ѱ
chr(0X0472) => '\CYRFITA', # Ѳ
chr(0X0473) => '\cyrfita', # ѳ
chr(0X0474) => '\CYRIZH', # Ѵ
chr(0X0475) => '\cyrizh', # ѵ
chr(0X0476) => '\C\CYRIZH', # Ѷ
chr(0X0477) => '\C\cyrizh', # ѷ
chr(0X0478) => '\CYRVARUK', # Ѹ
chr(0X0479) => '\cyrvaruk', # ѹ
chr(0X047A) => '\CYROMRND', # Ѻ
chr(0X047B) => '\cyromrnd', # ѻ
chr(0X047C) => '\CYROMTLO', # Ѽ
chr(0X047D) => '\cyromtlo', # ѽ
chr(0X047E) => '\CYROT', # Ѿ
chr(0X047F) => '\cyrot', # ѿ
chr(0X0480) => '\CYRKOPPA', # Ҁ
chr(0X0481) => '\cyrkoppa', # ҁ
chr(0X0482) => '\CYRthousands{\empty}', # ҂
chr(0X048C) => '\CYRSEMISFTSN', # Ҍ
chr(0X048D) => '\cyrsemisftsn', # ҍ
chr(0X048E) => '\CYRRTICK', # Ҏ
chr(0X048F) => '\cyrrtick', # ҏ
chr(0X0490) => '\CYRGUP', # Ґ
chr(0X0491) => '\cyrgup', # ґ
chr(0X0492) => '\CYRGHCRS', # Ғ
chr(0X0493) => '\cyrghcrs', # ғ
chr(0X0494) => '\CYRGHK', # Ҕ
chr(0X0495) => '\cyrghk', # ҕ
chr(0X0496) => '\CYRZHDSC', # Җ
chr(0X0497) => '\cyrzhdsc', # җ
chr(0X0498) => '\CYRZDSC', # Ҙ
chr(0X0499) => '\cyrzdsc', # ҙ
chr(0X049A) => '\CYRKDSC', # Қ
chr(0X049B) => '\cyrkdsc', # қ
chr(0X049C) => '\CYRKVCRS', # Ҝ
chr(0X049D) => '\cyrkvcrs', # ҝ
chr(0X049E) => '\CYRKHCRS', # Ҟ
chr(0X049F) => '\cyrkhcrs', # ҟ
chr(0X04A0) => '\CYRKBEAK', # Ҡ
chr(0X04A1) => '\cyrkbeak', # ҡ
chr(0X04A2) => '\CYRNDSC', # Ң
chr(0X04A3) => '\cyrndsc', # ң
chr(0X04A4) => '\CYRNG', # Ҥ
chr(0X04A5) => '\cyrng', # ҥ
chr(0X04A6) => '\CYRPHK', # Ҧ
chr(0X04A7) => '\cyrphk', # ҧ
chr(0X04A8) => '\CYRABHHA', # Ҩ
chr(0X04A9) => '\cyrabhha', # ҩ
chr(0X04AA) => '\CYRSDSC', # Ҫ
chr(0X04AB) => '\cyrsdsc', # ҫ
chr(0X04AC) => '\CYRTDSC', # Ҭ
chr(0X04AD) => '\cyrtdsc', # ҭ
chr(0X04AE) => '\CYRY', # Ү
chr(0X04AF) => '\cyry', # ү
chr(0X04B0) => '\CYRYHCRS', # Ұ
chr(0X04B1) => '\cyryhcrs', # ұ
chr(0X04B2) => '\CYRHDSC', # Ҳ
chr(0X04B3) => '\cyrhdsc', # ҳ
chr(0X04B4) => '\CYRTETSE', # Ҵ
chr(0X04B5) => '\cyrtetse', # ҵ
chr(0X04B6) => '\CYRCHRDSC', # Ҷ
chr(0X04B7) => '\cyrchrdsc', # ҷ
chr(0X04B8) => '\CYRCHVCRS', # Ҹ
chr(0X04B9) => '\cyrchvcrs', # ҹ
chr(0X04BA) => '\CYRSHHA', # Һ
chr(0X04BB) => '\cyrshha', # һ
chr(0X04BC) => '\CYRABHCH', # Ҽ
chr(0X04BD) => '\cyrabhch', # ҽ
chr(0X04BE) => '\CYRABHCHDSC', # Ҿ
chr(0X04BF) => '\cyrabhchdsc', # ҿ
chr(0X04C0) => '\CYRpalochka', # Ӏ
chr(0X04C1) => '\U\CYRZH', # Ӂ
chr(0X04C2) => '\U\cyrzh', # ӂ
chr(0X04C3) => '\CYRKHK', # Ӄ
chr(0X04C4) => '\cyrkhk', # ӄ
chr(0X04C7) => '\CYRNHK', # Ӈ
chr(0X04C8) => '\cyrnhk', # ӈ
chr(0X04CB) => '\CYRCHLDSC', # Ӌ
chr(0X04CC) => '\cyrchldsc', # ӌ
chr(0X04D0) => '\U\CYRA', # Ӑ
chr(0X04D1) => '\U\cyra', # ӑ
chr(0X04D2) => '\"\CYRA', # Ӓ
chr(0X04D3) => '\"\cyra', # ӓ
chr(0X04D4) => '\CYRAE', # Ӕ
chr(0X04D5) => '\cyrae', # ӕ
chr(0X04D6) => '\U\CYRE', # Ӗ
chr(0X04D7) => '\U\cyre', # ӗ
chr(0X04D8) => '\CYRSCHWA', # Ә
chr(0X04D9) => '\cyrschwa', # ә
chr(0X04DA) => '\"\CYRSCHWA', # Ӛ
chr(0X04DB) => '\"\cyrschwa', # ӛ
chr(0X04DC) => '\"\CYRZH', # Ӝ
chr(0X04DD) => '\"\cyrzh', # ӝ
chr(0X04DE) => '\"\CYRZ', # Ӟ
chr(0X04DF) => '\"\cyrz', # ӟ
chr(0X04E0) => '\CYRABHDZE', # Ӡ
chr(0X04E1) => '\cyrabhdze', # ӡ
chr(0X04E2) => '\=\CYRI', # Ӣ
chr(0X04E3) => '\=\cyri', # ӣ
chr(0X04E4) => '\"\CYRI', # Ӥ
chr(0X04E5) => '\"\cyri', # ӥ
chr(0X04E6) => '\"\CYRO', # Ӧ
chr(0X04E7) => '\"\cyro', # ӧ
chr(0X04E8) => '\CYROTLD', # Ө
chr(0X04E9) => '\cyrotld', # ө
chr(0X04EA) => '\"\CYROTLD', # Ӫ
chr(0X04EB) => '\"\cyrotld', # ӫ
chr(0X04EC) => '\"\CYREREV', # Ӭ
chr(0X04ED) => '\"\cyrerev', # ӭ
chr(0X04EE) => '\=\CYRU', # Ӯ
chr(0X04EF) => '\=\cyru', # ӯ
chr(0X04F0) => '\"\CYRU', # Ӱ
chr(0X04F1) => '\"\cyru', # ӱ
chr(0X04F2) => '\H\CYRU', # Ӳ
chr(0X04F3) => '\H\cyru', # ӳ
chr(0X04F4) => '\"\CYRCH', # Ӵ
chr(0X04F5) => '\"\cyrch', # ӵ
chr(0X04F8) => '\"\CYRERY', # Ӹ
chr(0X04F9) => '\"\cyrery', # ӹ
);

# derived mappings
use vars qw( %CHAR_MAP $CHAR_MAP_RE );

%CHAR_MAP = (%CHARS, %ACCENTED_CHARS, %GREEK, %CYR);
for(keys %MATH)
{
	$CHAR_MAP{$_} ||= '$' . $MATH{$_} . '$';
}
for(keys %MATH_CHARS)
{
	$CHAR_MAP{$MATH_CHARS{$_}} ||= '$' . $_ . '$';
}

$CHAR_MAP_RE = '[' . join('', map { quotemeta($_) } sort { length($b) <=> length($a) } keys %CHAR_MAP) . ']';

use vars qw( $RESERVED_RE $BIBTEX_RESERVED_RE );

$RESERVED_RE = '[' . join('', map { quotemeta($_) } sort { length($b) <=> length($a) } keys %RESERVED) . ']';
$BIBTEX_RESERVED_RE = '[' . join('', map { quotemeta($_) } sort { length($b) <=> length($a) } keys %BIBTEX_RESERVED) . ']';

use vars qw( %MACROS $MACROS_RE );

%MACROS = (
	reverse(%RESERVED),
	reverse(%CHARS),
	reverse(%ACCENTED_CHARS),
	reverse(%MATH),
	reverse(%ASTRONOMY),
	reverse(%CYR),
	reverse(%GAMES),
	reverse(%KEYS),
	reverse(%IPA),
	%TEX_GREEK,
	%LATEX_MACROS
);

$MACROS_RE = join('|', map { "(?:$_)" } map { quotemeta($_) } sort { length($b) <=> length($a) } keys %MACROS);

use vars qw( $MATH_CHARS_RE );

$MATH_CHARS_RE = '[' . join('', map { quotemeta($_) } sort { length($b) <=> length($a) } keys %MATH_CHARS) . ']';

1;
