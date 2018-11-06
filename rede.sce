function analise()
    x1 = 0.3
    x2 = 0.5
    y = 1
    w1 = 1
    w2 = 2
    z = w1 * x1 + w2 * x2
    a = sigmoid(z)
    erro = a - y
    c = 1/2 * exp((a - y), 2)
    gc = erro * sigmoid(z) *
    gb = erro * sigmoid(c)
    w = w - 0.1 * gc
    b = b - 0.1 * gb
endfunction

function y = f(x1, x2)
    y = 0
    if x1+x2>1 then
        y = 1
    end
endfunction

function s = sigmoid(z)
    s = 1./(1 + exp(-z))
endfunction

function dy = dsigmoid(x)
    d = 0.0000001
    dy = (sigmoid(x+d) - sigmoid(x))/d
endfunction
