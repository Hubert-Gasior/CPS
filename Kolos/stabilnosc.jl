##Dany jest dyskretny system liniowy niezmienny w czasie, który jest opisany Z-transmitacją 𝐻(𝑧). 
##Transmitancja 𝐻(𝑧)H(z) jest zdefiniowana poprzez 𝑧=[𝑧1,𝑧2,…,𝑧𝑀]∈𝐶𝑀, 𝑝=[𝑝0,𝑝1,…,𝑝𝑁]∈𝐶𝑁p=[p0,p1,…,pN]∈CN wzmocnienica systemu. 
##Zbadaj czy system jest stabilny i jako odpowiedź podaj 1.0 jeżeli system jest stabilny, 0.0jeżeli 
##system jest na granicy stabilności, −1.0 jeżeli system jest niestabilny.

using LinearAlgebra

function stability(;
    #wynik -1.0 git -1.0
    #b::Vector{Float64} = [0.07013408776655358, -0.2526004886224546, 0.49307246380180875, -0.6045273768777002, 0.49307246380180875, -0.2526004886224546, 0.07013408776655358],
    #a::Vector{Float64} = [1.0, 0.09257819083956809, 2.5789019935137842, 1.1788131062875247, 1.8892987714719334, 0.8119042955898839, 0.42504918558586713],

    ##poprawny wynik: 1.0 git 1.0.
    #z::Vector{ComplexF64} = ComplexF64[1.0 + 0.0im, 1.0 + 0.0im, 1.0 + 0.0im, 1.0 + 0.0im, 1.0 + 0.0im, 1.0 + 0.0im],
    #p::Vector{ComplexF64} = ComplexF64[0.6404855033133797 - 0.545423471093966im, 0.6404855033133797 + 0.545423471093966im, 0.511107806149499 - 0.31862383206623646im, 0.511107806149499 + 0.31862383206623646im, 0.4577258015009146 - 0.1044437279304051im, 0.4577258015009146 + 0.1044437279304051im],
    #k::Float64 = 0.23787967525154624,
)
    #dla a i b
    N = length(a) - 2
    H = Matrix(I, N, N)
    Z = zeros(N)
    H = vcat(Z', H)
    H = hcat(H, -1 * reverse(a[2:end]))
    roots = eigvals(H)
    pkt = abs.(roots)  #dla a b
    #pkt = abs.(p)     #dla z p k
    if all(pkt .< 1)
        return 1.0
    elseif all(pkt .<= 1) && any(pkt .== 1)
        return 0.0
    else
        return -1.0
    end 
end
