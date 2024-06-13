##Dany jest dyskretny system liniowy niezmienny w czasie, który jest opisany Z-transmitacją 𝐻(𝑧). 
##Transmitancja 𝐻(𝑧)H(z) jest zdefiniowana poprzez 𝑧=[𝑧1,𝑧2,…,𝑧𝑀]∈𝐶𝑀, 𝑝=[𝑝0,𝑝1,…,𝑝𝑁]∈𝐶𝑁p=[p0,p1,…,pN]∈CN wzmocnienica systemu. 
##Zbadaj czy system jest stabilny i jako odpowiedź podaj 1.0 jeżeli system jest stabilny, 0.0jeżeli 
##system jest na granicy stabilności, −1.0 jeżeli system jest niestabilny.

using LinearAlgebra

function rozwiazanie(;
    
    #wynik 0.0, b - wspolczyniki w liczniku, a - wsp w mianowniku Z-transmitancji cosik nie tak ale chyba z odp
    #b::Vector{Float64} = [0.008130951193599606, -0.0293187173813247, 0.07353151776855933, -0.13234781214088034, 0.19997948856626574, -0.2480670835208691, 0.26914460175246346, -0.24806708352086912, 0.19997948856626574, -0.13234781214088034, 0.07353151776855932, -0.029318717381324695, 0.008130951193599604],
    #a::Vector{Float64} = [1.0, -4.377399321638975, 13.475692036681378, -28.15821764012657, 47.57583515646011, -63.12799717800851, 70.24084111983471, -63.12799717800851, 47.575835156460094, -28.15821764012656, 13.475692036681373, -4.377399321638973, 0.9999999999999994],

    # wynik 1.0 git 1.0
    #b::Vector{Float64} = [0.006240276139692587, 0.03744165683815552, 0.09360414209538881, 0.12480552279385174, 0.09360414209538881, 0.03744165683815552, 0.006240276139692587],
    #a::Vector{Float64} = [1.0, -1.6636869758877553, 1.8152055796608766, -1.0996841515483184, 0.43216908953919037, -0.09379013460116321, 0.00916426577749561],

    #wynik 1.0 git 1.0
    #b::Vector{Float64} = [0.4290947336952949, -0.7955855899249531, 1.75575149587133, -1.6779641818941564, 1.75575149587133, -0.7955855899249531, 0.4290947336952949],
    #a::Vector{Float64} = [1.0, -1.3592216266820067, 1.9931209982543243, -1.4754147637509323, 1.1939197155736094, -0.4344989713111237, 0.18265174530531664],

    #wynik -1.0 git -1.0
    #b::Vector{Float64} = [0.07013408776655358, -0.2526004886224546, 0.49307246380180875, -0.6045273768777002, 0.49307246380180875, -0.2526004886224546, 0.07013408776655358],
    #a::Vector{Float64} = [1.0, 0.09257819083956809, 2.5789019935137842, 1.1788131062875247, 1.8892987714719334, 0.8119042955898839, 0.42504918558586713],
 
    #wynik -1.0 git -1.0
    #b::Vector{Float64} = [0.5713843056656429, -3.854722519438663, 14.250190384473747, -35.45682507642953, 65.45396352086603, -93.18079672571781, 104.683254492192, -93.18079672571781, 65.45396352086603, -35.45682507642952, 14.250190384473742, -3.854722519438662, 0.5713843056656427],
    #a::Vector{Float64} = [1.0, -6.970271060349132, 26.740806136142087, -68.93144765333517, 131.55862909500976, -193.1479655959191, 223.25848747831645, -204.03527637948227, 146.87554266901725, -81.40930391354674, 33.42473981602365, -9.224554351075557, 1.3896239578862777],
    
    ##wynik 0.0 git 0.0
    #z::Vector{ComplexF64} = ComplexF64[-1.0 + 0.0im, -1.0 + 0.0im, -1.0 + 0.0im, -1.0 + 0.0im],
    #p::Vector{ComplexF64} = ComplexF64[0.9170827653693147 + 0.3986968791733522im, 0.7780522459714531 - 0.33825409659477523im, 0.6493808890370768 + 0.11693866254337679im, 0.6493808890370768 - 0.11693866254337679im],
    #k::Float64 = 0.0013974753593581637,

    ## 1.0 git 1.0
    #z::Vector{ComplexF64} = ComplexF64[0.663773245106636 + 0.7479338734678392im, 0.663773245106636 - 0.7479338734678392im, 0.7482754482767567 + 0.6633881620184512im, 0.7482754482767567 - 0.6633881620184512im, 0.9470388012442186 + 0.3211191506869586im, 0.9470388012442186 - 0.3211191506869586im],
    #p::Vector{ComplexF64} = ComplexF64[0.5739536456022521 + 0.8022978356797079im, 0.5739536456022521 - 0.8022978356797079im, 0.43463896793768686 + 0.8134457147570461im, 0.43463896793768686 - 0.8134457147570461im, -0.13327154068187774 + 0.6083694924015626im, -0.13327154068187774 - 0.6083694924015626im],
    #k::Float64 = 0.14873429770730234,

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

println(rozwiazanie())
    
    ## dla z, p, k ########### nvm tamto lepsze
    #P = length(p)
    #mod = zeros(P)
    #x = 0

    #for i in 1:P
    #    mod[i] = abs(p[i])
    #end

    #sort!(mod)

    #if mod[P] < 1
    #    x = 1.0
    #elseif mod[P] == 1.0
    #    x = 0.0
    #else
    #    x = -1.0
    #end
    #return x