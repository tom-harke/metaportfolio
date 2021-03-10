
vardef teardrop(expr idx)(suffix guides)(suffix dirs) :=
        guides[idx+0]{dirs0}
      ..guides[idx+2]{dirs1}
      ..guides[idx+1]{dirs2}
      ..guides[idx+0]{dirs3}
      --cycle
enddef;

beginfig(0);
   n := 19;
   pair d[], e[];
   d0 = d2 = up;
   d1 = d3 = down;
   e0 = e2 = down;
   e1 = e3 = up;

   z0 = (0,0);

   (1cm,0)
   for i:=0upto 2*(n+1):
      = z[i+1]-z[i]
   endfor;

   path p[];
   for i:=0upto n:
      p[2*i  ] = teardrop(2*i  ,z,d); fill(p[2*i  ]) withcolor green; draw(p[2*i  ]);
      p[2*i+1] = teardrop(2*i+1,z,e); fill(p[2*i+1]) withcolor red;   draw(p[2*i+1]);
   endfor;
endfig;
end;
