unit writecsv;

interface

uses
  SysUtils,MyType;

procedure ScriviCsv(const dati: array of string; const filename: string; const delimiter: char = ',');
procedure ScriviTabellaDaListaPrimiCsv(primes: TIntegerList; filename: string;
                            const numColumns: Integer; const caption: string = '');
implementation

procedure ScriviCsv(const dati: array of string; const filename: string; const delimiter: char);
var
  output: TextFile;
  i: Integer;
begin
  AssignFile(output, filename);
  Rewrite(output);

  for i := 0 to High(dati) do
  begin
    Write(output, dati[i]);
    if i < High(dati) then
      Write(output, delimiter);
  end;
  Writeln(output);

  CloseFile(output);
end;
 procedure ScriviTabellaDaListaPrimiCsv(primes: TIntegerList; filename: string;
                            const numColumns: Integer; const caption: string = '');
var
  output: TextFile;
  data: TTableData;
  i, j,riga: Integer;
begin
   AssignFile(output, filename);
  Rewrite(output);
  SetLength(data, Trunc(primes.Count / numColumns) + 1, numColumns);
  riga := 0;
  for i := 0 to primes.Count - 1 do
  begin
    data[riga, i mod numColumns] := IntToStr(primes[i]);
    if (i + 1) mod numColumns = 0 then
      Inc(riga);
  end;

  // Controlla se il nome del file è vuoto
  if filename = '' then
  begin
    writeln('Nome file non specificato.');
    Exit;
  end;



  for i := 0 to High(data) do
  begin
    for j := 0 to High(data[i]) - 1 do
    begin
      Write(output, data[i, j]);
      if j < High(data[i]) then
        Write(output, ',');
    end;
    writeln(output);
  end;
   writeln(output);
  CloseFile(output);
end;

end.
