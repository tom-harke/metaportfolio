numeric loose, tight;
loose := 3/4;
tight := 2;

def triangle(expr a,b,c) :=
   c = b rotatedaround(a,60);
enddef;

def preserve_shape(expr t) :=
   xxpart t =  yypart t;
   xypart t = -yxpart t;
enddef;

def render_as_line(expr pth, dt)(text ts) :=
   % Purpose:
   %   Erase & redraw the points where a path crosses itself.
   %
   % Args:
   %   pth is a path, presumably a knot
   %   dt  is a delta in time, big enough that when the upper edge of the crossing is repaired that edge is still continuous
   %   ts  is a list of times at which a crossing happens
   begingroup;
   save lo, hi;
   draw trefoil;
   forsuffixes t := ts:
      lo := t-dt;
      hi := t+dt;
      fill fullcircle scaled 5pt shifted point t of pth withcolor white;
      draw subpath (lo,hi) of pth withcolor black;
   endfor;
   endgroup;
enddef;

def render_as_rope(expr pth, dt, repair)(text ts) :=
   % Purpose:
   %   Erase & redraw the points where a path crosses itself.
   %
   % Args:
   %   pth is a path, presumably a knot
   %   dt  is a delta in time, big enough that when the upper edge of the crossing is repaired that edge is still continuous
   %   repair if true only touches up the knot crossings.
   %          if false draws the whole curve & touches up crossings.
   %   ts  is a list of times at which a crossing happens
   begingroup;
   save lo, hi, thick;
   pen thick;
   thick := pencircle scaled 1.5;
   if not repair:
      draw pth withpen thick;
      draw pth withcolor white;
   fi;
   % Repair the crossings
   forsuffixes t := ts:
      lo := t-dt;
      hi := t+dt;
      draw subpath (0.5[lo,t],0.5[hi,t]) of pth withpen thick;
      draw subpath (lo,hi) of pth withcolor white;
   endfor;
   endgroup;
enddef;

%(
beginfig(0) % A trefoil knot, rotationally symmetric
   % Position some guide points
   z0 = (0,0);
   z2-z1=(1cm,0);
   triangle(z0,z1,z2);
   % Build the path
   path trefoil;
   trefoil = z0..tension loose..
             z1..tension tight..
             z2..tension loose..
             z0..tension tight..
             z1..tension loose..
             z2..tension tight..
             cycle;
   render_as_line(trefoil,0.3)(1,3,5);
endfig;
%)

beginfig(1) % A trefoil knot, reflectionally symmetric
   % Position some guide points
   z0=origin;
   z2-z1=z1-z0=(0,1cm);

   % Position some guide points
   pair zig, zag;
   zig = (-1,1);
   zag = ( 1,1);
   % Build the path
   path trefoil;
   trefoil = z0{zig}..z1{zag}..z2{zig}..tension tight..
             z0{zag}..z1{zig}..z2{zag}..tension tight..
             cycle;
   render_as_rope(trefoil,0.3,false)(1,3,5);
endfig;


%(
beginfig(2) % Whitehead link
   % Position some guide points
   pair tl, bl, tr, br;
   tl = (0,1cm) rotated 60;
   bl = (0,1cm) rotated 120;
   br = (0,1cm) rotated 240;
   tr = (0,1cm) rotated 300;
   % Build the path
   path circ, link;
   circ = tl..tr..br..bl..cycle;
   link = tl..origin..br..tension loose..tr..origin..bl..tension loose..cycle;
   % Render. Since it has 2 components we need to go back & repair the 1st
   render_as_rope(circ,0.3,false)(0);
   render_as_rope(link,0.3,false)(1);
   render_as_rope(circ,0.3,true)(0,1);
endfig;
%)
end
