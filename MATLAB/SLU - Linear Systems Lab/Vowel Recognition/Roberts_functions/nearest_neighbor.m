%-------------------------------------------------- 
% Eric Adamany & Robert Campbell & Christian Litalien 11/7/2019
% Group : 2
% 
% Purpose: Using an input vector m that is an (x,y) coordinate and
%            decV, which is a matrix of two rows of (x,y) pairs, determine
%            which point in the matrix the input m is closest to.
%
%
% Outputs: indx - The row index (1 or 2) of the matrix that corresponds to 
%               the point that m is closest to.
%           dmin - Smallest distance between m and the two matrix points,
%                 which is the distance between the input m and the point
%                 in the matrix at row indx
% 
%-------------------------------------------------- 
function[indx,dmin] = nearest_neighbor(m,decV)
indx = [];
dmin = [];
d = [];



if length(m) ~= 2
    disp('ERROR: Invalid length for m')
    return;
end

if ~isequal(size(decV), size(zeros(2,2)))
    disp('ERROR: Invalid size for decV')
    return;
end

dmin = sqrt(((m(1) - decV(1,1))^2)+((m(2) - decV(1,2))^2));
indx = 1;
d = sqrt(((m(1) - decV(2,1))^2)+ ((m(2) - decV(2,2))^2));

if dmin > d
    dmin = d;
    indx = 2;
    
end


   