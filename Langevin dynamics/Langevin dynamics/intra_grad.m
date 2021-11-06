function[intra] = intra_grad(x,Re,te,frr,ftt,frrp,frt,frrr,fttt,frrrp,frrt,frrpt,frtt,frrrr,ftttt,frrrrp,frrrprp,frrrt,frrrpt,frrtt,frrptt,frttt)
    delta1 = R(x,1,3)-Re;
    delta2 = R(x,2,3)-Re;
    delta3 = Re*(angle(x)-te);
    
    d_delta1 = delta_gradient(x,Re,1);
    d_delta2 = delta_gradient(x,Re,2);
    d_delta3 = delta_gradient(x,Re,3);
    
    d_delta1_3 = grad_R(x,3,1);
    d_delta2_3 = grad_R(x,3,2);
    
    intra(1:3) = frr*(delta1*d_delta1)+0.5*ftt*delta3*2*d_delta3(1:3)';
    
    intra(4:6) = frr*(delta1*d_delta2)+0.5*ftt*delta3*2*d_delta3(4:6)';
    
    intra(7:9) = frr*(delta1*d_delta1_3 + delta2*d_delta2_3)+0.5*ftt*delta3*2*d_delta3(7:9)';
    
    intra(10:12) = 0;

end