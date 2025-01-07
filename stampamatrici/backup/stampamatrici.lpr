program stampamatrici;

{$mode objfpc}{$H+}

uses
MyType;
const
  MaxRighe = 20;
  MaxColonne = 6;
var
 tabella:TTmatrice;
 i,j,n:integer;
begin
  SetLength(tabella,MaxRighe,MaxColonne);


  for n:=1 to 60 do
  for i:=1 to MaxRighe-1 do
  for j:=1 to MaxColonne -1do
  begin
  tabella[i,j]:=n;
  writeln(i:5,j:5,n:5);

  end;
end.

