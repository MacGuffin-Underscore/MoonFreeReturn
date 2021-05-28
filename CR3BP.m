function ddt = CR3BP(~,X,mu1,mu2,rb1,rb2,omega)
x = X(1);  y = X(2);  z = X(3);
dx = X(4); dy = X(5); dz = X(6);
r1 = sqrt((x+rb1)^2+y^2+z^2);
r2 = sqrt((x-rb2)^2+y^2+z^2);

V2 = [dx;dy;dz];
A2 = [(-mu1/r1^3)*(x+rb1) - (mu2/r2^3)*(x-rb2) + omega^2*x + 2*omega*dy;
      (-mu1/r1^3)*y - (mu2/r2^3)*y - 2*omega*dx + omega^2*y;
      (-mu1/r1^3)*z - (mu2/r2^3)*z];

ddt = [V2;A2];
end