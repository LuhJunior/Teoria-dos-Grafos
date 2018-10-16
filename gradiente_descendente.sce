function trap_des(a, b)
    g = gradiente_descendente(a, b)
    disp(g, 'gradiente descendente')
endfunction

function z = f1(x, y)
    z = x^2 + y^2
endfunction

function dp = df1(p)
    dt = 0.00000000001
    dp = [(f1(p(1) + dt, p(2)) - f1(p(1), p(2)))/dt , (f1(p(1), p(2) + dt) - f1(p(1), p(2)))/dt]
endfunction

function g = gradiente_descendente(a, b)
    p = [a, b]
    graficx = p(1)
    graficy = p(2)
    graficz = f1(p(1), p(2))
    while p(1) > 10^(-9) && p(2) > 10^(-9)
        dp = df1(p)
        p = p - 0.1 * dp
        graficx($+1) = p(1)
        graficy($+1) = p(2)
        graficz($+1) = f1(p(1), p(2))
    end
    param3d(graficx, graficy, graficz)
    g = p
endfunction
