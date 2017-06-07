function [RMSE,POLY] = leastsquare(X,Y,DEGREE)

cvalue = polyfit(X,Y,DEGREE); % find c-values which is dependent on points

%With eq such as y=c1+c2t+..., we are using x values as parameters to see 
%approximation for y-value
lineapprox = polyval(cvalue,X); 

residuals = Y - lineapprox; %Note to self:calling it residual because stats 
SE = sum(residuals.^2);
RMSE =  sqrt ( SE / length(X) );
POLY =  poly2sym(cvalue);
end
