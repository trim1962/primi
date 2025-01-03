unit Utile;

{$mode ObjFPC}{$H+}

interface

uses
  Mytype;
  function IsInList(value: Integer; list: TIntegerList): Boolean;
implementation
// cerca un valore in una lista
  function IsInList(value: Integer; list: TIntegerList): Boolean;
var
  i: Integer;
begin
  for i := 1 to list.Count - 1 do
    if list[i] = value then
      Exit(True);
  Exit(False);
end;
end.

