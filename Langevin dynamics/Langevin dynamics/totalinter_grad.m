function[sum] = totalinter_grad(x,aoo,boo,ahh,bhh, aoh, boh, apoh, bpoh, aph, bph, apo, bpo, q)
    len = length(x);
    unit = 12;
    num = len/unit;
    sum = zeros(len,1);
    
    for  i = 1:num
        
        for j= 1:num
            if(i ~= j)
            first = x((unit*i-unit+1):unit*i);
            second = x((unit*j-unit+1):unit*j);
            res = [first second];
            tmp = twobody_grad(res,aoo,boo,ahh,bhh, aoh, boh, apoh, bpoh, aph, bph, apo, bpo, q);
            sum((unit*i-unit+1):unit*i)= sum((unit*i-unit+1):unit*i)+tmp';
            end
        end
        
    end
end
