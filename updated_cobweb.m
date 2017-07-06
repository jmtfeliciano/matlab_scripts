% Cobweb.m - Iterate a function, and draw 'cobweb' diagram
%
% Josemari Feliciano
% To visualize cobweb in numerical analysis, see GIF in this wiki page:
% en.wikipedia.org/wiki/Cobweb_plot


% cobweb(g, x0, a, b, iter) 
% Input - g is the iteration function: create an inline function
%       - x0 is the initial guess
%       - [a, b] is the interval of interest
%       - iter is the number of times to iterate
% Sample Use
%     g = inline('(1/2)*(x+1)', 'x')
%     cobweb(g, 1.3, 0, 2, 10)
%          and look for the window with the graph
%
function x=cobweb(g, x0, a, b, iter)

% Draw the curve over the interval [a, b]
% Create a 1-D array of x values
vx = a:0.01:b;

% Evaluate the function at each vx[i] & store in vy[i]
for i = 1:length(vx)   % Run through the evaluations
    vy(i) = g(vx(i));
end

% Now draw the cobweb
ax(1) = x0      % Start off the cobweb at the initial point (x, 0)
ay(1) = 0;
x = x0;
for i = 1:iter  % Run through the evaluations
    ax(2*i) = x;
    ay(2*i) = g(x);     % Point (x, g(x)) on the curve
    x = g(x);           % Iteration
    ax(2*i + 1) = x;    % Point (x, x) on the diagonal y = x
    ay(2*i + 1) = x;
end

% Draw three curves: y = x, y = g(x), and the cobweb
h = plot(vx, vx,   vx, vy,   ax, ay);    
set(h,'LineWidth', 5)

return;
