% Tom Harke
%
% Todo:
%  - document the invariant the holds of the snakes

size := 100;

% 5 points are needed to frame (one iteration of) the curve
%       up
%        |
%   lp--cp--rp
%        |
%       dp
pair cp, rp, up, lp, dp;
cp := (0,0);
rp := (1,0);
up := rp rotated  90;
lp := rp rotated 180;
dp := rp rotated 270;

path snake, circle;
path snakes[];
circle    := dp{left}..{up}lp..{right}up..{down}rp..cycle;
snakes[0] := dp{left}..{up}lp..{down}cp..{up}rp..{left}up;

beginfig(1);
draw circle    scaled size;
draw snakes[0] scaled size;
endfig;

def wiggle(expr p) :=
   % about:
   %    Makes a more wiggly path by taking 2 copies of an existing path, connecting them, and a few extra arcs.
   % pre:
   %    p is a path for which the invariant holds
   % post:
   %    returns a path for which the invariant holds,
     dp{left}..{up}lp                      % arc in
   --(p rotated -90 shifted lp scaled 0.5) % copy 1
   --(p rotated -90 shifted rp scaled 0.5) % copy 2
   --rp{up}..{left}up                      % arc out
enddef;

def close(expr p) :=
   % pre:
   %    p is a path for which the invariant holds
   % post:
   %    returns a closed path
   p{right}..rp..cycle
enddef;

snakes[1] := wiggle(snakes[0]);
snakes[2] := wiggle(snakes[1]);
snakes[3] := wiggle(snakes[2]);
snakes[4] := wiggle(snakes[3]);
snakes[5] := wiggle(snakes[4]);
snakes[6] := wiggle(snakes[5]);

beginfig(0);
draw circle           scaled size withcolor black;
fill close(snakes[6]) scaled size withcolor black;
endfig;

end;
