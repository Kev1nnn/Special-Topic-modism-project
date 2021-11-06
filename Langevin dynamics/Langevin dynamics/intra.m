function[intra] = intra(x,Re,te,frr,ftt,frrp,frt,frrr,fttt,frrrp,frrt,frrpt,frtt,frrrr,ftttt,frrrrp,frrrprp,frrrt,frrrpt,frrtt,frrptt,frttt)
    delta1 = R(x,1,3)-Re;
    delta2 = R(x,2,3)-Re;
    delta3 = Re*(angle(x)-te);
    
    intra = 0.5*frr*(abs(delta1)^2+abs(delta2)^2)^2+0.5*ftt*delta3^4;
        %frrp*delta1*delta2+frt*(delta1+delta2)*delta3+...
        %1/Re*(frrr*(delta1^3+delta2^3)+fttt*delta3^3+frrrp*(delta1+delta2)*delta1*delta2+frrt*(delta1^2+delta2^2)*delta3+frrpt*delta1*delta2*delta3+frtt*(delta1+delta2)*delta3^2)+...
        %1/Re^2*(frrrr*(delta1^4+delta2^4)+ftttt*delta3^4+frrrrp*(delta1^2+delta2^2)*delta1*delta2+frrrprp*delta1^2*delta2^2+frrrt*(delta1^3+delta2^3)*delta3)+...
        %1/Re^2*(frrrpt*(delta1+delta2)*delta1*delta2*delta3+frrtt*(delta1^2+delta2^2)*delta3^2+frrptt*delta1*delta2*delta3^2+frttt*(delta1+delta2)*delta3^3);



end