% Tom Harke
%
% Todo:
%  - document the invariant the holds of the snakes

size := 50;

% 5 points are needed to frame (one iteration of) the curve
%      u
%      |
%   l--c--r
%      |
%      d
pair c, r, u, l, d;
c := (0,0);
r := (1,0);
u := r rotated  90;
l := r rotated 180;
d := r rotated 270;

path circle, snakes[];
path arc_in, arc_out;
arc_in    := d{left}..{u}l;
arc_out   := r{up}..{left}u;
circle    := arc_in..{right}u..{down}r..cycle;
snakes[0] := arc_in..{down}c..arc_out;

transform copy[];
copy[1] = identity rotated -90 shifted l scaled 0.5;
copy[2] = identity rotated -90 shifted r scaled 0.5;

def wiggle(expr p) :=
   % about:
   %    Makes a more wiggly path by taking 2 copies of an existing path, connecting them, and a few extra arcs.
   % pre:
   %    p is a path for which the invariant holds
   % post:
   %    returns a path for which the invariant holds,
     arc_in
   --(p transformed copy[1]) % copy 1
   --(p transformed copy[2]) % copy 2
   --arc_out
enddef;

def close(expr p) :=
   % pre:
   %    p is a path for which the invariant holds
   % post:
   %    returns a closed path
   p{right}..r..cycle
enddef;

snakes[1] := wiggle(snakes[0]);
snakes[2] := wiggle(snakes[1]);
snakes[3] := wiggle(snakes[2]);
snakes[4] := wiggle(snakes[3]);
snakes[5] := wiggle(snakes[4]);
snakes[6] := wiggle(snakes[5]);

beginfig(0);
draw circle           scaled size withcolor black;
fill close(snakes[6]) scaled size withcolor 0.0[black,white];
endfig;

def references :=
   dotlabel.lft(btex l etex, l scaled size);
   dotlabel.ulft(btex c etex, c scaled size);
   dotlabel.top(btex u etex, u scaled size);
   dotlabel.bot(btex d etex, d scaled size);
   dotlabel.rt(btex r etex, r scaled size);
enddef;

def context(expr p,t) :=
   draw p transformed t scaled size dashed evenly withcolor 0.5[black,white];
enddef;

def arc(expr p,t) :=
   drawarrow p transformed t scaled size;
enddef;

def spark(expr p,t) :=
   drawarrow p transformed t scaled size withcolor red withpen pencircle scaled 2pt;
enddef;

target := 3;
%(
beginfig(1);
fill close(snakes[target]) scaled size withcolor green;
context(circle,identity);
spark(d--u,identity);

references;
endfig;

beginfig(2);
transform t;
fill close(snakes[target]) scaled size withcolor green;
t := identity;
context(circle,t);
arc(arc_in,t);
arc(arc_out,t);
for i:=1,2:
   t := copy[i];
   context(circle,t);
   spark(d--u,t);
endfor;
references;
endfig;
%)

beginfig(3);
transform t;
fill close(snakes[target]) scaled size withcolor green;
t := identity;
context(circle,t);
arc(arc_in,t);
arc(arc_out,t);
for i:=1,2:
   t := copy[i];
   context(circle,t);
   arc(arc_in,t);
   arc(arc_out,t);
   for j:=1,2:
      t := copy[i] transformed copy[j];
      context(circle,t);
      spark((d--u),t);
   endfor;
endfor;
references;
endfig;

beginfig(4);
transform t;
fill close(snakes[target]) scaled size withcolor green;
t := identity;
context(circle,t);
arc(arc_in,t);
arc(arc_out,t);
for i:=1,2:
   t := copy[i];
   context(circle,t);
   arc(arc_in,t);
   arc(arc_out,t);
   for j:=1,2:
      t := copy[i] transformed copy[j];
      context(circle,t);
      arc(arc_in,t);
      arc(arc_out,t);
      for k:=1,2:
         t := copy[i] transformed copy[j] transformed copy[k];
         context(circle,t);
         spark(d--u,t);
      endfor;
   endfor;
endfor;
references;
endfig;

%(
beginfig(11);
context(circle,identity);
spark(d--u,identity);

references;
endfig;

beginfig(12);
transform t;
t := identity;
context(circle,t);
arc(arc_in,t);
arc(arc_out,t);
for i:=1,2:
   t := copy[i];
   context(circle,t);
   spark(d--u,t);
endfor;
references;
endfig;
%)
%
end;
