function [pathtree] = Dijkstra(graph)

[row,col] = size(graph);

%Initialse the path tree
if row == col
    pathtree = zeros(2,row);
    S = 0;
    Q = zeros(1,col);
    dis = zeros(1,col);
    
    %first row represent the vertices
    for i = 1:row
        pathtree(1,i) = i;
        Q(i) = i;
        dis(i) = 10000;
    end
    
    dis(1) = 0;
end

while max(Q) ~= 0
    %extract_min
    dis_check = dis;
    for m = 1:col
        if Q(m) == 0 
            dis_check(m) = 10000; 
        end
    end
    [m,I] = min(dis_check);
    
    %push I to S
    S = [S I];
    %pull out I from Q
    Q(I) = 0;
    %set the pathtree
    pathtree(2,I) = m;
    
    %find all out path for I
    dis_row = graph(I,:);
    
    for t = 1:col
        if dis_row(t) > 0
            %relaxation
            if dis(t) > dis(I) + dis_row(t)
                dis(t) = dis(I) + dis_row(t);
            end
        end
    end
    
end

end

