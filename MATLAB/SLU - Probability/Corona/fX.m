function [x,fx] = fX(flg)
persistent day;

if isempty(day)
    day = 1;
else
    day = day + 1;
end

if ~flg
    day = 1;
end

x = 1:1:100;


if day >= 10
    fx = (1.35786).*normpdf(x, 3, sqrt(10));
else
    fx = normpdf(x, 25, sqrt(60));
end
%    fx = normpdf(x, 25, sqrt(60));
fx = fx/sum(fx);
end

