function[sum] = totalinter(x,d,aoo,boo,ahh,bhh, aoh, boh, apoh, bpoh, aph, bph, apo, bpo, q)
    len = length(x);
    
    unit = 4*d;
    num = len/unit;
    sum = 0;
    for  i = 1:num
        
        for j=i+1:num
            first = x((unit*i-unit+1):unit*i);
            second = x((unit*j-unit+1):unit*j);
            res = [first second];
            tmp = twobody(res,aoo,boo,ahh,bhh, aoh, boh, apoh, bpoh, aph, bph, apo, bpo, q);
            sum= sum+tmp;
        end
        
    end
    

end
