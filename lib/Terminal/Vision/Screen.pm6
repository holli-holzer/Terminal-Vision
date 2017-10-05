role Terminal::Vision::ScreenOutput
{
  has $!driver;
  has $!driver-instance;

  submethod BUILD( :$driver )
  {
    self.set-driver( $driver );
  }

  method set-driver( $driver )
  {
    require ::($driver);
    $!driver = ::($driver).new;
  }

  method font ( $command )
  {
    return $!driver.font( $command );
  }
};

class Terminal::Vision::Screen
  does Terminal::Vision::ScreenOutput
{
  
};
