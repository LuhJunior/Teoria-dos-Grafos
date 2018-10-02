function graph()
    a = [ 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0
          0 0 0 1 1 0 0 0 0 0 0 0 0 0 0
          0 0 0 0 0 1 1 0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 1 1 0 0 0 0 0 0
          0 0 0 0 0 0 0 0 0 1 1 0 0 0 0
          0 0 0 0 0 0 0 0 0 0 0 1 1 0 0
          0 0 0 0 0 0 0 0 0 0 0 0 0 1 1
          0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
        ] 
    global('valores')
    valores = [0, 0, 0, 0, 0, 0, 0, 7, 4, 5, 3, 2, 8, 9, 7]
    disp(a, 'a')
    //a = a + a'
    //disp(a, 'a')
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
            if a(i, j) <> 0
                k = k+1
                b(k, 1) = i
                b(k, 2) = j
            end
        end
    end
    m = k
    ///*
    for k = 1: m
        plot2d([x(b(k, 1)), x(b(k, 2))], [y(b(k, 1)), y(b(k, 2))], 1)
    end
    //*/
    estado = %T
    altura = 2
    i = 1
    while i<=n
        while i <= altura-1 && i <= n
            if(estado && valores(i) == 0)
                valores(i) = -%inf
            else 
                if valores(i) == 0
                    valores(i) = %inf
                end
            end   
            i = i+1 
        end
        altura = altura * 2
        estado = ~estado
    end
    disp(valores, 'valores')
    mini_max(1, %T)
    disp(valores, 'valores')
endfunction

function mini_max(v, estado)
    global('valores')
    for i=1:n
        if (a(v, i) == 1)
            mini_max(i, ~estado)
            if estado
                valores(v) = max(valores(v), valores(i))
            else
                valores(v) = min(valores(v), valores(i))
            end
        end                            
    end
endfunction
