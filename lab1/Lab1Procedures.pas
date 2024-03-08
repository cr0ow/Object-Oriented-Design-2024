unit Lab1Procedures;

interface

type
    integerArray = array of longint;

var
    generated: integerArray;

procedure generate(var start, finish, length: longint);
procedure sort(length: longint);
procedure show(length: longint);

implementation

procedure generate(var start, finish, length: longint);
var
  i: integer;
begin
    randomize;
    for i := 0 to length do
        generated[i] := Random(finish) + start;
end;

procedure sort(length: longint);
var
    i: integer;
    j: integer;
    temp: integer;
begin
    for i := 0 to length - 1 do
        for j := 0 to length - 1 do
            if ( generated[j] > generated[j + 1] ) then
            begin
                temp := generated[j];
                generated[j] := generated[j + 1];
                generated[j + 1] := temp;
            end;
end;

procedure show(length: longint);
var
  i: integer;
begin
  for i := 0 to length do
    write(generated[i], ' ');
  writeln;
end;

end.