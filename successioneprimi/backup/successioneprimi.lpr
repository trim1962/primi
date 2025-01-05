program SuccessionePrimi;

uses SysUtils, MyType, MathUtils;
 const
   numerocolonne =6;
procedure StampaSuccessione(nMax: Integer);
var
  i: Integer;
  primi: TIntegerList;
begin
  primi := EratostenePrimes(nMax);
  for i := 1 to nMax do
    writeln(i:4, ': ', ContaPrimiFinoA(i, primi):4);
end;

procedure ScriviTabellaLatex(nomeFile: string; data: TIntegerDynArray; numColonne: Integer; nMax: Integer);
var
  i, j, k: Integer;
  f: TextFile;
begin
  AssignFile(f, nomeFile);
  Rewrite(f);

  writeln(f, '\documentclass{article}');
  //writeln(f, ' \usepackage[left=30mm,right=15mm,top=20mm,bottom=20mm,bindingoffset=0cm,showframe]{geometry} ');
  writeln(f, ' \usepackage[left=30mm,right=15mm,top=20mm,bottom=20mm,bindingoffset=0cm]{geometry} ');
  writeln(f, '\usepackage{booktabs}');
  writeln(f, '\usepackage{longtable}');
  writeln(f, '\begin{document}');
//impostazione di longtable  inizio fine
  writeln(f, '\begin{longtable}{*{',2*numColonne+2,'}{c}}');
  writeln(f, '\caption{Tabella dei dati}\\');   // scrittura caption

   //primo head longtable  inizio
   writeln(f,'\toprule');
   for k := 1 to numColonne do
   write(f, 'N&NP&');
    writeln(f, 'N&NP\\');
   writeln(f,'\midrule');
   writeln(f,'\endfirsthead');
   //primo head longtable  fine
    //head longtable  inizio
    writeln(f,'\toprule');
   for k := 1 to numColonne do
   write(f, 'N&NP&');
    writeln(f, 'N&NP\\');
   writeln(f,'\midrule');
   writeln(f,'\endhead');
   //longtable  fine
    //primo endfoot longtable  inizio
    writeln(f,'\bottomrule');
    writeln(f,'\endfoot');
     //primo endfoot longtable  fine
     //primo endlastfoot longtable  inizio
    writeln(f,'\bottomrule');
    writeln(f,'\endlastfoot');
     //primo endlastfoot longtable  fine
  // Write table data
    j:=0;
  for i := 1 to nMax do
  if j < numColonne then
        begin
        write(f,'(',i:2, ' & ',data[i]:5,')','&');
         j:=j+1
        end
      else
      begin
    writeln(f,'(',i:2, ' & ',data[i]:5,')','\\');
     j:=0
 end;
 // writeln(f, '\bottomrule');
  writeln(f, '\end{longtable}');
  writeln(f, '\end{document}');

  CloseFile(f);
end;

procedure StampaSuccessioneLatex(nMax: Integer; nomeFile: string);
var
  data: TIntegerDynArray;
  i: Integer;
begin
  SetLength(data, nMax * 2); // Allocate space for data pairs (index, value)
  for i := 0 to nMax do
  begin
  data[i] := ContaPrimiFinoA(i, EratostenePrimes(i)); // Value (number of primes)
  end;

  ScriviTabellaLatex(nomeFile, data, numerocolonne,nMax); // Call the new procedure
end;

var
  nMax: Integer;
begin
  writeln('Inserisci il valore massimo di n: ');
  readln(nMax);
  StampaSuccessione(nMax);
  StampaSuccessioneLatex(nMax, 'test.tex');
end.
