##Dany jest dyskretny sygnał 𝑥∈𝐶38, którego próbki zostały probrane z ciągłego sygnału o ograniczonym paśmie, 
##z szybkością 𝑓𝑝=456 próbek na sekunde. Oblicz 38-punktową dyskretną transformację Fouriera 
##tego sygnału oraz znajdź wartości dyskretnego widma Fouriera tego sygnału dla następujących częstotliwość 𝑓=[−144,216,−24,−204,72,12]
##Jako rozwiązanie podaj sumę faz tych składowych częstotliwościowych.

function DFT(;
    #fp::Int = 1710,
    #x::Vector{ComplexF64} = ComplexF64[0.33 - 0.2im, 0.56 - 0.44im, -0.6 - 0.05im, 0.85 - 0.59im, 0.79 + 0.05im, -0.2 + 0.1im, 0.14 - 0.82im, -0.64 + 1.38im, -0.53 + 0.11im, -1.32 + 0.05im, -0.39 + 0.31im, 0.64 + 0.77im, 0.45 + 1.01im, -0.71 - 0.63im, -0.43 + 0.17im, 2.07 + 1.01im, -1.08 - 0.56im, -0.41 - 0.91im, -1.19 + 0.82im, -1.19 + 0.36im, 0.48 + 0.37im, 0.72 - 0.02im, -0.29 - 0.58im, -0.82 + 0.81im, 0.26 - 0.3im, 0.71 + 0.58im, 0.21 - 0.68im, -0.43 - 0.09im, 0.56 + 0.15im, 0.34 - 0.04im, -0.84 + 0.54im, -0.15 + 0.08im, -0.35 - 1.05im, -0.03 - 1.08im, 0.72 - 0.26im, -1.48 - 0.59im, 0.23 + 0.05im, 0.26 - 0.39im, 0.81 + 0.27im, -0.74 + 1.58im, 0.38 + 0.45im, -0.08 - 0.71im, 0.55 + 2.7im, 0.86 - 0.78im, -0.75 + 0.9im],
    #f::Vector{Int} = [-608, -304, -380, -456, -380],
)
    N = length(x)
    
    F=[(k < N/2 ? k*(fp/N) : (k-N)*(fp/N)) for k in 0:(N-1)]

    xdft = zeros(ComplexF64, N)
    for k in 0:N-1
        for n in 0:N-1
            xdft[k+1] += x[n+1] *(1/N)* exp(-im * 2 * pi / N)^(k * n)
        end 
    end

    result = 0.0
    
    for i in 1:length(f)
        for j in 1:N
            if  f[i] == F[j]
                result += abs(xdft[j])
                result +=angle(xdft[j])
                println(F[j])
            end
        end
    end

    return result
end
