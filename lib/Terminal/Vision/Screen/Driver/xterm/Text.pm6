use Terminal::Vision::Ansi :text;

unit role Terminal::Vision::Screen::Driver::xterm::Text;

multi method text( TextCode $tcode )
{
  return self.csi( %text-codes{$tcode}, "m");
}

multi method text( TextCode $tcode, *@text where @text>>.defined )
{
  return
    self.text( $tcode ) ~
    @text.join ~
    self.text( "no-$tcode" );
}
