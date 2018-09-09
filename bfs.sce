function graph()
    a = [0 1 0 0 0 0 0 0;
         0 0 1 1 0 0 0 0;
         0 0 0 0 1 0 0 0;
         0 0 0 0 0 1 0 0;
         0 0 0 0 0 0 1 0;
         0 0 0 0 0 0 1 0;
         0 0 0 0 0 0 0 1;
         0 0 0 0 0 0 0 0]
    a = a + a'
    disp(a, 'a')
    [nl, nc] = size(a)
    n = nl
    teta = [0 : 2*%pi/n :(n-1)* 2*%pi/n]
    x = cos(teta)
    y = sin(teta)
    plot2d(x, y, -9)
    plot2d(-2, -2, 0)
    plot2d(2, 2, 0)
    for i = 1 : n
        xstring(x(i), y(i), string(i))
    end

    k = 0
    for i = 1 : n
        for j = i : n
            if a(i, j) == 1
                k = k+1
                b(k, 1) = i
                b(k, 2) = j
            end
        end
    end
    m = k

    for k = 1: m
        plot2d([x(b(k, 1)), x(b(k, 2))], [y(b(k, 1)), y(b(k, 2))], 1)
    end
    bfs(6)
endfunction

function bfs(v)
    k = 2
    fila = [];
    ordem = zeros(1, n);
    fila (1) = v;
    ordem(v) = 1;
    while(fila <> [])
        ax = fila(1)
        fila(1) = []
        for i=1:n
            if a(ax, i) == 1 && ordem(i) == 0
                fila($+1) = i
                ordem(i) = k;
                k = k+1
            end
        end
    end
    disp(ordem, 'ordem')  
    ordem2 = zeros(1, n)
    for i=1:n
        for j=1:n
            if ordem(j) == i
                ordem2(i) = j
            end
        end
    end
    disp(ordem2, 'ordem')
endfunction
