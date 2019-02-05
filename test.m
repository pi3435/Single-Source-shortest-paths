graph = [0 3 5 0 0;
    0 0 2 6 0;
    0 1 0 4 6;
    0 0 0 0 2;
    0 0 0 7 0];

[pathtree1,isloop1] = BellmanFord(graph);
[pathtree2] = Dijkstra(graph);