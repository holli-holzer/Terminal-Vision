use Terminal::Vision::Ansi :color, :cursor;

unit role Terminal::Vision::Screen::Driver::xterm::Cursor;

method up( Int:D $by )
{
  return self.csi( $by, "A" );
}

method down( Int:D $by )
{
  return self.csi( $by, "B" );
}

method forward( Int:D $by )
{
  self.csi( $by, "C" );
}

method backward( Int:D $by )
{
  return self.csi( $by, "D" );
}

method next-line( Int:D $by )
{
  return self.csi( $by, "E" );
}

method preceding-line( Int:D $by )
{
  return self.csi( $by, "F" );
}

multi method goto( Int:D $column, Int:D $row )
{
  return self.csi( "$column;$row", "H" );
}

multi method goto( Int:D $column, Int:D $row, Str $text )
{
  return self.goto( $column, $row ) ~ $text;
}

multi method cursor-color( HTMLColorCode:D $color )
{
  return self.osc( "112", self.bel )
    if $color ~~ "default";

  return self.osc( "12;$color", self.bel );
}

multi method cursor-color( RGBString:D $color )
{
  return self.osc( "12;#" ~ rgb2html($color), self.bel );
}

multi method highlight-foreground-color( HTMLColorCode:D $color )
{
  return self.osc("119", self.bel)
    if $color ~~ "default";

  return self.osc("19;$color", self.bel);
}

multi method highlight-foreground-color( RGBString:D $color )
{
  return self.osc( "19;#" ~ rgb2html($color), self.bel );
}

multi method highlight-background-color( HTMLColorCode:D $color )
{
  return self.osc( "117", self.bel )
    if $color ~~ "default";

  return self.osc( "17;$color", self.bel );
}

multi method highlight-background-color( RGBString:D $color )
{
  return self.osc( "17;#" ~ rgb2html($color), self.bel );
}

method cursor-style( CursorCode:D $style )
{
  return self.csi ~ %cursor-codes{$style} ~ " q" ~ self.bel;
}

sub rgb2html( Str $s )
{
  return $s.comb(/\d+/)».fmt("%02x").join
}
