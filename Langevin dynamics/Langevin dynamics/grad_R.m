function dR = grad_R(x,i,j)

    dR = 1/2*(1/R(x,i,j))*(2*x(3*i-2:3*i) - x(3*j-2:3*j));

end