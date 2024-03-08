program Lab1Main;

uses
  Lab1Procedures;

var
  a: longint;
  b: longint;
  c: longint;

begin
  writeln('**MAIN**');
  a := 0;
  b := 100;
  c := 50;
  setlength(generated, c);
  generate(a, b, c);
  sort(c);
  show(c);
  writeln();
end.