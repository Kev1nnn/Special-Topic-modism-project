function[sum] = total_intra(x,d,Re,te,frr,ftt,frrp,frt,frrr,fttt,frrrp,frrt,frrpt,frtt,frrrr,ftttt,frrrrp,frrrprp,frrrt,frrrpt,frrtt,frrptt,frttt)
    len = length(x);
    
    unit = 4*d;
    num = len/unit;
    sum = 0;

    for i = 1:num
        tmp = intra(x((unit*i-unit+1):unit*i),Re,te,frr,ftt,frrp,frt,frrr,fttt,frrrp,frrt,frrpt,frtt,frrrr,ftttt,frrrrp,frrrprp,frrrt,frrrpt,frrtt,frrptt,frttt);
        sum = sum+(0.01*tmp)^2;
    end
    

end