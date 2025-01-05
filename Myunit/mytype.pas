unit MyType;
 {$MODE OBJFPC}
interface

uses
  fgl,SysUtils;
type
  TIntegerDynArray = array of Integer;
  TIntegerList = specialize TFPGList<Integer>;
  TTableData = array of array of string;
  TBooleanArray = array of Boolean;
  // gestione allineamento tabella
   TTabella = record
    colonne: integer;
    caption: string;
    allineamenti: string;
    intestazione: string;
  end;
   // \usepackage[left=30mm,right=15mm,top=20mm,bottom=20mm,bindingoffset=0cm,showframe,]{geometry}
   type
  TTDimPagina = record
    left: string;
    right: string;
    top: string;
    bottom: string;
    bindingoffset: string;
    showframe: boolean;
  end;

implementation

end.

