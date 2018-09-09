function graph()
    a = [0 1 0 0 0 0 0 0;
         0 0 1 1 0 0 0 0;
         0 0 0 0 1 0 0 0;
         0 0 0 0 0 1 0 0;
         0 0 0 0 0 0 1 0;
         0 0 0 0 0 0 1 0;
         0 0 0 0 0 0 0 1;
         0 0 0 0 0 0 0 0]
    disp(a, 'a')
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
    global('pre', 'pos', 'npre', 'npos', 'ordemdfs', 'ordem')
    pre = zeros(1, n)
    pos = zeros(1, n)
    ordem = zeros(1, n)
    npre = 1
    npos = 1
    dfs(a, 1)
    disp(ordem, 'ordem')
endfunction

function dfs(a, v)
    global('pre', 'pos', 'npre', 'npos', 'ordem')
    pre(v) = npre;
    ordem(npre) = v
    npre = npre+1
    for i = 1: n
        if a(v, i) == 1 && pre(i) == 0
            dfs(a, i)
        end
    end
    pos(v) = npos;
    npos = npos+1
endfunction
