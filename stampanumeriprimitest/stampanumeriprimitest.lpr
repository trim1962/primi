program StampaNumeriPrimi;

uses SysUtils, MyType;

type
  TBooleanArray = array of Boolean;

function EratostenePrimes(MaxNum: Integer): TIntegerList;
var
  primes: TIntegerList;
  isPrime: TBooleanArray;
  i,m : Integer;
begin
  primes := TIntegerList.Create;
  SetLength(isPrime, MaxNum + 1); // Initialize the array size
  for i := 2 to MaxNum do
    isPrime[i] := True;

  for i := 2 to MaxNum do
    if isPrime[i] then
      for m := 2 to MaxNum do
        if i * m <= MaxNum then
          isPrime[i*m] := False;

  for i := 2 to MaxNum do
    if isPrime[i] then
      primes.Add(i);

  EratostenePrimes := primes;
end;

procedure StampaNumeriPrimi(primes: TIntegerList);
var
  i: Integer;
begin
  for i := 0 to primes.Count - 1 do
    Writeln(primes[i]);
end;

var
  nMax: Integer;
  primi: TIntegerList;

begin
  writeln('Inserisci il valore massimo di n: ');
  readln(nMax);

  primi := EratostenePrimes(nMax);
  StampaNumeriPrimi(primi);

  readln; // Pausa per visualizzare l'output
end.
