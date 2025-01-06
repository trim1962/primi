program slongtable;

{$mode objfpc}{$H+}

uses
MytYpe, Utile,sysutils,MathUtils;
const
numColonne =6;
var
temp:string;
miatab:TTabella;
pagina:TTDimPagina;
output:TextFile;
numcol:integer;
nMax: Integer;
procedure ApperturaFileTex(pag:TTDimPagina;tab:TTabella;var f:TextFile);

begin
   writeln(f, '\documentclass{article}');
  //writeln(f, ' \usepackage[left=30mm,right=15mm,top=20mm,bottom=20mm,bindingoffset=0cm,showframe]{geometry} ');
  if pagina.showframe then
  writeln(f,' \usepackage[left=',pag.left,',right=',pag.right, ',top=', pag.top,
  ',bottom=', pag.bottom, ',bindingoffset=', pag.bindingoffset, ',showframe]{geometry} ')
else
  writeln(f, ' \usepackage[left=', pag.left, ',right=', pag.right, ',top=', pag.top,
  ',bottom=', pag.bottom, ',bindingoffset=', pag.bindingoffset, ']{geometry} ');
  writeln(f, '\usepackage{booktabs}');
  writeln(f, '\usepackage{longtable}');
  writeln(f, '\begin{document}');
//impostazione di longtable  inizio fine
  writeln(f, '\begin{longtable}{',tab.allineamenti,'}');
  writeln(f, '\caption{',tab.caption,'}\\');   // scrittura caption

   //primo head longtable  inizio
   writeln(f,'\toprule');
   writeln(f,tab.intestazione,'\\');
   writeln(f,'\midrule');
   writeln(f,'\endfirsthead');
   //primo head longtable  fine
    //head longtable  inizio
    writeln(f,'\toprule');
   writeln(f,tab.intestazione,'\\');
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
end;
procedure CorpoFileTex(nMax: Integer;var f:TextFile );
var
  data: TIntegerDynArray;
  i,j: Integer;
begin
  SetLength(data, nMax * 2); // Allocate space for data pairs (index, value)
  for i := 0 to nMax do
  begin
  data[i] := ContaPrimiFinoA(i, EratostenePrimes(i)); // Value (number of primes)
  end;
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
end;
procedure ChiusuraFileTex(var f:TextFile);
begin
   writeln(f, '\end{longtable}');
  writeln(f, '\end{document}');
end;
function SommaS(Nc:string;Ns:string; ln:integer):string;
    var
    temp,tmp:string;
    n:integer;
begin
  temp:='';
  tmp:=Nc+'&'+Ns+'&';
  for n :=1 to ln do
  temp:=temp+tmp;
  temp:=temp+Nc+'&'+Ns;
  SommaS:=temp;
end;

 begin
   assign(output,'prova.tex');
   Rewrite(output);
    miatab.intestazione:=SommaS('N','NC',numColonne);

  numcol:=2*numColonne+2;
   temp:=IntToStr(numcol);
   miatab.allineamenti:=concat('*{',temp,'}{c}');
  miatab.caption := 'Tabella di esempio';
  pagina.left := '30mm';
  pagina.right := '15mm';
  pagina.top := '20mm';
  pagina.bottom := '20mm';
  pagina.bindingoffset := '0cm';
  pagina.showframe := True;
  writeln('Inserisci il valore massimo di n: ');
  readln(nMax);
   ApperturaFileTex(pagina,miatab,output);
   CorpoFileTex(nMax,output);
   ChiusuraFileTex(output);
   close(output);


end.

