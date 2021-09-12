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

function [E] = spectral_band_energy(t,x,fbnd)
E = [];

if length(t) ~= length(x)   %Error checking for same length.
    disp('Error Invalid Length t ~= x')
    return
end

if length (fbnd) < 2   %Error checking for length greater than 1.
    disp('Error Invalid Length fbnd')
    return
end

%Fourier Transform 
[f,Xf] = myFT(t,x);
Xmag = abs(Xf);

%spectral energy calculation 
for i = 1:(length(fbnd) - 1)
    E = [E (intdef(f,Xmag.*Xmag,fbnd(i),fbnd(i+1)))];
end 

%Normalize E
E = E/sum(E);




