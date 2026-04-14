program FibDP;

uses SysUtils;

function GetFibonacci(n: Integer): Integer;
var
  dp: array[0..100] of Integer;
  i: Integer;
begin
  if n < 0 then Exit(-1);
  SetLength(dp, n + 1);
  dp[0] := 0;
  if n >= 1 then dp[1] := 1;

  for i := 2 to n do
    dp[i] := dp[i - 1] + dp[i - 2];

  Result := dp[n];
end;

var
  n: Integer;
begin
  Write('Enter n (0-100): ');
  ReadLn(n);
  WriteLn('Fibonacci(', n, ') = ', GetFibonacci(n));
end.