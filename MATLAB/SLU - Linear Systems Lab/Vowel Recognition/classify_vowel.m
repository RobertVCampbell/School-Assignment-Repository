%-------------------------------------------------- 
% Eric Adamany & Robert Campbell & Christian Litalien 11/7/2019
% Group : 2
% 
% Purpose: Given an audio sample of a long vowel sound (t,x), identify
%           the vowel and return it as a char.
%
%
% Outputs: Vchar - A lower case char of the vowel that was provided
%                    a,e,i,o,u
% 
%-------------------------------------------------- 

function [Vchar] = classify_vowel(t,x)

%Input checking
if length(t) ~= length(x)   %Error checking for same length.
    disp('Error Invalid Length t ~= x')
    return
end
if length(t) < 2 %Error checking for valid vector length
    disp('Error: Invalid length, vector less than 2')
end

load fbnd

%hard coded decision vectors
dec1 = [0.0829 0.0806; 0.1048 0.0241];
dec2 = [0.0555 0.2618; 0.0396 0.2209];
dec3 = [0.0031 0.0004; 0.0031 0.0012];
dec4 = [-0.0001 0.0027; -0.0000 0.0061];



E = spectral_band_energy(t,x,fbnd);



%Decision 1 test - AIO if indx = 1
[indx,~] = Nearest_neighbor([E(7), E(9)], dec1);
if(indx == 1)
    %decision point 2 - I if index =1, AO if not
    [indx,~] = Nearest_neighbor([E(3), E(10)], dec2);
    if(indx == 1)
        Vchar = "i";
    else
        %decision point 4 (1-13, O if indx = 1, A if not
        [indx,~] = Nearest_neighbor([E(1), E(13)], dec4);
        if(indx == 1)
            Vchar = "o";
        else
            Vchar = "a";
        end
    end
    
else
    %decision point 3 (4-12, E if index == 1, U if not
    [indx,~] = Nearest_neighbor([E(4), E(12)], dec);
    if(indx == 1)
        Vchar = "e";
    else
        Vchar = "u";
    end
end
    

% Decision vector template dec = [ , ; , ];
%Nearest Neighbor call template
%[indx,~] = Nearest_neighbor([E(), E()], dec);
    
    
