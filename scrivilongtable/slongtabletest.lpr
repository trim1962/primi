program slongtabletest;

{$mode objfpc}{$H+}

uses
MytYpe, Utile,sysutils;
var

miatab:TTabella;
pagina: TTDimPagina;
strAllineamento:string;
i:integer;
 begin

  miatab.colonne := 6;
  miatab.allineamenti:='cccc';
  strAllineamento:=miatab.allineamenti;
  writeln( strAllineamento);
    pagina.left := '30mm';
  pagina.right := '15mm';
  pagina.top := '20mm';
  pagina.bottom := '20mm';
  pagina.bindingoffset := '0cm';
  pagina.showframe := True;
 if pagina.showframe then
  writeln(f, ' \usepackage[left=', pagina.left, ',right=', pagina.right, ',top=', pagina.top, ',bottom=', pagina.bottom, ',bindingoffset=', pagina.bindingoffset, ',showframe]{geometry} ');
else
  writeln(f, ' \usepackage[left=', pagina.left, ',right=', pagina.right, ',top=', pagina.top, ',bottom=', pagina.bottom, ',bindingoffset=', pagina.bindingoffset, ']{geometry} ');



end.

