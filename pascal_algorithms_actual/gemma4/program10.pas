program PrimeCheckExample;

// Function to check if a number is prime
function IsPrime(N: Integer): Boolean;
var
  i: Integer;
begin
  if N <= 1 then
  begin
    IsPrime := False; // Numbers less than or equal to 1 are not prime
    Exit;
  end;

  // Check divisibility up to the square root of N
  i := 2;
  while i * i <= N do begin
    if N mod i = 0 then
    begin
      IsPrime := False; // Found a divisor
      Exit;
    end;
    Inc(i);
  end;

  IsPrime := True; // No divisors found
end;

var
  Number1, Number2: Integer;
begin
  Number1 := 17;
  if IsPrime(Number1) then
    WriteLn(Number1, ' is a prime number.')
  else
    WriteLn(Number1, ' is not a prime number.');

  NewLine;

  Number2 := 15;
  if IsPrime(Number2) then
    WriteLn(Number2, ' is a prime number.')
  else
    WriteLn(Number2, ' is not a prime number.');
end.