program Lab1Tests;

uses
  Lab1Procedures;

var
  testLength: integer;
  testFrom: integer;
  testTo: integer;

procedure setUp;
var
  i: integer;
begin
  testLength := 10;
  testFrom := 5;
  testTo := 20;
	setlength(generated, testLength);
  for i := 0 to testLength do
		generated[i] := 0;
end;

procedure shouldgenerateTable;
var
  i: integer;
begin
  generate(testFrom, testTo, testLength);
  for i := 0 to testLength do
    if generated[i] = 0 then begin
      writeln('shouldUpdateAllCells: error !!!');
      exit;
    end;
  writeln('shouldUpdateAllCells: passsed');
end;

procedure shouldGenerateTableWithValidValues;
var
  i: integer;
begin
  generate(testFrom, testTo, testLength);
  for i := 0 to testLength do
    writel
    if generated[i] < testFrom or generated[i] > testTo then begin
      writeln('shouldUpdateAllCellsWithValidValues: error !!!');
      exit;
    end;
  writeln('shouldUpdateAllCellsWithValidValues: passsed');
end;

procedure shouldSortRandomArray;
var
  i: integer;
begin
  sort(testLength);
  for i := 0 to testLength - 1 do
    if generated[i] > generated[i + 1] then begin
      writeln('shouldSortRandomArray: error !!!');
      exit;
    end;
  writeln('shouldSortRandomArray: passsed');
end;

procedure shouldSortRevertedArray;
var
  i: integer;
begin
  for i := 0 to testLength do
    generated[i] = testLength - i
  sort(testLength);
  for i := 0 to testLength - 1 do
    if generated[i] > generated[i + 1] then begin
      writeln('shouldSortRevertedArray: error !!!');
      exit;
    end;
  writeln('shouldSortRevertedArray: passsed');
end;

procedure shouldSortArrayWithNegativeNumbers;
var
  i: integer;
begin
  testFrom := -100;
  generate(testFrom, testTo, testLength)
  sort(testLength);
  for i := 0 to testLength - 1 do
    if generated[i] > generated[i + 1] then begin
      writeln('shouldSortArrayWithNegativeNumbers: error !!!');
      exit;
    end;
  writeln('shouldSortArrayWithNegativeNumbers: passsed');
end;

begin

wrintln('**TESTS**')
setUp();
shouldGenerateTable();
shouldGenerateTableWithValidValues();
shouldSortRandomArray();
shouldSortRevertedArray();
shouldSortArrayWithNegativeNumbers();

end.