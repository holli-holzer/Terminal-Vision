unit role Terminal::Vision::Screen::Driver::xterm::Window;

multi method resize-pixel( Int $width, Int $height )
{
  return self.csi( "4;$height;$width", "t" );
}

multi method resize( Int $width, Int $height )
{
  return self.csi( "8;$height;$width", "t" );
}

method cls
{
  return chr(27) ~ "[2J" ~ chr(27) ~ "[;H";
}
