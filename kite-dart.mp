units := 360/10;

def ooh(suffix t) :=
   pair t.a, t.b, t.c;
   %t.c = t.b rotatedaround(t.a,1*units);
enddef;

def speckle(suffix p) :=
   for i:=0 upto 9:
      draw (p+(0,3pt)) rotatedaround(p,(i+0.5)*units) withpen pencircle scaled 1;
   endfor;
enddef;

beginfig(0);

ooh(foo);


pair d.a, d.dip, d.b, d.tip;
d.tip := (0,0);
d.dip := (0,1cm);
d.a = d.b rotatedaround(d.tip,2*units);
d.a = d.b rotatedaround(d.dip,4*units);
draw d.tip--d.a--d.dip--d.b--cycle;

draw d.tip--d.dip;

%draw d.a withpen pencircle scaled 2;

speckle(d.a);
speckle(d.b);
speckle(d.dip);
speckle(d.tip);
%dotlabel.rt("", d.a);

pair k.a, k.tail, k.b, k.head;

%k.tail := d.b;
%k.a := d.tip;

%k.b = k.a rotatedabout(k.tail,2*units);
%k.a = k.b rotatedabout(k.head,4*units);
endfig;

end;
