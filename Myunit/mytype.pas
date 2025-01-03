unit MyType;
 {$MODE OBJFPC}
interface

uses
  fgl,sysutils;
type
  TIntegerDynArray = array of Integer;
  TIntegerList = specialize TFPGList<Integer>;
  TTableData = array of array of string;
  TBooleanArray = array of Boolean;
implementation

end.

