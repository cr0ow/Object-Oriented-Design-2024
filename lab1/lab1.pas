program Lab1;

type
    integerArray = array of integer;
var
    generated: integerArray;
    a: integer;
    b: integer;
    c: integer;

procedure generate(var start, finish, length: integer);
var
  i: integer;
begin
    randomize;
    for i := 0 to length do
        generated[i] := Random(finish) + start;
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

begin
    a := 0;
    b := 100;
    c := 50;
    setlength(generated, c);
    generate(a, b, c);
    sort(c);
    show(c);
end.