% MILLOT & DUCHANGE

function [] = fonctions_bsplines(t,m,color)
  
  imax = length(t)-m-1;
  x = (0:0.01:t(end));
  x3 =  zeros(1,length(x))
  for i=1:imax
    y1 = [];
    x1 = [];
    for j=(1:length(x))
     y1(j)  = x(j) ;
     x1(j)  = N(m,i,t,x(j)); %fonction B-plines
     x3(j) += x1(j) ; 
    endfor
    hold on;
    plot(y1,x3,y1,x1,color);
  endfor
endfunction

function [v] = N(m,i,t,x)
  if(m==0) 
    if(t(i) <= x && t(i+1) > x) %conditions initiales
      v= 1;
    else
      v= 0;
    endif 
  else
    if((t(i+m) == t(i))) % condition pour éviter de diviser par zero
      v1 = 0;
    else
      v1= ((x-t(i))/(t(i+m)-t(i)))*N(m-1,i,t,x) ;
    endif
    %*****************************
    if((t(i+m+1)==t(i+1)))% condition pour éviter de diviser par zero
      v2 = 0;
    else
      v2= ((t(i+m+1)-x)/(t(i+m+1)-t(i+1)))*N(m-1,i+1,t,x);
    endif
    v = v1+v2 ;%et voila!
    
    
  endif
endfunction