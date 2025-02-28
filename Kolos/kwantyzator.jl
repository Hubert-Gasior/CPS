## Dany jest idealny równomierny 3-bitowy kwantyzator 𝑞(𝑥), którego najmniejszy poziom kwantyzacji ma wartość 𝑎=−0.011, 
## natomist największy poziom kwantyzacji ma wartość 𝑏=0.99. Oblicz sygnał błędu kwantyzacji tego przetwornika dla dyskretnego sygnału 𝑥∈𝑅92. 
## Jako rozwiązanie podaj moc sygnału błędu kwantyzacji.

function quantization(;
    a::Float64 = 0.011,
    b::Float64 = 0.99,
    x::Vector{Float64} = [0.90798, 0.56913, 0.44667, 0.03897, 0.92721, 0.52887, 0.49187, 0.08137, 0.6328, 0.31377, 0.57614, 0.78384, 0.58475, 0.5626, 0.03781, 0.52073, 0.41188, 0.16673, 0.60371, 0.37653, 0.16885, 0.02363, 0.18805, 0.11251, 0.63835, 0.82362, 0.71251, 0.09439, 0.80113, 0.34575, 0.19211, 0.19708, 0.79358, 0.68517, 0.48758, 0.33059, 0.64093, 0.07079, 0.08695, 0.62442, 0.79468, 0.48913, 0.06455, 0.31842, 0.28905, 0.39223, 0.61332, 0.0703, 0.17544, 0.1989, 0.91248, 0.92223, 0.32868, 0.0384, 0.95976, 0.39816, 0.55051, 0.61491, 0.43551, 0.1003, 0.34273, 0.54258, 0.54092, 0.92302, 0.34515, 0.17436, 0.50054, 0.23767, 0.27606, 0.58653, 0.39819, 0.79276, 0.3136, 0.39789, 0.21132, 0.77697, 0.35035, 0.49717, 0.26729, 0.76688, 0.50657, 0.15117, 0.60267, 0.25257, 0.01077, 0.43203, 0.10098, 0.34206, 0.21874, 0.98701, 0.94863, 0.98381],
    )
    
    L = range(; start=a, stop=b, length=2^3)
    quantize(L::AbstractVector)::Function = x -> L[argmin(abs.(-L .+ x))]
    q = quantize(L)
    x_quantized = q.(x)
    quantization_error = x .- x_quantized
    
    #energy = sum(abs2, quantization_error)
    power = sum(abs2, quantization_error)/length(quantization_error)

    return energy
end
