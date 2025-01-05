program slongtable;

{$mode objfpc}{$H+}

uses
MytYpe, Utile,sysutils;
var
text,A,B:string;
miatab:tabella;
output:TextFile;
strAllineamento:string;
i:integer;
//procedure ApperturaFileTex(tab:tabella;var f:TextFile);
//
//begin
//   writeln(f, '\documentclass{article}');
//  //writeln(f, ' \usepackage[left=30mm,right=15mm,top=20mm,bottom=20mm,bindingoffset=0cm,showframe]{geometry} ');
//  writeln(f, ' \usepackage[left=30mm,right=15mm,top=20mm,bottom=20mm,bindingoffset=0cm]{geometry} ');
//  writeln(f, '\usepackage{booktabs}');
//  writeln(f, '\usepackage{longtable}');
//  writeln(f, '\begin{document}');
////impostazione di longtable  inizio fine
//  writeln(f, '\begin{longtable}{*{',tab.colonne,'}{',tab.a,'}}');
//  writeln(f, '\caption{',tab.caption,'}\\');   // scrittura caption
//
//   //primo head longtable  inizio
//   writeln(f,'\toprule');
//   writeln(f,tab.intestazione,'\\');
//   writeln(f,'\midrule');
//   writeln(f,'\endfirsthead');
//   //primo head longtable  fine
//    //head longtable  inizio
//    writeln(f,'\toprule');
//   writeln(f,tab.intestazione,'\\');
//   writeln(f,'\midrule');
//   writeln(f,'\endhead');
//   //longtable  fine
//    //primo endfoot longtable  inizio
//    writeln(f,'\bottomrule');
//    writeln(f,'\endfoot');
//     //primo endfoot longtable  fine
//     //primo endlastfoot longtable  inizio
//    writeln(f,'\bottomrule');
//    writeln(f,'\endlastfoot');
//     //primo endlastfoot longtable  fine
//end;
//procedure CorpoFileTex(var f:TextFile);
//begin
//writeln(f, '( 1 &     0)&( 2 &     1)&( 3 &     2)&( 4 &     2)&( 5 &     3)&( 6 &     3)&( 7 &     4)\\');
//writeln(f, '( 8 &     4)&( 9 &     4)&(10 &     4)&(11 &     5)&(12 &     5)&(13 &     6)&(14 &     6)\\ ');
//writeln(f, '(15 &     6)&(16 &     6)&(17 &     7)&(18 &     7)&(19 &     8)&(20 &     8)&(21 &     8)\\');
//writeln(f, '(22 &     8)&(23 &     9)&(24 &     9)&(25 &     9)&(26 &     9)&(27 &     9)&(28 &     9)\\');
//writeln(f, '(29 &    10)&(30 &    10)& ');
//end;
//procedure ChiusuraFileTex(var f:TextFile);
//begin
//   writeln(f, '\end{longtable}');
//  writeln(f, '\end{document}');
//end;
//    function SommaS(Nc:string;Ns:string; ln:integer):string;
//    var
//    temp,tmp:string;
//    n:integer;
//begin
//  temp:='';
//  tmp:=Nc+'&'+Ns+'&';
//  for n :=1 to ln-1 do
//  temp:=temp+tmp;
//  temp:=temp+Nc+'&'+Ns;
//  SommaS:=temp;
//end;
function CreaStringaAllineamento(allineamenti: array of TAllineamento): string;
var
  i: integer;
  strAllineamento: string;
begin
  strAllineamento := '';
  for i := 1 to Length(allineamenti) do
    case allineamenti[i-1] of
      aSinistra: strAllineamento := strAllineamento + 'l';
      aDestra: strAllineamento := strAllineamento + 'r';
      aCentro: strAllineamento := strAllineamento + 'c';
    end;
  CreaStringaAllineamento := '*' + IntToStr(Length(allineamenti)) + '{' + strAllineamento + '}';
end;
 begin
  // assign(output,'prova.tex');
//   Rewrite(output);
 //  A:='A';
//   B:='B';
//   text:=SommaS(A,B, 7);
//   writeln(A,'  ',text);
  miatab.colonne := 6;
  miatab.caption := 'Tabella di esempio';
  SetLength(miatab.allineamenti, miatab.colonne);
  for i := 1 to miatab.colonne do
    miatab.allineamenti[i-1] := aCentro;
  strAllineamento := CreaStringaAllineamento(miatab.allineamenti);
  // ApperturaFileTex(miatab,output);
   //CorpoFileTex(output);
   //ChiusuraFileTex(output);
   //close(output);


end.

