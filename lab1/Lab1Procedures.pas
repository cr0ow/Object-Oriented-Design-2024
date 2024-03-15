unit Lab1Procedures;

interface

type
    integerArray = array of integer;

var
    generated: integerArray;

procedure generate(var start, finish, length: integer);
procedure sort(length: integer);
procedure show(length: integer);

implementation

procedure generate(var start, finish, length: integer);
var
  i: integer;
begin
    randomize;
    for i := 0 to length do
        generated[i] := Random(finish - start) + start;
end;

procedure sort(length: integer);
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

procedure show(length: integer);
var
  i: integer;
begin
  for i := 0 to length do
    write(generated[i], ' ');
  writeln;
end;

end.