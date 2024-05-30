##Oblicz wartość skuteczną dyskretnego sygnału 𝑥∈𝑅653. 
##Dyskretny sygnał 𝑥xpowstał w wyniki pobrania 𝑁=653 próbek
##z ciągłego sygnału 𝑦(𝑡)=4.9⋅𝑔(3.0⋅𝑡−5.0) z szybkością 𝑓𝑝=332.54 próbke na sekundę. 
##Pierwsza próbka 𝑥1=𝑦(𝑡1) została pobrana w chwili 𝑡1=−7.87. 
##Funkcja 𝑔(𝑡) zwraca wartości sygnału fali trójkątnej o następujących parametrach: amplituda 1, okres 1 sekunda, 
##składowa stała 0, 𝑔(0)=0, oraz 𝑑𝑔𝑑𝑡∣𝑡=0=4
function rozwiazanie(;
    ##wynik: 2.818037144241322
    fp::Float64 = 332.54,
    t1::Float64 = -7.87,
    N::Int = 653,
)
    g(t; T = 1) = t > 0 ? (1 -((0.8*t-3.1) % T)) : (abs((0.8*t-3.1)) % T) 
    delta = 1/fp
    x = zeros(N)
    y(t) = 3.4*g(t)
    for i in 1:N
        x[i] = y(t1)
        t1 = t1 + delta
        i += 1 
    end
    energy = sum(abs2.(x))
    return energy
end

println(rozwiazanie())
