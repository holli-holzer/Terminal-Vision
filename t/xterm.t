use lib "lib";

use Test;
use Terminal::Vision::Screen::Driver::xterm;

sub MAIN( Bool :$default? )
{
  my $xterm = Terminal::Vision::Screen::Driver::xterm.new;

  say $xterm.cls;
  say $xterm.text("bold",           "Now, that's bo", "ld" ), " - must be bold";
  say $xterm.text("underlined",     "I can only underline this" ), " - underlined";
  say $xterm.text("strike-through", "Scratch that!" ), " - strike-through";
  say $xterm.text("italic",         "I love spaghetti?" ), " - italic";
  say $xterm.text("faint",          "I feel so queer." ), " - faint";
  say $xterm.text("inverse",        "No! It's the other way around" ), " - inverse";
  say $xterm.text("hidden",         "Nothing to see here" ), " - hidden";
  say $xterm.text("blinking",       "blinking" ), " - NORMAL";

  say $xterm.foreground("0;0;255",  "They came right out of it!" ), " - Blue";
  say $xterm.foreground(51,         "I killed them with Cyanide!" ), " - Cyan";
  say $xterm.foreground("silver",   "Talking is silver, ", $xterm.foreground("gold", "silence is gold")), " - silver / gold";

  say $xterm.background("0;0;255",  "And into the ..." ), " - blue bg";
  say $xterm.background(51,         "Don't be so cyanical." ), " - cyan bg";
  say $xterm.background("silver",   "Polish the silver, aunt Betty is coming." ), " - silver bg";

  say
    $xterm.text("bold",
    $xterm.text("underlined",
    $xterm.text("strike-through",
    $xterm.text("italic",
    $xterm.text("faint",
    $xterm.text("inverse", "bold underlined strike-through italic faint AND inverse" ))))));

  say
    "nested ",
    $xterm.text( "bold", "bold with some", $xterm.text('italic', " italic"), " text" );

  say
    "nested ",
    $xterm.text( "bold" ,
      "bold and ",
      $xterm.background("122;122;111"),
      "colored ",
      $xterm.foreground("maroon",
        "with some ",
        $xterm.background("default"),
        $xterm.text('italic'," italic " ),
      )
    ), "text";

  say $xterm.goto( 0, 0, "This text is in the upper left of the screen" );

  say $xterm.next-line(13);

  if $default
  {
    say $xterm.cursor-style("block");
    say $xterm.cursor-color("default");
    say $xterm.highlight-background-color("default");
    say $xterm.highlight-foreground-color("default");
  }
  else
  {
    say $xterm.cursor-style("horizontal");
    say $xterm.cursor-color("red");
    say $xterm.highlight-background-color("red");
    say $xterm.highlight-foreground-color("0;0;255");

    say "The mouse cursor should now be red and horizontal.";
    say "Highlighting should be cyan on blue.";
    say "Start the script using --default to turn back to normal.";
  }
}
