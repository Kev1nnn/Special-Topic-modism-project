function grad = one_R_grad(x,i,j)

    square = (x(3*i-1)-x(3*j-1))^2 + (x(3*i-2)-x(3*j-2))^2 + (x(3*i)-x(3*j))^2;
    R = sqrt(square);
    
    grad = (1/2*x(3*j-2:3*j) - x(3*i-2:3*i))/(R^3);
    
end