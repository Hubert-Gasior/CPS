## Dany jest idealny równomierny 9-bitowy kwantyzator 𝑞(𝑥), którego najmniejszy poziom kwantyzacji ma wartość 𝑎=−0.6, 
## natomist największy poziom kwantyzacji ma wartość 𝑏=0.98. Oblicz sygnał błędu kwantyzacji tego przetwornika dla dyskretnego sygnału 𝑥∈𝑅92. 
## Jako rozwiązanie podaj moc sygnału błędu kwantyzacji.

function rozwiazanie(;

    #wynik 0.008070915416286748 , podac moc 
    #a::Float64 = -6.0,
    #b::Float64 = 4.6,
    #x::Vector{Float64} = [-4.96014, -4.04121, -3.13877, -2.24068, -1.33695, -0.41963, 0.51587, 1.47078, 2.44763, 3.50782, -5.64309, -4.60522, -3.66279, -2.74661, -1.84305, -0.94127, -0.03115, 0.8957, 1.84638, 2.83906, 4.58243, -5.24436, -4.23709, -3.28413, -2.35677, -1.44649, -0.54451, 0.35937, 1.27575, 2.21676, 3.22554, -6.01562, -4.84664, -3.86223, -2.90524, -1.96896, -1.05118, -0.1469, 0.75213, 1.65618, 2.57799, 3.57306, -5.43577, -4.44928, -3.48307, -2.52605, -1.58297, -0.65731, 0.25136, 1.14743, 2.0371, 2.91803, -5.89256, -4.98778, -4.05173, -3.1007, -2.14638, -1.19861, -0.26504, 0.65008, 1.54576, 2.41849, 3.17722, -5.40512],

    # wynik 5.318125467803138e-5 podac moc sygnału bledu
    a::Float64 = 0.21,
    b::Float64 = 0.99,
    x::Vector{Float64} = [0.976, 0.93543, 0.89486, 0.85428, 0.81371, 0.77314, 0.73257, 0.69199, 0.65142, 0.61085, 0.57028, 0.52971, 0.48913, 0.44856, 0.40799, 0.36742, 0.32685, 0.28627, 0.2457, 0.20513, 0.96456, 0.92398, 0.88341, 0.84284, 0.80227, 0.7617, 0.72112, 0.68055, 0.63998, 0.59941, 0.55883, 0.51826, 0.47769, 0.43712, 0.39655, 0.35597, 0.3154, 0.27483, 0.23426, 0.99369, 0.95311, 0.91254, 0.87197, 0.8314, 0.79082, 0.75025, 0.70968, 0.66911, 0.62854, 0.58796, 0.54739, 0.50682, 0.46625, 0.42567, 0.3851, 0.34453, 0.30396, 0.26339, 0.22281, 0.98224, 0.94167, 0.9011, 0.86053, 0.81995, 0.77938, 0.73881, 0.69824, 0.65766],
    )
    
    LSB = (b-a)/2^5
    l = length(x)

    kopia = zeros(l)
    for i in 1:l
        kopia[i] = x[i]
    end

    for i in 1:l
            kopia[i] = round(kopia[i]/LSB)*LSB
    end

    error = zeros(l)
    for i in 1:l
        error[i] = kopia[i]-x[i]
    end

    suma = (1/(l))*sum(abs2.(error))
    return suma
end

println(rozwiazanie())