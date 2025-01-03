program SuccessionePrimi;

uses SysUtils, MyType,MathUtils, utile;



procedure StampaSuccessione(nMax: Integer);
var
  i: Integer;
  primi: TIntegerList;
begin
  primi := EratostenePrimes(nMax);
  for i := 2 to nMax do
    writeln(i:4, ': ', ContaPrimiFinoA(i, primi):4);
end;

var
  nMax: Integer;

begin
  writeln('Inserisci il valore massimo di n: ');
  readln(nMax);
  StampaSuccessione(nMax);
end.
