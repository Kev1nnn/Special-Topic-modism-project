function[R] = R(x,i,j)
    square = (x(3*i-1)-x(3*j-1))^2 + (x(3*i-2)-x(3*j-2))^2 + (x(3*i)-x(3*j))^2;
    R = sqrt(square);
end