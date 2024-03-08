unit Lab1Tests;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry, Lab1Procedures;

type
  TLab1Tests = class(TTestCase)
  private
    testLength: longint;
    testFrom: longint;
    testTo: longint;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  public
    procedure GenerateTest;
    procedure SortTest;
end;

implementation

procedure TLab1Tests.SetUp;
var
  i: longint;
begin
  testLength := 10;
  testFrom := 5;
  testTo := 20;
	setlength(generated, testLength);
  for i := 0 to testLength do
		generated[i] := 0;
  writeln('**TESTS**')
end;

procedure TLab1Tests.TearDown;
begin
  writeln();
end;

procedure TLab1Tests.GenerateTest;
var
  i: longint;
begin
  generate(testFrom, testTo, testLength);
  for i := 0 to testLength do
    AssertTrue(generated[i] > 0);
end;

procedure TLab1Tests.SortTest;
var
  i: longint;
begin
  sort(testLength);
  for i := 0 to testLength - 1 do
    AssertTrue(generated[i] <= generated[i + 1]);
end;

initialization
  RegisterTest(TLab1Tests);
end.