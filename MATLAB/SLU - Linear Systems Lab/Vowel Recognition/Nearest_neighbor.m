%-------------------------------------------------- 
% Eric Adamany & Robert Campbell & Christian Litalien 11/7/2019
% Group : 2
% 
% Purpose: 
%
%
% Outputs:
% 
%-------------------------------------------------- 
function[indx,dmin] = Nearest_neighbor(m,decV)
indx = 0;
dmin = 0;
d = 0;



if length(m) ~= 2
    disp('ERROR: Invalid length for m')
end

if isequal(decV, zeros(2,2))
    disp('ERROR: Invalid size for decV')
end

dmin = sqrt(((m(1) - decV(1,1)^2)+((m(2) - decV(1,2))^2)));
indx = 1;
d = sqrt(((m(1) - decV(2,1))^2)+ ((m(2) - decV(2,2))^2));

if dmin > d
    dmin = d;
    indx = 2;
    
end


   