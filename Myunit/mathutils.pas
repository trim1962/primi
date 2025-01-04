unit MathUtils;
interface
 uses
  Mytype,utile;
 Function PrimFac(N: Integer): TIntegerDynArray;
  function isPrime(a: Integer): Boolean;
  function EratostenePrimes(MaxNum: Integer): TIntegerList;
  function ContaPrimiFinoA(n: Integer; primes: TIntegerList): Integer;
implementation
 function isPrime(a: Integer): Boolean;
var
  i: Integer;
begin
  if a < 2 then
    Exit(False);

  if a = 2 then
    Exit(True);

  if a mod 2 = 0 then
    Exit(False);

  isPrime := True;
  i:=3;
  while  i <= Trunc(Sqrt(a)) do
  begin
 if (a mod i = 0) then
    begin
      isPrime := False;
      Exit;
    end;
    i:=i+2;
  end;

  Exit(isPrime);
end;


function PrimFac(N: Integer): TIntegerDynArray;
var
  Divisor, A, I: Integer;
  L: TIntegerList;
begin
  SetLength(Result, 0);
  A := N;
  L := TIntegerList.Create;
  try
    { Find divisors and add each to list. }
    for Divisor := 2 to N div 2 do
    begin
      { Use "while" so a divisor can be found multiple times, e.g. }
      { using "if": 1000 --> 2 4 5 25 (but 4 = 2*2, and 25 = 5*5)  }
      { using "while": 1000 --> 2 2 2 5 5 5                        }
      while A mod Divisor = 0 do
      begin
        A := A div Divisor;
        L.Add(Divisor);
      end;
    end;

    { Copy list to result array. }
    SetLength(Result, L.Count);
    for I := 0 to L.Count - 1 do
    begin
      Result[I] := L[I];
    end;
  finally
    L.Free;
    PrimFac := Result;
  end;
end;

 function EratostenePrimes(MaxNum: Integer): TIntegerList;
var
  primes: TIntegerList;
  isPrime: TBooleanArray;
  i,m: Integer;
begin
  primes := TIntegerList.Create;
    SetLength(isPrime, MaxNum + 1); // Initialize the array size
    for i := 2 to MaxNum do
      isPrime[i] := True; // Initialize all elements to True
      isPrime[1] := false;
 // for i := 2 to Trunc(Sqrt(MaxNum)) do
 //   if isPrime[i] then
 //     for j := i * i to MaxNum div i do
 //       isPrime[j] := False;
    for i := 2 to Trunc(Sqrt(MaxNum)) do
      if isPrime[i] then
        for m := 2 to MaxNum do
          if i * m <= MaxNum then
            isPrime[i*m] := False;
    for i := 2 to MaxNum do
      if isPrime[i] then

        primes.Add(i);     //da valore logico a valore numerico

  EratostenePrimes := primes;

end;

 // conta quanti primi ci sono prima di un numero
 function ContaPrimiFinoA(n: Integer; primes: TIntegerList): Integer;
 var
   i, conta: Integer;
 begin
   conta := 0;
   for i := 0 to n do
     if IsInList(i, primes) then
       begin
       Inc(conta);
       end;
   ContaPrimiFinoA := conta;
 end;
end.

