##Dany jest dyskretny sygnał 𝑥∈𝐶38, którego próbki zostały probrane z ciągłego sygnału o ograniczonym paśmie, 
##z szybkością 𝑓𝑝=456 próbek na sekunde. Oblicz 38-punktową dyskretną transformację Fouriera 
##tego sygnału oraz znajdź wartości dyskretnego widma Fouriera tego sygnału dla następujących częstotliwość 𝑓=[−144,216,−24,−204,72,12]
##Jako rozwiązanie podaj sumę faz tych składowych częstotliwościowych.

function rozwiazanie(;

    #wynik 0.7091783015312922, 45pkt DFT
    #fp::Int = 1710,
    #x::Vector{ComplexF64} = ComplexF64[0.33 - 0.2im, 0.56 - 0.44im, -0.6 - 0.05im, 0.85 - 0.59im, 0.79 + 0.05im, -0.2 + 0.1im, 0.14 - 0.82im, -0.64 + 1.38im, -0.53 + 0.11im, -1.32 + 0.05im, -0.39 + 0.31im, 0.64 + 0.77im, 0.45 + 1.01im, -0.71 - 0.63im, -0.43 + 0.17im, 2.07 + 1.01im, -1.08 - 0.56im, -0.41 - 0.91im, -1.19 + 0.82im, -1.19 + 0.36im, 0.48 + 0.37im, 0.72 - 0.02im, -0.29 - 0.58im, -0.82 + 0.81im, 0.26 - 0.3im, 0.71 + 0.58im, 0.21 - 0.68im, -0.43 - 0.09im, 0.56 + 0.15im, 0.34 - 0.04im, -0.84 + 0.54im, -0.15 + 0.08im, -0.35 - 1.05im, -0.03 - 1.08im, 0.72 - 0.26im, -1.48 - 0.59im, 0.23 + 0.05im, 0.26 - 0.39im, 0.81 + 0.27im, -0.74 + 1.58im, 0.38 + 0.45im, -0.08 - 0.71im, 0.55 + 2.7im, 0.86 - 0.78im, -0.75 + 0.9im],
    #f::Vector{Int} = [-608, -304, -380, -456, -380],


    #wynik 0.800497080210365, 42pkt DFT
    #fp::Int = 462,
    #x::Vector{ComplexF64} = ComplexF64[1.41 - 0.26im, -0.2 - 1.67im, -0.59 - 0.24im, 0.05 - 0.87im, 1.7 - 0.48im, 0.63 - 0.87im, -0.03 + 0.28im, 0.27 + 0.96im, -0.5 - 0.36im, 0.4 + 0.75im, -1.07 + 1.63im, -0.08 - 1.0im, 0.35 - 0.1im, 0.07 - 0.45im, -0.31 + 0.47im, 0.85 + 0.1im, -0.98 - 1.81im, 0.46 - 1.26im, 0.41 - 0.36im, 1.19 + 0.62im, 1.5 - 0.14im, 1.19 + 0.34im, -0.09 + 0.45im, 1.45 - 1.82im, 0.24 + 0.66im, -0.64 - 0.68im, 0.39 + 0.52im, -0.94 - 0.44im, -1.21 - 0.64im, -0.24 - 0.78im, 1.09 + 1.17im, -0.27 - 0.55im, -0.46 + 0.41im, -0.78 - 0.17im, 0.06 + 0.76im, -0.51 + 0.54im, 0.38 + 0.6im, 0.63 + 0.59im, 0.17 - 0.72im, -0.17 + 0.39im, -1.24 + 0.05im, 0.76 + 0.53im],
    #f::Vector{Int} = [165, -99, 0, 66, -11, 11],

    ##wynik: 4.8109857476335245
    fp::Int = 456,
    x::Vector{ComplexF64} = ComplexF64[-0.35 + 0.23im, 0.68 - 0.3im, -0.42 + 0.68im, 0.12 + 0.14im, 0.32 - 2.04im, -0.7 + 0.01im, 0.4 + 0.05im, -0.23 - 0.14im, -0.59 + 0.09im, -0.44 - 0.56im, 0.84 + 1.06im, -1.28 - 0.15im, 1.18 + 0.16im, -0.53 - 0.49im, 1.78 - 0.35im, -0.17 - 0.64im, 0.54 - 0.02im, 0.73 - 0.64im, 0.83 + 1.05im, -0.0 + 0.79im, 0.11 + 0.54im, -0.08 + 0.03im, -0.65 + 0.35im, -0.95 - 0.04im, 0.29 + 0.25im, -0.54 + 0.05im, 1.05 - 0.84im, -0.27 + 0.99im, 0.44 + 0.17im, -0.37 - 0.73im, -0.76 - 1.53im, -0.16 + 0.21im, 0.56 + 1.72im, -1.62 - 0.39im, -0.9 - 0.05im, -0.5 - 0.48im, 0.08 - 0.56im, 0.75 - 0.3im],
    f::Vector{Int} = [-144, 216, -24, -204, 72, 12],
)
    delta = 1/fp
end