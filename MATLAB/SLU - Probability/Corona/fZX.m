function [z, fzx] = fZX(x,Pt)
    z = 0:1:x;
    fzx = binopdf(z,x,Pt);
    fzx = fzx/sum(fzx);
    
end

