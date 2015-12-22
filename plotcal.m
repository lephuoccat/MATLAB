[x,y]=meshgrid(-100:0.01:100);
z=-3*x*y+x^3-y^3+1/8;
mesh(x,y,z)