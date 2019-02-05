function [v_d,v_pi] = relaxation(u,v,w,v_d,v_pi,u_d)
%input:u:first point
%   v:second point
%   w:weight between u,v
%output:update v_d and v_pi

if u == -1
    v_d = u_d + w;
    v_pi = u;
elseif v_d > (u_d + w)
    v_d = u_d + w;
    v_pi = u; 
end

end

