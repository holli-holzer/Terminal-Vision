use Terminal::Vision::Ansi :color;

unit role Terminal::Vision::Screen::Driver::xterm::Color;

my $default-color-code    = 39;

multi method foreground( RGBString $rgb )
{
  return self.csi("38;2;{$rgb}", "m");
}

multi method foreground( RGBString $rgb, *@text )
{
  return
    self.foreground( $rgb ) ~
    @text.join ~
    self.csi( $default-color-code, "m" );
}

multi method foreground( HTMLColorCode $ccode )
{
  return self.foreground( %html-color-codes{$ccode} )
}

multi method foreground( HTMLColorCode $ccode, *@text )
{
  return
    $ccode ~~ "default" ??
    self.csi( $default-color-code, "m") !!
    self.foreground( %html-color-codes{$ccode}, |@text )
  }

multi method foreground( ColorNum $cnum )
{
  return self.csi("38;5;{$cnum}", "m");
}

multi method foreground( ColorNum $cnum, *@text )
{
  return
    self.foreground( $cnum ) ~
    @text.join ~
    self.foreground( $cnum + 20 );
}

multi method background( RGBString $rgb )
{
  return self.csi( "48;2;{$rgb}","m" );
}

multi method background( HTMLColorCode $ccode )
{
  return
    $ccode ~~ "default" ??
    self.csi( $default-color-code + 10, "m") !!
    self.background( %html-color-codes{$ccode} )
  ;
}

multi method background( ColorNum $cnum )
{
  return self.csi("48;5;{$cnum + 10}", "m");
}

multi method background( RGBString $rgb, *@text )
{
  return
    self.background( $rgb ) ~
    @text.join ~
    self.csi( $default-color-code + 10, "m");
}

multi method background( HTMLColorCode $ccode, *@text )
{
  return self.background( %html-color-codes{$ccode}, |@text );
}

multi method background( ColorNum $cnum, *@text )
{
  return
    self.background( $cnum ) ~
    @text.join ~
    self.csi( $default-color-code + 10, "m");
}
