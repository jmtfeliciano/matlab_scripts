function eulerr(f, w, h, t)

 

w1 = f(w,h,t)

t = t + h;

 

w2 = f(w1,h,t)

t = t + h;

 

w3 = f(w2,h,t)

t = t + h;

 

w4 =  f(w3,h,t) 

 

end