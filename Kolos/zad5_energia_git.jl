##Oblicz energię dyskretnego sygnału 𝑥∈𝑅130. Dyskretny sygnał 𝑥 powstał w wyniki
##pobrania 𝑁=130 próbek z ciągłego sygnału 𝑦(𝑡)=3.4⋅𝑔(0.8⋅𝑡−3.1) z szybkością 𝑓𝑝=338.65 próbke na sekundę. 
##Pierwsza próbka 𝑥1=𝑦(𝑡1) została pobrana w chwili 𝑡1=−0.76. Funkcja 𝑔(𝑡) zwraca wartości sygnału fali piłokształtnej o opadającym zboczu
##i następujących parametrach: amplituda 1, okres 1 sekunda, składowa stała 0, 𝑔(0)=0, oraz 𝑑𝑔𝑑𝑡∣𝑡=0=−1.

function rozwiazanie(;


    ## wynik 0.011251045424347012, dg/dt = -2, pila o poadajcym zboczu y(t) = 3.6*g(2.6*t - 1.0) obliczyc srednia sygnału
    #fp::Float64 = 156.14,
    #t1::Float64 = -6.97,
    #N::Int = 860,

    #wynik 10084.199999999997 , git 10084.199999999997 g(t) c(0, 1/2), y(t) = 4.9*g(2.4*t -2.9) bipolarna fala prostokatna, obliczyc enregie
    fp::Float64 = 118.8,
    t1::Float64 = -3.76,
    N::Int = 420,

    ##wynik: 1046.577596197517 git 1046.5775961975173
    #fp::Float64 = 338.65,
    #t1::Float64 = -0.76,
    #N::Int = 130,
)
    g = t -> -2 * rem(t, 1, RoundNearest) #piła o opadjacym zboczu git
    #g = t -> ifelse(mod(t, 1) < 0.5, 1, -1) #bipolarny trojkat git
    t = range(; start=t1, step=(1 / fp), length=N)
    #y = 3.4 * g.(0.8 .* t .- 3.1)
    #y = 4.9*g.(2.4 .*t .-2.9)
    y = 3.6*g.(2.6.*t .- 1.0)
    #energy = sum(abs2, y)
    mean = sum(y)/length(y)
    return mean
end

println(rozwiazanie())