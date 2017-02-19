#! /usr/bin/env perl

use strict;
use warnings;
use utf8;

use Term::ReadKey;


my %digraphs = (
    '  '    =>  ' ',
    '!I'    =>  '¡',
    'Ct'    =>  '¢',
    'Pd'    =>  '£',
    'Cu'    =>  '¤',
    'Ye'    =>  '¥',
    'BB'    =>  '¦',
    'SE'    =>  '§',
    "':"    =>  '¨',
    '-a'    =>  'ª',
    'st'    =>  '★',
    'mu'    =>  '×',

    'no'    =>  '¬',
    'an'    =>  '∧',
    'or'    =>  '∨',
    'xo'    =>  '⊻',
    'fc'    =>  '∘',
    '!='    =>  '≠',

    'al'    =>  '←',
    'ar'    =>  '→',
    'au'    =>  '↑',
    'ad'    =>  '↓',
    'Al'    =>  '⇐',
    'Ar'    =>  '⇒',
    'Au'    =>  '⇑',
    'Ad'    =>  '⇓',

    '--'    =>  '—',
    '-.'    =>  '‐',
    '__'    =>  '＿',
    '*>'    =>  '‣',
    '*.'    =>  '•',

    'OA'    =>  'Ⓐ',
    'OB'    =>  'Ⓑ',
    'OC'    =>  'Ⓒ',
    'OD'    =>  'Ⓓ',
    'OE'    =>  'Ⓔ',
    'OF'    =>  'Ⓕ',
    'OG'    =>  'Ⓖ',
    'OH'    =>  'Ⓗ',
    'OI'    =>  'Ⓘ',
    'OJ'    =>  'Ⓙ',
    'OK'    =>  'Ⓚ',
    'OL'    =>  'Ⓛ',
    'OM'    =>  'Ⓜ',
    'ON'    =>  'Ⓝ',
    'OO'    =>  'Ⓞ',
    'OP'    =>  'Ⓟ',
    'OQ'    =>  'Ⓠ',
    'OR'    =>  'Ⓡ',
    'OS'    =>  'Ⓢ',
    'OT'    =>  'Ⓣ',
    'OU'    =>  'Ⓤ',
    'OV'    =>  'Ⓥ',
    'OW'    =>  'Ⓦ',
    'OX'    =>  'Ⓧ',
    'OY'    =>  'Ⓨ',
    'OZ'    =>  'Ⓩ',
    'Oa'    =>  'ⓐ',
    'Ob'    =>  'ⓑ',
    'Oc'    =>  'ⓒ',
    'Od'    =>  'ⓓ',
    'Oe'    =>  'ⓔ',
    'Of'    =>  'ⓕ',
    'Og'    =>  'ⓖ',
    'Oh'    =>  'ⓗ',
    'Oi'    =>  'ⓘ',
    'Oj'    =>  'ⓙ',
    'Ok'    =>  'ⓚ',
    'Ol'    =>  'ⓛ',
    'Om'    =>  'ⓜ',
    'On'    =>  'ⓝ',
    'Oo'    =>  'ⓞ',
    'Op'    =>  'ⓟ',
    'Oq'    =>  'ⓠ',
    'Or'    =>  'ⓡ',
    'Os'    =>  'ⓢ',
    'Ot'    =>  'ⓣ',
    'Ou'    =>  'ⓤ',
    'Ov'    =>  'ⓥ',
    'Ow'    =>  'ⓦ',
    'Ox'    =>  'ⓧ',
    'Oy'    =>  'ⓨ',
    'Oz'    =>  'ⓩ',
    'O1'    =>  '①',
    'O2'    =>  '②',
    'O3'    =>  '③',
    'O4'    =>  '④',
    'O5'    =>  '⑤',
    'O6'    =>  '⑥',
    'O7'    =>  '⑦',
    'O8'    =>  '⑧',
    'O9'    =>  '⑨',
    'O0'    =>  '⓪',

    'co'    =>  '©',
    're'    =>  '®',

    "'m"    =>  '¯',
    'DG'    =>  '°',
    '+-'    =>  '±',
    '2S'    =>  '²',
    '3S'    =>  '³',
    "''"    =>  '´',
    'my'    =>  'µ',
    'pi'    =>  'π',
    'ee'    =>  'ℯ',
    '.M'    =>  '·',
    "',"    =>  '¸',
    '1S'    =>  '¹',
    '-o'    =>  'º',

    '<<'    =>  '«',
    '>>'    =>  '»',
    '``'    =>  '”',
    '´´'    =>  '“',
    "\"'"    =>  '“',
    '",'    =>  '„',
    '"<'    =>  '«',
    '">'    =>  '»',
    "'<"    =>  "⟨",
    "'>"    =>  "⟩",
    "<("    =>  "⟨",
    ">)"    =>  "⟩",
    "'("    =>  "‚",
    "')"    =>  "‘",
    "\"("   =>  "„",
    "\")"   =>  "“",

    ":="    =>  "≔",

    '14'    =>  '¼',
    '12'    =>  '½',
    '34'    =>  '¾',
    '?I'    =>  '¿',
    'A!'    =>  'À',
    "A'"    =>  'Á',
    'A>'    =>  'Â',
    'A?'    =>  'Ã',
    'A:'    =>  'Ä',
    'AA'    =>  'Å',
    'AE'    =>  'Æ',
    'C,'    =>  'Ç',
    'E!'    =>  'È',
    "E'"    =>  'É',
    'E>'    =>  'Ê',
    'E:'    =>  'Ë',
    'I!'    =>  'Ì',
    "I'"    =>  'Í',
    'I>'    =>  'Î',
    'I:'    =>  'Ï',
    'D-'    =>  'Ð',
    'N?'    =>  'Ñ',
    'O!'    =>  'Ò',
    "O'"    =>  'Ó',
    'O>'    =>  'Ô',
    'O?'    =>  'Õ',
    'O:'    =>  'Ö',
    '*X'    =>  '×',
    'O/'    =>  'Ø',
    'U!'    =>  'Ù',
    "U'"    =>  'Ú',
    'U>'    =>  'Û',
    'U:'    =>  'Ü',
    "Y'"    =>  'Ý',
    'TH'    =>  'Þ',
    '"s'    =>  'ß',
    'a!'    =>  'à',
    "a'"    =>  'á',
    'a>'    =>  'â',
    'a?'    =>  'ã',
    'a:'    =>  'ä',
    'aa'    =>  'å',
    'ae'    =>  'æ',
    'c,'    =>  'ç',
    'e!'    =>  'è',
    "e'"    =>  'é',
    'e>'    =>  'ê',
    'e:'    =>  'ë',
    'i!'    =>  'ì',
    "i'"    =>  'í',
    'i>'    =>  'î',
    'i:'    =>  'ï',
    'd-'    =>  'ð',
    'n?'    =>  'ñ',
    'o!'    =>  'ò',
    "o'"    =>  'ó',
    'o>'    =>  'ô',
    'o?'    =>  'õ',
    'o:'    =>  'ö',
    '-:'    =>  '÷',
    'o/'    =>  'ø',
    'u!'    =>  'ù',
    "u'"    =>  'ú',
    'u>'    =>  'û',
    'u:'    =>  'ü',
    "y'"    =>  'ý',
    'th'    =>  'þ',
    'y:'    =>  'ÿ',
    '"a'    =>  'ä',
    '"o'    =>  'ö',
    '"ü'    =>  'ü',
    '..'    =>  '…',
    'p*'    =>  'π',
    '=~'    =>  '≅',
    '(<'    =>  '⟨',
    ')>'    =>  '⟩',
    '(['    =>  '｢',
    ')]'    =>  '｣',
    '(L'    =>  '⌊',
    ')L'    =>  '⌋',
    '(('    =>  '⸨',
    '))'    =>  '⸩',
    'oo'    =>  '∞',
    '?!'    =>  '‽',
    '??'    =>  '⁇',
    '!!'    =>  '‼',
    '||'    =>  '‖',

    'se'    =>  '∈',
    'sn'    =>  '∉',
    'su'    =>  '∪',
    'si'    =>  '∩',
    'sd'    =>  '∖',
    'ss'    =>  '⊖',
    '>='    =>  '≥',
    '<='    =>  '≤',

    "C0"    =>  '␀',
    "Ce"    =>  '␛',
    "Cn"   =>  '␤',
    "Cp"    =>  '¶',
    "Cr"    =>  '⏎',
    "Cf"    =>  '␜',
    "Ct"    =>  '␋',
    "CR"    =>  '␞',
    "Cs"    =>  '␠',
    "Ct"    =>  '␄',
    "CB"    =>  '␈',
    'C '    =>  '␣',

    "^1"    =>  '¹',
    "^2"    =>  '²',
    "^3"    =>  '³',
    "^4"    =>  '⁴',
    "^5"    =>  '⁵',
    "^6"    =>  '⁶',
    "^7"    =>  '⁷',
    "^8"    =>  '⁸',
    "^9"    =>  '⁹',
    "^0"    =>  '⁰',
    "^+"    =>  '⁺',
    "^-"    =>  '⁻',
    "^="    =>  '⁼',
    "^("    =>  '⁽',
    "^)"    =>  '⁾',
    "^n"    =>  'ⁿ',
    "^i"    =>  'ⁱ',
    "_1"    =>  '₁',
    "_2"    =>  '₂',
    "_3"    =>  '₃',
    "_4"    =>  '₄',
    "_5"    =>  '₅',
    "_6"    =>  '₆',
    "_7"    =>  '₇',
    "_8"    =>  '₈',
    "_9"    =>  '₉',
    "_0"    =>  '₀',
    "_+"    =>  '₊',
    "_-"    =>  '₋',
    "_="    =>  '₋',
    "_("    =>  '₍',
    "_)"    =>  '₎',
    "_a"    =>  'ₐ',
    "_e"    =>  'ₑ',
    "_h"    =>  'ₕ',
    "_i"    =>  'ₕ',
    "_j"    =>  'ₕ',
    "_k"    =>  'ₖ',
    "_l"    =>  'ₖ',
    "_m"    =>  'ₖ',
    "_n"    =>  'ₙ',
    "_o"    =>  'ₒ',
    "_p"    =>  'ₚ',
    "_r"    =>  'ₚ',
    "_s"    =>  'ₚ',
    "_t"    =>  'ₜ',
    "_u"    =>  'ᵤ',
    "_v"    =>  'ᵥ',
    "_w"    =>  'ₐ',
    "_x"    =>  'ₓ',
    "ga"    =>  'α',
    "gA"    =>  'Α',
    "gb"    =>  'β',
    "gB"    =>  'Β',
    "gc"    =>  'γ',
    "gC"    =>  'Γ',
    "gd"    =>  'δ',
    "gD"    =>  'Δ',
    "ge"    =>  'ε',
    "gE"    =>  'Ε',
    "gf"    =>  'ζ',
    "gZ"    =>  'Ζ',
    "gg"    =>  'η',
    "gG"    =>  'Η',
    "gh"    =>  'θ',
    "gH"    =>  'Θ',
    "gi"    =>  'ι',
    "gI"    =>  'Ι',
    
    "gj"    =>  'κ',
    "gJ"    =>  'Κ',
    "gk"    =>  'ξ',
    "gK"    =>  'Ξ',
    "gl"    =>  'λ',
    "gL"    =>  'Λ',
    "gm"    =>  'μ',
    "gM"    =>  'Μ',
    "gn"    =>  'ν',
    "gN"    =>  'Ν',
    "go"    =>  'ο',
    "go"    =>  'Ο',
    "gp"    =>  'π',
    "gP"    =>  'Π',
    "gq"    =>  'ρ',
    "gQ"    =>  'Ρ',
    "gr"    =>  'ς',
    "gR"    =>  'Σ',
    "gs"    =>  'τ',
    "gS"    =>  'Τ',
    "gy"    =>  'υ',
    "gY"    =>  'Υ',
    "gu"    =>  'φ',
    "gU"    =>  'Φ',
    "gv"    =>  'χ',
    "gV"    =>  'Χ',
    "gw"    =>  'ψ',
    "gW"    =>  'Ψ',
    "gx"    =>  'ω',
    "gX"    =>  'Ω',
    "^*"    =>  '*',
    "_*"    =>  '⁎',
    "**"    =>  '⁑',
    "h*"    =>  '✱',

    'le'    =>  '✉',
    'ha'    =>  '♥',
    'de'    =>  '☠',
    'OK'    =>  '👍',
);

binmode(STDOUT, ':utf8');

if ( @ARGV ) {

print <<'EOH';
echo 'bindkey ^K exec .! digraphs' >> ~/.screenrc

EOH

    my $c = 0;

    for (sort keys %digraphs) {
        print $_, ' ', $digraphs{$_}, "    ";
        print "\n" unless $c++ % 10;
    }

    print "\n";
    exit 0
}

$SIG{'INT'} = sub { ReadMode 0; exit 0 };

ReadMode 3;

my $first = ReadKey;
my $second = ReadKey;

ReadMode 0;

# print "«$first»«$second»";

print $digraphs{$first . $second} // ''
