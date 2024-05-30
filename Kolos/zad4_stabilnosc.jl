##Dany jest dyskretny system liniowy niezmienny w czasie, który jest opisany Z-transmitacją 𝐻(𝑧). 
##Transmitancja 𝐻(𝑧)H(z) jest zdefiniowana poprzez 𝑧=[𝑧1,𝑧2,…,𝑧𝑀]∈𝐶𝑀, 𝑝=[𝑝0,𝑝1,…,𝑝𝑁]∈𝐶𝑁p=[p0,p1,…,pN]∈CN wzmocnienica systemu. 
##Zbadaj czy system jest stabilny i jako odpowiedź podaj 1.0 jeżeli system jest stabilny, 0.0jeżeli 
##system jest na granicy stabilności, −1.0 jeżeli system jest niestabilny.

function rozwiazanie(;
    ##wynik 0.0
    #z::Vector{ComplexF64} = ComplexF64[-1.0 + 0.0im, -1.0 + 0.0im, -1.0 + 0.0im, -1.0 + 0.0im],
    #p::Vector{ComplexF64} = ComplexF64[0.9170827653693147 + 0.3986968791733522im, 0.7780522459714531 - 0.33825409659477523im, 0.6493808890370768 + 0.11693866254337679im, 0.6493808890370768 - 0.11693866254337679im],
    #k::Float64 = 0.0013974753593581637,

    ##poprawny wynik: 1.0
    z::Vector{ComplexF64} = ComplexF64[1.0 + 0.0im, 1.0 + 0.0im, 1.0 + 0.0im, 1.0 + 0.0im, 1.0 + 0.0im, 1.0 + 0.0im],
    p::Vector{ComplexF64} = ComplexF64[0.6404855033133797 - 0.545423471093966im, 0.6404855033133797 + 0.545423471093966im, 0.511107806149499 - 0.31862383206623646im, 0.511107806149499 + 0.31862383206623646im, 0.4577258015009146 - 0.1044437279304051im, 0.4577258015009146 + 0.1044437279304051im],
    k::Float64 = 0.23787967525154624,
)
    P = length(p)
    mod = zeros(P)
    x = 0

    for i in 1:P
        mod[i] = abs(p[i])
    end

    sort!(mod)

    if mod[P] < 1
        x = 1.0
    elseif mod[P] == 1.0
        x = 0.0
    else
        x = -1.0
    end
    return x
end

println(rozwiazanie())