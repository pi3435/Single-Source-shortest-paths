function [pathtree,isloop] = BellmanFord(graph)
%input: graph: matrix of graph
%output: path tree:tree to represent shortest path

[row,col] = size(graph);
%find all the edges
edges = zeros(1,3);
V = 0;
for m = 1:row
    for n = 1:col
        if graph(m,n) ~= 0
            V = V+1;
            edges = [edges; m n graph(m,n)];
        end
    end
end
edges = edges(2:end,:)';


%Initialse the path tree
if row == col
    pathtree = zeros(3,row);
    
    %first row represent the vertices
    for i = 1:row
        pathtree(1,i) = i;
        pathtree(2,i) = 100000;
        pathtree(3,i) = -1;
    end
    
    pathtree(2,1) = 0;
    pathtree(3,1) = 1;
    
end

for t = 1:(V-1)
    for r = 1:V
        [pathtree(2,edges(2,r)),pathtree(3,edges(2,r))] = relaxation(edges(1,r),edges(2,r),edges(3,r),pathtree(2,edges(2,r)),pathtree(3,edges(2,r)),pathtree(2,edges(1,r)));
    end
end

for r = 1:V
    if pathtree(2,edges(2,r)) > pathtree(2,edges(1,r))+edges(3,r)
        isloop = 0;
    else
        isloop = 1;
    end
end


end


