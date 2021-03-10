unit matrix;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

const N =1000;

type ar = array[1..N] of integer;

type matrx = record
  mat:array[1..N] of ar;
  size:integer;
end;

procedure sort(var a:ar; size: Integer);
function orderedmain(m:matrx):string;
function maxeachcol(m:matrx):string;
procedure desccol(var m:matrx; k:integer);
implementation
procedure sort(var a:ar; size:integer);
var buf:integer;
i, j:integer;
begin
  for j := size -1 downto 1 do
      for i:= 2 to j+1 do
          if a[i-1]>a[i] then begin
            buf := a[i-1];
            a[i-1] := a[i];
            a[i] := buf;
          end;
end;

function orderedmain(m:matrx):string;
var i:integer;
rval:string;
main:ar;
begin
   for i := 1 to m.size do
       main[i] := m.mat[i][i];
   sort(main, m.size);
   rval := ' ';
   for i:= 1 to m.size do
       rval:= rval + ' ' + inttostr(main[i]) ;
    orderedmain:=rval;
end;

function maxeachcol(m:matrx):string;
var i, j, max:integer;
rvalue:string;
BEGIN
   for i:= 1 to m.size do begin
     max:=-10000;
     for j:= 1 to m.size do if m.mat[i,j]>max then max := m.mat[i,j];
     rvalue:=rvalue+' '+inttostr(max);
   end;
   maxeachcol:=rvalue;
end;

procedure desccol(var m:matrx; k:integer);
var i, j, buf:integer;
begin
  for j := m.size -1 downto 1 do
      for i:= 2 to j+1 do
          if m.mat[k][i-1]<m.mat[k][i] then begin
            buf := m.mat[k][i-1];
            m.mat[k][i-1] := m.mat[k][i];
            m.mat[k][i] := buf;
          end;
end;

end.

