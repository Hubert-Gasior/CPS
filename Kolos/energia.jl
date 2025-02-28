##Oblicz energię dyskretnego sygnału 𝑥∈𝑅130. Dyskretny sygnał 𝑥 powstał w wyniki
##pobrania 𝑁=130 próbek z ciągłego sygnału 𝑦(𝑡)=3.4⋅𝑔(0.8⋅𝑡−3.1) z szybkością 𝑓𝑝=338.65 próbke na sekundę. 
##Pierwsza próbka 𝑥1=𝑦(𝑡1) została pobrana w chwili 𝑡1=−0.76. Funkcja 𝑔(𝑡) zwraca wartości sygnału fali piłokształtnej o opadającym zboczu
##i następujących parametrach: amplituda 1, okres 1 sekunda, składowa stała 0, 𝑔(0)=0, oraz 𝑑𝑔𝑑𝑡∣𝑡=0=−1.

function energy(;
    fp::Float64 = 325.49,
    t1::Float64 = 9.7,
    N::Int = 919
)
    #g = t -> -2 * rem(t, 1, RoundNearest) #piła o opadjacym zboczu 
    #g = t -> ifelse(mod(t, 1) < 0.5, 1, -1) #bipolarny prostokat 
    g = t -> 4*abs(t-floor(t+3/4)+1/4)-1
    t = range(; start=t1, step=(1 / fp), length=N)
    y = 3.5*g.(4.7 .* t .- 4.9)
    energy = sum(abs2, y)
    mean = sum(y)/length(y)
    return mean
end
