##Dany jest dyskretny system liniowy niezmienny w czasie, który jest opisany Z-transmitacją 𝐻(𝑧). 
##Transmitancja 𝐻(𝑧) jest zdefiniowana poprzez dwa wektory 𝑏=[𝑏0,𝑏1,…,𝑏𝑀]∈𝑅𝑀+1 oraz 𝑎=[𝑎0,𝑎1,…,𝑎𝑁]∈𝑅𝑁+,
## które są odpowiednio współczynnikami wielomianu w liczniku i mianowniku funkcji wymiernej 𝐻(𝑧)
##Oblicz przesunięcie fazowe 𝜑(𝑓) tego systemu dla częstotliwości 𝑓∈𝑅
##znormalizowanej względem częstotliwości próbkowania. 
##Jako odpowiedź podaj średnie przesunięcie fazowe dla następujących częstotliwości 𝐹=[0.18,0.19,0.28,0.36, to znaczy,1/4∑𝑖=14𝜑(𝐹𝑖).

function rozwiazanie(;
    ##wynik: 0.6884247989546458 !!!! Oblicz wzmocnienie 𝐴(𝑓) tego systemu dla częstotliwości 𝑓∈𝑅 znormalizowanej względem częstotliwości próbkowania. Jako odpowiedź podaj średnie wzmocnienie dla następujących częstotliwości 𝐹=[0.17,0.4,0.41], to znaczy, 1/33A(Fi).
    b::Vector{Float64} = [0.14057805413148808, -0.5496709567825141, 0.9813305379425469, -0.9813305379425469, 0.5496709567825141, -0.14057805413148805],
    a::Vector{Float64} = [1.0, -0.7943952595790318, 0.9758046873511725, -0.4065474189933993, 0.14744644568906448, -0.018965286100430738],
    F::Vector{Float64} = [0.17, 0.4, 0.41],

    ##wynik -1.1922183854913784
    #b::Vector{Float64} = [0.32535468302663495, -1.2048550136195828, 1.7633364025493095, -1.204855013619583, 0.32535468302663495],
    #a::Vector{Float64} = [1.0, -1.8859712694029567, 1.9319729717227352, -0.9336160382636693, 0.3211884722852104],
    #F::Vector{Float64} = [0.18, 0.19, 0.28, 0.36],
)
    B = length(b)
    f = length(F)
    h = zeros(Complex, f)
    h1 = zeros(Complex, f)
    h2 = zeros(Complex, f)
    x = 0

    for i in 1:f
        for m in 1:B-1
            h1[i] += b[m+1]*exp(-im*2*π*F[i]*m)
            h2[i] += a[m+1]*exp(-im*2*π*F[i]*m)
        end
        h[i] = (b[1]+h1[i])/(a[1]+h2[i])
        #x += angle(h[i])
        x += abs(h[i])
    end
    
    return x/3
end

println(rozwiazanie())