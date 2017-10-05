use Terminal::Vision::Types;

unit class Terminal::Vision::Screen::Driver;

multi method csi
{
  return "\e[";
}

multi method csi( Any:D $value, Char:D $arg )
{
  return "\e[" ~ $value ~ $arg;
}

multi method st
{
  return chr(0x9C);
}

multi method st( Any:D $value, Char:D $arg )
{
  return chr(0x9C) ~ $value ~ $arg;
}

multi method osc
{
  return "\e]";
}

multi method osc( Any:D $value, Char:D $arg )
{
  return "\e]" ~ $value ~ $arg;
}

multi method bel
{
  return "\a"; # chr(7)
}

multi method bel( Str $arg )
{
  return "\a" ~ $arg;
}
