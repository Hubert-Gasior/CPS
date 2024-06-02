##Dyskretny sygnał 𝑥∈𝑅59 został przetworzony przez dyskretny nierekursywny układ liniowy o odpowiedź impulsowej ℎ∈𝑅25. 
##Znajdź dyskretny sygnał 𝑦[𝑛] będący sygnałem wyjściowym z tego układu. Jako rozwiązanie podaj moc otrzymanego sygnału.

function rozwiazanie(;

    #wynik 31.223802625357347, podac RMS git 31.223802625357347
    x::Vector{Float64} = [2.76, 4.33, -3.46, -2.01, 2.54, 0.77, 3.35, -3.15, -2.41, 4.78, -3.7, -0.68, 4.27, -3.72, 3.94, -4.42, -0.91, -4.65, -3.52, 1.24, 1.57, -2.0, -3.69, -1.74, 3.89, 1.41, -3.01, 2.53, -4.64, -0.87, -3.27, -3.2, 2.25, 4.03, -2.43, 4.21, 4.93, 0.41, 1.11, 2.33, 3.59, -0.59, 4.35, -4.94, 1.4, -4.18, -1.05, -0.57, -3.52, -3.89, -4.13, -4.91, 0.91, -2.92, -2.0, -3.85, 1.05, 1.52, -0.48, 0.56],
    h::Vector{Float64} = [-3.31, -0.6, 1.08, 2.13, 4.66, 3.04, -0.43, -4.2, -4.52, -0.96, 0.67, -4.02, -1.64, -2.89, -4.04, 3.77, 1.34, -1.25],

    #wynik -0.4386698630136988 podac srednia sygnału git -0.4386698630136988
    #x::Vector{Float64} = [-1.66, 3.66, 3.65, -4.66, -2.66, 1.57, 4.53, -4.16, -4.09, 4.4, -0.66, -1.51, -1.34, -3.62, 2.61, 4.83, 0.99, -0.14, 3.92, 2.65, 1.76, -2.84, 2.5, -2.36, 4.58, 3.56, -0.63, -2.24, -0.15, -0.2, 4.89, 3.94, -3.05, -0.06, -2.93, -1.07, -4.93, -0.96, -2.34, -0.4, 3.58, -3.91, -4.9, 0.58, 2.64, 4.75, 1.11, 1.42, 2.71, 0.16, 0.76, -0.05, 1.98, 1.5, -1.0, -2.99, 1.68, 2.13, -4.25, -3.55, -0.29, -4.29, 2.72, 1.1],
    #h::Vector{Float64} = [-3.43, -0.15, 2.77, -1.96, -0.37, -1.82, -0.4, -1.88, 0.05, 3.62],

    #wynik  657.4420628462497, podac moc, dluosc y = 80, git 657.4420628462498
    #x::Vector{Float64} = [-1.98, 1.12, 1.16, 1.04, -4.73, 2.83, 0.36, -4.02, 4.47, 1.3, -0.32, 2.02, 3.25, 3.3, 4.22, 2.31, -1.3, 4.32, 4.1, 0.68, 0.72, 1.01, 3.06, 4.97, -1.11, -0.34, -2.61, 1.36, -3.29, -1.66, 2.7, 4.43, -3.55, -1.78, -0.86, 2.92, 0.29, -4.19, -1.41, -1.79, -1.8, -2.35, 4.61, -3.31, 0.13, -0.21, -2.67, 1.8, 3.81, 3.69, -1.35, 0.65, -3.21, 0.21, 1.99, 2.49, -3.06, -0.42, 1.84, 4.08, -3.34, 1.0, 2.87, -2.95, -2.85, -0.92, -2.82, 2.55, 3.32],
    #h::Vector{Float64} = [3.47, -0.14, -1.79, -0.24, 1.21, 3.9, -3.88, -4.72, -3.96, -0.04, 4.26, -2.11],

    ## wynik: 1185.2445440109639 git 1185.244544010964
    #x::Vector{Float64} = [-4.52, 4.21, 2.53, -3.28, -3.65, -1.69, -1.46, 3.63, 1.19, -0.61, 1.4, -4.83, -4.68, 4.4, -3.26, 1.32, 2.19, 2.14, 3.51, -3.65, -3.78, -0.8, -2.68, 0.01, -1.14, -3.71, -4.58, 3.82, 3.77, 4.29, 3.88, 2.3, 1.29, 3.05, 2.17, 0.85, -0.59, 1.84, 2.6, -3.48, 1.05, 2.38, 2.82, 2.73, -1.88, 2.32, 1.22, -3.37, 0.94, 4.22, 3.31, 4.84, -3.09, -4.79, 2.7, 2.98, -0.57, -1.73, 0.45],
    #h::Vector{Float64} = [1.41, 2.17, 2.36, 0.15, -1.63, 0.58, -0.65, -4.13, 4.24, 3.74, -4.34, 3.01, 1.21, 4.99, 0.46, 2.96, 2.04, -4.91, 4.01, 3.0, -1.07, -4.8, -0.94, 0.02, -3.55],
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

println(rozwiazanie())