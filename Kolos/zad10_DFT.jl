##Dany jest dyskretny sygnał 𝑥∈𝐶38, którego próbki zostały probrane z ciągłego sygnału o ograniczonym paśmie, 
##z szybkością 𝑓𝑝=456 próbek na sekunde. Oblicz 38-punktową dyskretną transformację Fouriera 
##tego sygnału oraz znajdź wartości dyskretnego widma Fouriera tego sygnału dla następujących częstotliwość 𝑓=[−144,216,−24,−204,72,12]
##Jako rozwiązanie podaj sumę faz tych składowych częstotliwościowych.

function rozwiazanie(;
    ##wynik: 4.8109857476335245
    fp::Int = 456,
    x::Vector{ComplexF64} = ComplexF64[-0.35 + 0.23im, 0.68 - 0.3im, -0.42 + 0.68im, 0.12 + 0.14im, 0.32 - 2.04im, -0.7 + 0.01im, 0.4 + 0.05im, -0.23 - 0.14im, -0.59 + 0.09im, -0.44 - 0.56im, 0.84 + 1.06im, -1.28 - 0.15im, 1.18 + 0.16im, -0.53 - 0.49im, 1.78 - 0.35im, -0.17 - 0.64im, 0.54 - 0.02im, 0.73 - 0.64im, 0.83 + 1.05im, -0.0 + 0.79im, 0.11 + 0.54im, -0.08 + 0.03im, -0.65 + 0.35im, -0.95 - 0.04im, 0.29 + 0.25im, -0.54 + 0.05im, 1.05 - 0.84im, -0.27 + 0.99im, 0.44 + 0.17im, -0.37 - 0.73im, -0.76 - 1.53im, -0.16 + 0.21im, 0.56 + 1.72im, -1.62 - 0.39im, -0.9 - 0.05im, -0.5 - 0.48im, 0.08 - 0.56im, 0.75 - 0.3im],
    f::Vector{Int} = [-144, 216, -24, -204, 72, 12],
)
    delta = 1/fp
end