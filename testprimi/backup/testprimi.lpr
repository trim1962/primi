program testprimi;
{$mode ObjFPC}{$H+}
uses
MyType, MathUtils,writelatex, writecsv;

const
  MaxNum = 100000;  // Limite superiore per i numeri primi
  NumPerLine = 12; // Numero di numeri primi per riga nella tabella


var
  primes: TIntegerList;

begin
  primes := EratostenePrimes(MaxNum);

  ScriviTabellaDaListaPrimiTex(primes, 'numeri_primi.tex', NumPerLine, 'Numeri primi');
  ScriviTabellaDaListaPrimiCsv(primes, 'numeri_primi.csv', NumPerLine, 'Numeri primi');
  writeln('Numeri primi trovati: ', primes.Count);
  ReadLn;  // Pausa prima di terminare il programma
  primes.free
end.
