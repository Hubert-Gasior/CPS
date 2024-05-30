##Oblicz energię dyskretnego sygnału 𝑥∈𝑅130. Dyskretny sygnał 𝑥 powstał w wyniki
##pobrania 𝑁=130 próbek z ciągłego sygnału 𝑦(𝑡)=3.4⋅𝑔(0.8⋅𝑡−3.1) z szybkością 𝑓𝑝=338.65 próbke na sekundę. 
##Pierwsza próbka 𝑥1=𝑦(𝑡1) została pobrana w chwili 𝑡1=−0.76. Funkcja 𝑔(𝑡) zwraca wartości sygnału fali piłokształtnej o opadającym zboczu
##i następujących parametrach: amplituda 1, okres 1 sekunda, składowa stała 0, 𝑔(0)=0, oraz 𝑑𝑔𝑑𝑡∣𝑡=0=−1.

function rozwiazanie(;
    ##wynik: 1513.3034400673212 !!!!!!!!!𝑑𝑔𝑑𝑡∣𝑡=0=4!!!!!!!
    ##fp::Float64 = 321.77,
    ##t1::Float64 = 4.1,
    ##N::Int = 847,

    ##wynik: 1046.577596197517
    fp::Float64 = 338.65,
    t1::Float64 = -0.76,
    N::Int = 130,
)
    g = t -> -2 * rem(t, 1, RoundNearest)
    t = range(; start=t1, step=(1 / fp), length=N)
    y = 3.4 * g.(0.8 .* t .- 3.1)
    energy = sum(abs2, y)
    return energy
end

println(rozwiazanie())