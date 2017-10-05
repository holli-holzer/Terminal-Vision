unit package Terminal::Vision::Types;

class Size is export
{
  has Int $.width is rw;
  has Int $.height is rw;
}

class Point is export
{
  has Int $.x is rw;
  has Int $.y is rw;
}

subset Char of Str is export where *.chars == 1;
