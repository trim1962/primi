program slongtable;

{$mode objfpc}{$H+}

uses
MytYpe, Utile,sysutils;
const
numColonne =6;
var
temp:string;
miatab:TTabella;
pagina:TTDimPagina;
output:TextFile;
numcol:integer;
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
procedure CorpoFileTex(var f:TextFile);
begin
writeln(f, '( 1 &     0)&( 2 &     1)&( 3 &     2)&( 4 &     2)&( 5 &     3)&( 6 &     3)&( 7 &     4)\\');
writeln(f, '( 8 &     4)&( 9 &     4)&(10 &     4)&(11 &     5)&(12 &     5)&(13 &     6)&(14 &     6)\\ ');
writeln(f, '(15 &     6)&(16 &     6)&(17 &     7)&(18 &     7)&(19 &     8)&(20 &     8)&(21 &     8)\\');
writeln(f, '(22 &     8)&(23 &     9)&(24 &     9)&(25 &     9)&(26 &     9)&(27 &     9)&(28 &     9)\\');
writeln(f, '(29 &    10)&(30 &    10)& ');
end;
procedure ChiusuraFileTex(var f:TextFile);
begin
   writeln(f, '\end{longtable}');
  writeln(f, '\end{document}');
end;


 begin
   assign(output,'prova.tex');
   Rewrite(output);


  numcol:=2*numColonne+2;
   temp:=IntToStr(numcol);
   miatab.allineamenti:=concat('*{',temp,'}{c}');
  miatab.caption := 'Tabella di esempio';
  SetLength(miatab.allineamenti, miatab.colonne);
  pagina.left := '30mm';
  pagina.right := '15mm';
  pagina.top := '20mm';
  pagina.bottom := '20mm';
  pagina.bindingoffset := '0cm';
  pagina.showframe := True;
   ApperturaFileTex(pagina,miatab,output);
   CorpoFileTex(output);
   ChiusuraFileTex(output);
   close(output);


end.

