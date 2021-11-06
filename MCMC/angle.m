function[angle]= angle(x)

a=R(x,1,3);
a2 = a^2;
b =R(x,2,3);
b2 = b^2;
c = R(x,1,2);
c2 = c^2;
pos = (a2+b2-c2)/(2*a*b);

angletemp = acos(pos);

angle = angletemp;

end