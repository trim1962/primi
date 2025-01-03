unit writelatex;

interface

uses
  SysUtils, Mytype;




procedure ScriviTabellaDaMatriceTex(const data: TTableData; const filename: string;
                            const caption: string = '');

procedure ScriviTabellaDaListaPrimiTex(primes: TIntegerList; filename: string;
                            const numColumns: Integer; const caption: string = '');

implementation

procedure ScriviTabellaDaMatriceTex(const data: TTableData; const filename: string;
                            const caption: string = '');
var
  output: TextFile;
  i, j: Integer;
  numColumns: Integer;
begin
  AssignFile(output, filename);
  Rewrite(output);
  writeln(output, '\documentclass{article}');
  writeln(output, '\usepackage{longtable}');
  writeln(output, '\usepackage{booktabs}');
  writeln(output, '\begin{document}');

  if High(data) >= 0 then
  begin
    numColumns := Length(data[0]);
    writeln(output, '\begin{longtable}{*{', numColumns:0, '}{c}}');
  end
  else
  begin
    // Gestisci il caso di una matrice vuota
    writeln(output, '\begin{longtable}{c}');
  end;

  if caption <> '' then
    writeln(output, '\caption{', caption, '}\label{tab:', caption, '}');
  writeln(output, '\endhead');
  writeln(output, '\toprule');

  for i := 0 to High(data) do
  begin
    for j := 0 to High(data[i]) - 1 do
    begin
      write(output, data[i, j]:5);
      if j < High(data[i]) then
        write(output, ' & ');
    end;
    writeln(output, '\\');
  end;

  writeln(output, '\bottomrule');
  writeln(output, '\end{longtable}');
  writeln(output, '\end{document}');

  CloseFile(output);
end;

procedure ScriviTabellaDaListaPrimiTex(primes: TIntegerList; filename: string;
                            const numColumns: Integer; const caption: string);
var
  data: TTableData;
  i, riga: Integer;
begin
  SetLength(data, Trunc(primes.Count / numColumns) + 1, numColumns);
  riga := 0;
  for i := 0 to primes.Count - 1 do
  begin
    data[riga, i mod numColumns] := IntToStr(primes[i]);
    if (i + 1) mod numColumns = 0 then
      Inc(riga);
  end;

  ScriviTabellaDaMatriceTex(data, filename, caption);
end;

end.

