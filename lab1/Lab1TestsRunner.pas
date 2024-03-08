program Lab1TestsRunner;

{$MODE OBJFPC}

uses
	consoletestrunner, Lab1Tests;

begin
with TTestRunner.Create do
	try
		Run;
	finally
		Free;
end;
// test := TLab1Tests.Create;
// test.SetUp;
// test.GenerateTest;
// test.SortTest;
// test.TearDown;
end.