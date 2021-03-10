unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Grids, StdCtrls,
  DBCtrls, matrix;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    ListBox1: TListBox;
    StringGrid1: TStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var newsize:integer;
  input:string;
begin
    input := InputBox('Изменить размерность', 'Новая размерность', '3');
    try begin
      newsize := strtoint(input);
      StringGrid1.rowcount := newsize;
      Stringgrid1.ColCount := newsize;
    end
    except
      on E: Exception do
    ShowMessage( 'Error: '+ E.ClassName + #13#10 + E.Message );
    end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var m:matrx;
  i,j,k:integer;
  row, input:string;
begin
    try begin
      input := InputBox('Введите  k', 'k=', '1');
      k:=strtoint(input);
    for i:= 1 to Stringgrid1.rowcount do
        for j:= 1 to stringgrid1.colcount do
            m.mat[i][j]:=strtoint(stringgrid1.cells[i-1,j-1]);
    m.size := stringgrid1.rowcount;
    label1.caption := orderedmain(m);
    edit1.text := maxeachcol(m);
    desccol(m,k);
    listbox1.clear;
    for i := 1 to  m.size do begin
        row := '';
        for j:= 1 to m.size do row:= row+' '+inttostr(m.mat[j][i]);
        listbox1.items.add(row)
    end;
    end
    except
      on E: Exception do
    ShowMessage( 'Error: '+ E.ClassName + #13#10 + E.Message );
    end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var i, j:integer ;
begin
  for i:= 1 to stringgrid1.rowcount do
      for j:= 1 to stringgrid1.rowcount do
          stringgrid1.cells[i-1,j-1] := inttostr(random(100)) ;
end;

end.

