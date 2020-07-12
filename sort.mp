% Tom Harke

vardef loadarray(suffix array)(text elements) :=
   % Purpose: to load a comma-separated list of items into an array
   save i, n;
   n := 0;
   forsuffixes i := elements:
      array[n] := i;
      n := n+1;
   endfor
enddef;


% The array 'data' is what will be sorted.
% It holds a permuation of the numbers 0..63
numeric data[];
def loadrandom :=
   % Purpose: to (re)initialize data[] with fixed random-looking permutation of 0..63
   loadarray(data)(
         26,41,20,28,63,14,31,60
        ,24,42,58,29,23, 3, 9,49
        ,25,47,39,53,52,54,30, 4
        , 5, 6,13,16,21,33,40,59
        ,51,44, 8,35,37, 1,46,62
        ,27,10,55,34,32,45,11,15
        ,57, 7,43,38,48, 0,36,17
        ,18,50,19,61,56,12, 2,22
   )
enddef;

def render(expr n) :=
   % Purpose: graph the permutation held in data[]
   % Plot guide lines
   % Todo: consider moving this elsewhere -- it may not be applicable to all sorting algorithms
   draw (0,n+1)--(64,n+1) withcolor green;
   draw (n+1,0)--(n+1,64) withcolor green;
   % Plot the permutation
   for i=0 upto 63:
      fill unitsquare shifted (i,data[i]);
   endfor;
enddef;

vardef swap(expr a,b) :=
   save tmp;
   tmp := data[a];
   data[a] := data[b];
   data[b] := tmp;
enddef;

vardef select(expr lo,hi) :=
   save best;
   best := lo;
   for j:=lo upto hi:
      if data[j] < data[best]:
         best := j;
      fi;
   endfor;
   best
enddef;

numeric snapshot[];
loadarray(snapshot)(4,8,16,32,48,56,60);

for n:=0,1,2,3,4,5,6:
   loadrandom;
   beginfig(n);
   for i:=0 upto snapshot[n]:
      k := select(i,63);
      swap(i,k);
   endfor;
   render(snapshot[n]);
   draw (0,0)--(0,64)--(64,64)--(64,0)--cycle;
   endfig;
endfor;

end;

