program fattorizzazione1;

uses
  MathUtils,Mytype;

var
  num, i: Integer;
  factors: TIntegerDynArray;



{$R *.res}

begin
  WriteLN('Inserisci un numero: ');
  ReadLn(num);

  factors := PrimFac(num);

  WriteLn('I fattori primi di ', num, ' sono:');
  for i := 0 to High(factors) do
    Write(factors[i], ' ');
  ReadLn;
end.

