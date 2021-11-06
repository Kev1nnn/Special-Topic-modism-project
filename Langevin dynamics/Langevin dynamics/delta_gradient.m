function d_delta = delta_gradient(x,Re,k)
        
        x1 = x(1:3);
        x2 = x(4:6);
        x3 = x(7:9);
        
        if(k==3)
            
            denom = -sqrt(1 - cos(angle(x)).^2);
            d_delta(1:3) = (x2 - x3)./denom/Re;
            d_delta(4:6) = (x1 - x3)./denom/Re;
            d_delta(7:9) = (2*x3 - x1 - x2)./denom/Re;
            d_delta(10:12) = 0;
            
        else
            
            d_delta = grad_R(x,k,3);
            
        end


end