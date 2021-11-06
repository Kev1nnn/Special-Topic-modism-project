function[total] = total_intra_grad(x,Re,te,frr,ftt)
    len = length(x);
    
    total = zeros(len,1);

    for i = 1:len/12
        total(i*12-11:i*12) = intra_grad(x(i*12-11:i*12),Re,te,frr,ftt);
    end
    

end