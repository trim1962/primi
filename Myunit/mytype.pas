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
  // gestione geometry della pagina
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

