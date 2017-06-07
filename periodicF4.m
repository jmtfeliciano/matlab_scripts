function [C,evaluate,error,norm2] = periodicF4(T,Y)

syms t C1 C2 C3 C4; B=Y';
F4 = C1 + C2 * cos(2*pi*t) + C3 * sin(2*pi*t) + C4 * cos (4*pi*t); 
CMax = 4; % C1,..C3 so CMax=3

A = ones(length(T),CMax); %matrix that will be replaced later row by row

for i = 1:length(T)
    A(i,:) = equationsToMatrix(subs(F4,t,T(i)),[C1, C2, C3 C4]);
end

AT = A.' ; ATA = AT * A; ATB = AT * Y'; C = (ATA\ATB)';

model = subs(F4,[C1 C2 C3 C4],C);  

evaluate = [1:length(T)]; error = [1:length(T)];

for i = 1:length(T)
   evaluate(i) = subs(model,t,T(i));
    error(i) = Y(i) - evaluate(i);
end

norm2 = ( sum(error.^2))^0.5;    
end












