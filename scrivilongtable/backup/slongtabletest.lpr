program slongtabletest;

{$mode objfpc}{$H+}

uses
MytYpe, Utile,sysutils;
var

miatab:tabella;

strAllineamento:string;
i:integer;
 begin

  miatab.colonne := 6;
  miatab.allineamenti:='cccc';
  strAllineamento:=miatab.allineamenti;
  writeln( strAllineamento);



end.


