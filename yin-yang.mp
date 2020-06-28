size := 100;

path snake, circle;
circle := (0,-1){left}
            ..{up}(-1,0)
            ..{right}(0,1)
            ..{down}(1,0)
            ..cycle;
snake  := (0,-1){left}
            ..{up}(-1,0)
            ..{down}(0,0)
            ..{up}(1,0)
            ..{left}(0,1);

beginfig(1);
draw circle scaled size;
draw snake  scaled size;
endfig;

beginfig(2);
draw circle scaled size withcolor black;
%draw snake  scaled size;
path second;
second := (0,-1){left}..{up}(-1,0)
   --(snake rotated -90 shifted (-1,0) scaled 0.5)
   --(snake rotated -90 shifted ( 1,0) scaled 0.5)
   --(1,0){up}..{left}(0,1)
   ;
%draw second  scaled size withcolor red;

%(
path third;
third := (0,-1){left}..{up}(-1,0)
   --(second rotated -90 shifted (-1,0) scaled 0.5)
   --(second rotated -90 shifted ( 1,0) scaled 0.5)
   --(1,0){up}..{left}(0,1)
   ;
%draw third  scaled size withcolor green;
%)

%(
path fourth;
fourth := (0,-1){left}..{up}(-1,0)
   --(third rotated -90 shifted (-1,0) scaled 0.5)
   --(third rotated -90 shifted ( 1,0) scaled 0.5)
   --(1,0){up}..{left}(0,1)
   ;
%draw fourth  scaled size withcolor green;
%fill fourth{right}..(1,0)..cycle scaled size withcolor black
%)

%(
path fifth;
fifth := (0,-1){left}..{up}(-1,0)
   --(fourth rotated -90 shifted (-1,0) scaled 0.5)
   --(fourth rotated -90 shifted ( 1,0) scaled 0.5)
   --(1,0){up}..{left}(0,1)
   ;
%draw fifth  scaled size withcolor black;
fill fifth{right}..(1,0)..cycle scaled size withcolor black
%)



endfig;

end;
