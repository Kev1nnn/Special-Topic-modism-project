function[twobody] = twobody(x,aoo,boo,ahh,bhh, aoh, boh, apoh, bpoh, aph, bph, apo, bpo, q)
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

    twobody  = q^2*(1/R16+1/R15+1/R26+1/R25)+4*q^2/R48-2*q^2*(1/R81+1/R82+1/R46+1/R45)+aoo*exp(-boo*R37)+...
        +ahh*(exp(-bhh*R16)+exp(-bhh*R15)+exp(-bhh*R26)+exp(-bhh*R25))+...
        +aoh*(exp(-boh*R36)+exp(-boh*R35)+exp(-boh*R71)+exp(-boh*R72))+...
        -apoh*(exp(-bpoh*R36)+exp(-bpoh*R35)+exp(-bpoh*R71)+exp(-bpoh*R72))+...
        +aph*(exp(-bph*R46)+exp(-bph*R45)+exp(-bph*R81)+exp(-bph*R82))+...
        +apo*(exp(-bpo*R47)+exp(-bpo*R83));
        
end