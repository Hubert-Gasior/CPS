##Dyskretny sygnał 𝑥∈𝑅59 został przetworzony przez dyskretny nierekursywny układ liniowy o odpowiedź impulsowej ℎ∈𝑅25. 
##Znajdź dyskretny sygnał 𝑦[𝑛] będący sygnałem wyjściowym z tego układu. Jako rozwiązanie podaj moc otrzymanego sygnału.

function impulse_response(;
    x::Vector{Float64} = [2.76, 4.33, -3.46, -2.01, 2.54, 0.77, 3.35, -3.15, -2.41, 4.78, -3.7, -0.68, 4.27, -3.72, 3.94, -4.42, -0.91, -4.65, -3.52, 1.24, 1.57, -2.0, -3.69, -1.74, 3.89, 1.41, -3.01, 2.53, -4.64, -0.87, -3.27, -3.2, 2.25, 4.03, -2.43, 4.21, 4.93, 0.41, 1.11, 2.33, 3.59, -0.59, 4.35, -4.94, 1.4, -4.18, -1.05, -0.57, -3.52, -3.89, -4.13, -4.91, 0.91, -2.92, -2.0, -3.85, 1.05, 1.52, -0.48, 0.56],
    h::Vector{Float64} = [-3.31, -0.6, 1.08, 2.13, 4.66, 3.04, -0.43, -4.2, -4.52, -0.96, 0.67, -4.02, -1.64, -2.89, -4.04, 3.77, 1.34, -1.25],
)
    X = length(x)
    H = length(h)
    y = zeros(X+H-1)
    for i in 1:length(y)
        for j in 1:X
            if i-j+1 > 0 && i-j+1 <= H
                y[i] += x[j]*h[i-j+1]
            end
        end
    end

    #power = 1/length(y)*sum(abs2.(y))
    #energy = sum(abs2.(y))
    #mean = sum(y)/length(y)
    RMS = sqrt(sum(abs2, y)/length(y))
    return RMS
end
