function[grad] = twobody_grad(x,aoo,boo,ahh,bhh, aoh, boh, apoh, bpoh, aph, bph, apo, bpo, q)

    R16 = R(x,1,6);
    R15 = R(x,1,5);
    R26 = R(x,2,6);
    R25 = R(x,2,5);
    R48 = R(x,4,8);
    R81 = R(x,8,1);
    R82 = R(x,8,2);
    R46 = R(x,4,6);
    R45 = R(x,4,5);
    R37 = R(x,3,7);
    R36 = R(x,3,6);
    R35 = R(x,3,5);
    R71 = R(x,7,1);
    R72 = R(x,7,2);
    R47 = R(x,4,7);
    R83 = R(x,8,3);

    one_grad_1_6 = one_R_grad(x,1,6);
    one_grad_1_5 = one_R_grad(x,1,5);
    one_grad_1_8 = one_R_grad(x,1,8);
    grad_1_6 = 1/2*(1/R16)*(2*x(1:3) - x(16:18));
    grad_1_5 = 1/2*(1/R15)*(2*x(1:3) - x(13:15));
    grad_1_7 = 1/2*(1/R71)*(2*x(1:3) - x(19:21));
    grad_1_8 = 1/2*(1/R81)*(2*x(1:3) - x(22:24));
    
    one_grad_2_6 = one_R_grad(x,2,6);
    one_grad_2_5 = one_R_grad(x,2,5);
    one_grad_2_8 = one_R_grad(x,2,8);
    
    grad_2_6 = 1/2*(1/R26)*(2*x(4:6) - x(16:18));
    grad_2_5 = 1/2*(1/R25)*(2*x(4:6) - x(13:15));
    grad_2_7 = 1/2*(1/R72)*(2*x(4:6) - x(19:21));
    grad_2_8 = 1/2*(1/R82)*(2*x(4:6) - x(22:24));
    
    
    grad_3_6 = 1/2*(1/R36)*(2*x(7:9) - x(16:18));
    grad_3_5 = 1/2*(1/R35)*(2*x(7:9) - x(13:15));
    grad_3_7 = 1/2*(1/R37)*(2*x(7:9) - x(19:21));
    grad_3_8 = 1/2*(1/R83)*(2*x(7:9) - x(22:24));
    
    grad_4_6 = 1/2*(1/R46)*(2*x(10:12) - x(16:18));
    grad_4_5 = 1/2*(1/R45)*(2*x(10:12) - x(13:15));
    grad_4_7 = 1/2*(1/R47)*(2*x(10:12) - x(19:21));
    
    one_grad_4_5 = one_R_grad(x,4,5);
    one_grad_4_6 = one_R_grad(x,4,6);
    one_grad_4_8 = one_R_grad(x,4,8);
    
    
    grad(1:3) = q^2*(one_grad_1_6+one_grad_1_5 - 2*one_grad_1_8) ...
                - ahh*bhh*(exp(-bhh*R16)*grad_1_6 +  exp(-bhh*R15)*grad_1_5 )...
                - aoh*( boh*exp(-boh*R71)* grad_1_7) + apoh*( bpoh* exp(-bpoh*R71)* grad_1_7)...
                - aph*(bph*exp(-bph*R81)*grad_1_8);
            
    grad(4:6) = q^2*(one_grad_2_6+one_grad_2_5 - 2*one_grad_2_8) ...
                - ahh*bhh*( exp(-bhh*R26)* grad_2_6 +  exp(-bhh*R25)* grad_2_5 )...
                - aoh*( boh*exp(-boh*R72)* grad_2_7) + apoh*( bpoh* exp(-bpoh*R72)* grad_2_7)...
                - aph*(bph*exp(-bph*R82)*grad_2_8);
            
    grad(7:9) = -aoo*boo*R37*grad_3_7 - aoh*(boh*exp(-boh*R36)*grad_3_6 + boh*exp(-boh*R35)*grad_3_5)...
                + apoh*(bpoh*exp(-bpoh*R36)*grad_3_6 + bpoh*exp(-bpoh*R35)*grad_3_5)...
                - apo*exp(-bpo*R83)*grad_3_8;
    
    
    grad(10:12) = 4*q^2*one_grad_4_8-2*q^2*(one_grad_4_5 + one_grad_4_6) ...
                -aph*( exp(-bph*R46)* grad_4_6 +  exp(-bph*R45)* grad_4_5 )...
                - apo*exp(-bpo*R47)*grad_4_7;
   
    
        
end