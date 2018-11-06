// erro minimo vetorial
function eminimov()
    clf();clc
    p=[7;9]
    [p,g] = gradiente(p)
    disp(p, 'ponto')
    disp(f(p(1),p(2)), 'valor minimo')
    disp(g(1),g(2), 'gradiente')
endfunction

function z = f(x, y)
    z = x.^2 + y.^2 + sin(x).*(x+y) + 10
endfunction

function dp = dz(p)
    d=0.0000001
    dp = [ f(p(1)+d,p(2))-f(p(1),p(2));...
           f(p(1),p(2)+d)-f(p(1),p(2))]/d
endfunction




function [p,dp] = gradiente(p)
    p0=p
    pxh=p(1); pyh=p(2);
    for al=0.1:0.05:0.5
        p=p0
        cont=0;dp=[1;1]
        while norm(dp)> 1e-9&&cont<100
            cont=cont+1
            dp = dz(p)
            p = p - al*dp
            pxh=[pxh,p(1)]
            pyh=[pyh,p(2)]
        end
        disp(al, 'alpha')
        disp(cont,'cont')
        param3d(pxh,pyh,f(pxh,pyh))
        grafico
    end
endfunction

function grafico
    x=-10:10
    y=-10:10
    z=x'.^2*ones(y)+ones(x')*y.^2 //
    z = z + sin(x').*x'*ones(y); //disp(size(z1), 'z1')
    z = z + sin(x')*y; //disp(size(z2), 'z2')
    z = z + 10*ones(x')*ones(y)
    plot3d(x,y,z)    
endfunction
eminimov
