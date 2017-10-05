unit package Terminal::Vision::Ansi;

# You can't put subsets in roles, at least currently
# That's why this is here.

subset RGBString     of Str is export( :color )
  where *.defined && * ~~ / [ \d+ ] ** 3 % \; /;

subset ColorNum      of Int  is export( :color )
 where 0 < * < 256;

our %cursor-codes is export( :cursor ) =
  block => 1, horizontal => 3, vertical => 5
;
subset CursorCode     of Str is export( :cursor )
  where .defined && $_ ~~ %cursor-codes;

our %text-codes is export( :text ) =
  normal            => 0,  default           => 0,
  bold              => 1,  no-bold           => 21,
  faint             => 2,  no-faint          => 22,
  italic            => 3,  no-italic         => 23,
  underline         => 4,  no-underline      => 24,
  underlined        => 4,  no-underlined     => 24,
  blink             => 5,  no-blink          => 25,
  blinking          => 5,  no-blinking       => 25,
  inverse           => 7,  no-inverse        => 27,
  hidden            => 8,  no-hidden         => 28,
  no-visible        => 8,  visible           => 28,
  crossed-out       => 9,  no-crossed-out    => 29,
  strike-through    => 9,  no-strike-through => 29,
;

subset TextCode      of Str  is export( :text )
  where $_.defined && $_ ~~ %text-codes;

our %html-color-codes is export( :color ) =
  black             => "0;0;0",         red                  => "255;0;0",       green           => "0;255;0",       blue            => "0;0;255",
  yellow            => "255;255;0",     magenta              => "255;0;255",     cyan            => "0;255;255",     white           => "255;255;255",
  lime              => "255;255;255",   navy                 => "0;0;128",       aqua            => "0;255;255",     lightsteelblue  => "176;196;222",
  gold              => "255;215;000",   maroon               => "128;0;0",       teal            => "0;128;128",     brown           => "165;42;42",
  darkred           => "139;0;0",       olive                => "128;128;0",     peru            => "205;133;63",    tan             => "210;180;140",
  coral             => "255;127;80",    darkblue             => "0;0;139",       gray            => "128;128;128",   grey            => "128;128;128",
  indigo            => "75;0;130",      orange               => "255;165;0",     pink            => "255;192;203",   plum            => "221;160;221",
  purple            => "128;0;128",     sienna               => "160;82;45",     snow            => "255;250;250",   tomato          => "255;99;71",
  beige             => "245;245;220",   crimson              => "220;20;60",     azure           => "240;255;255",   lightslategrey  => "119;136;153",
  darkgreen         => "0;100;0",       fuchsia              => "255;0;255",     ivory           => "255;255;240",   khaki           => "240;230;140",
  linen             => "250;240;230",   wheat                => "245;222;179",   bisque          => "255;228;196",   darkcyan        => "0;139;139",
  dimgrey           => "105;105;105",   firebrick            => "178;34;34",     hotpink         => "255;105;180",   lawngreen       => "124;252;0",
  limegreen         => "50;205;50",     oldlace              => "253;245;230",   skyblue         => "135;206;235",   thistle         => "216;191;216",
  orangered         => "255;69;0",      orchid               => "218;112;214",   salmon          => "250;128;114",   seagreen        => "46;139;87",
  silver            => "192;192;192",   violet               => "238;130;238",   deeppink        => "255;20;147",    dimgray         => "105;105;105",
  cadetblue         => "95;158;160",    chocolate            => "210;105;30",    cornsilk        => "255;248;220",   darkgray        => "169;169;169",
  darkgrey          => "169;169;169",   goldenrod            => "218;165;32",    honeydew        => "240;255;240",   lavender        => "230;230;250",
  moccasin          => "255;228;181",   indianred            => "205;92;92",     olivedrab       => "107;142;35",    royalblue       => "65;105;225",
  seashell          => "255;245;238",   slateblue            => "106;90;205",    steelblue       => "70;130;180",    turquoise       => "64;224;208",
  aliceblue         => "240;248;255",   burlywood            => "222;184;135",   darkkhaki       => "189;183;107",   gainsboro       => "220;220;220",
  lightblue         => "173;216;230",   lightcyan            => "224;255;255",   lightgray       => "211;211;211",   lightgrey       => "211;211;211",
  lightpink         => "255;182;193",   mintcream            => "245;255;250",   mistyrose       => "255;228;225",   palegreen       => "152;251;152",
  peachpuff         => "255;218;185",   rosybrown            => "188;143;143",   slategray       => "112;128;144",   slategrey       => "112;128;144",
  mediumspringgreen => "0;250;154",     mediumaquamarine     => "102;205;170",   mediumturquoise => "72;209;204",    mediumvioletred => "199;21;133",
  mediumslateblue   => "123;104;238",   mediumblue           => "0;0;205",       chartreuse      => "127;255;0",     darkorange      => "255;140;0",
  darkviolet        => "148;0;211",     blueviolet           => "138;43;226",    darkmagenta     => "139;0;139",     darkorchid      => "153;50;204",
  deepskyblue       => "0;191;255",     dodgerblue           => "30;144;255",    forestgreen     => "34;139;34",     saddlebrown     => "139;69;19",
  sandybrown        => "244;164;96",    springgreen          => "0;255;127",     aquamarine      => "127;255;212",   darksalmon      => "233;150;122",
  darkslategray     => "47;79;79",      darkslategrey        => "47;79;79",      ghostwhite      => "248;248;255",   greenyellow     => "173;255;47",
  lightcoral        => "240;128;128",   lightgreen           => "144;238;144",   midnightblue    => "25;25;112",     papayawhip      => "255;239;213",
  powderblue        => "176;224;230",   whitesmoke           => "245;245;245",   yellowgreen     => "154;205;50",    darkslateblue   => "72;61;139",
  darkturquoise     => "0;206;209",     floralwhite          => "255;250;240",   lightsalmon     => "255;160;122",   lightyellow     => "255;255;224",
  mediumorchid      => "186;85;211",    navajowhite          => "255;222;173",   antiquewhite    => "250;235;215",   darkgoldenrod   => "184;134;11",
  darkolivegreen    => "85;107;47",     darkseagreen         => "143;188;143",   lemonchiffon    => "255;250;205",   lightseagreen   => "32;178;170",
  lightskyblue      => "135;206;250",   mediumpurple         => "147;112;219",   rebeccapurple   => "102;51;153",    lavenderblush   => "255;240;245",
  mediumseagreen    => "60;179;113",    palegoldenrod        => "238;232;170",   paleturquoise   => "175;238;238",   palevioletred   => "219;112;147",
  blanchedalmond    => "255;235;205",   cornflowerblue       => "100;149;237",   lightslategray  => "119;136;153",   lightgoldenrodyellow => "250;250;210"
;

subset HTMLColorCode of Str  is export( :color )
  where .defined && $_ ~~ %html-color-codes || $_ ~~ "default";
