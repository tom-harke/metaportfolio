% Tom Harke

def arc(expr i, o, lo, hi, col) :=
   path c, p;
   c := (0,1cm){left}..(-1cm,0){down}..(0,-1cm){right}..(1cm,0){up}..cycle;
   p :=         subpath (lo,hi) of c scaled (i)
      --reverse subpath (lo,hi) of c scaled (o)
      --cycle
      ;
   fill p withcolor col;
   draw p;
enddef;

def clockface(expr radius, ang, col)(suffix p)(text bits) :=
   transform T;
   pair tip;
   path tick;
   string out;
   T := identity rotated ang scaled 1cm;

   tip := (0,radius) transformed T;
   drawarrow (0,0)--tip withcolor col;

   def bit(expr val, pos) :=
      label.p(val, (0,pos) transformed T) withcolor col;
   enddef;

   d := 0.5;
   out := "";
   for b := bits:
      out := out & decimal b;
      d := d+1;
      bit(decimal b, d);
   endfor;

   label.p(out, (0,radius) transformed T) withcolor col;
enddef;

def gray(expr n, rad, lo, hi) :=
   % This effectively renders the recurrence
   %  gray(0) = []
   %  gray(S n) = 0:gray(n) ++ 1:reverse(gray(n))
   %
   % Currently the interface is a bit wonky:
   %   - lo, hi are expected to be in the range [0,4]
   %     (why 4? probably the length of the circle defined in 'arc')
   %   - to get the desired effect have hi<lo
   if n>0:
      arc(rad, rad+1, lo, .5[lo,hi], white);
      gray(n-1,rad+1,lo,.5[lo,hi]);

      arc(rad, rad+1, hi, .5[lo,hi], 0.2[white,black]);
      gray(n-1,rad+1,hi, .5[lo,hi]);
   fi;
enddef;

beginfig(0);
gray(6,1)(4,0);
clockface(8, -60, red)(ulft)(0,0,1,1,1,1);
clockface(8,-128,blue)(urt) (0,1,1,1,0,1);
endfig;

end;
