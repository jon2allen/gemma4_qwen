program PrimeCheck;

uses SysUtils;

function IsPrime(n: Integer): Boolean;
var
  i: Integer;
begin
  if n < 2 then Exit(False);
  for i := 2 to Sqrt(n) do
    if n mod i = 0 then
      Exit(False);
  Result := True;
end;

var
  num: Integer;
  count: Integer;
begin
  Write('Enter a number to check: ');
  ReadLn(num);
  if IsPrime(num) then
    WriteLn(num, ' is a Prime Number.')
  else
    WriteLn(num, ' is not a Prime Number.');
end.