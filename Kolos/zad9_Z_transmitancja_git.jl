##Dany jest dyskretny system liniowy niezmienny w czasie, który jest opisany Z-transmitacją 𝐻(𝑧). 
##Transmitancja 𝐻(𝑧) jest zdefiniowana poprzez dwa wektory 𝑏=[𝑏0,𝑏1,…,𝑏𝑀]∈𝑅𝑀+1 oraz 𝑎=[𝑎0,𝑎1,…,𝑎𝑁]∈𝑅𝑁+,
## które są odpowiednio współczynnikami wielomianu w liczniku i mianowniku funkcji wymiernej 𝐻(𝑧)
##Oblicz przesunięcie fazowe 𝜑(𝑓) tego systemu dla częstotliwości 𝑓∈𝑅
##znormalizowanej względem częstotliwości próbkowania. 
##Jako odpowiedź podaj średnie przesunięcie fazowe dla następujących częstotliwości 𝐹=[0.18,0.19,0.28,0.36, to znaczy,1/4∑𝑖=14𝜑(𝐹𝑖).

function rozwiazanie(;
    ##wynik: 0.6884247989546458, git 0.6884247989546456 !!!! Oblicz wzmocnienie 𝐴(𝑓) tego systemu dla częstotliwości 𝑓∈𝑅 znormalizowanej względem częstotliwości próbkowania. Jako odpowiedź podaj średnie wzmocnienie dla następujących częstotliwości 𝐹=[0.17,0.4,0.41], to znaczy, 1/33A(Fi).
    b::Vector{Float64} = [0.14057805413148808, -0.5496709567825141, 0.9813305379425469, -0.9813305379425469, 0.5496709567825141, -0.14057805413148805],
    a::Vector{Float64} = [1.0, -0.7943952595790318, 0.9758046873511725, -0.4065474189933993, 0.14744644568906448, -0.018965286100430738],
    F::Vector{Float64} = [0.17, 0.4, 0.41],

    # z - zera transmitacnji, p - bieguny transmitancji, k - wspolczynnik wzmocnienia, podac srednie przesunieice fazowe
    # wynik 2.1041142174748932
    #zz::Vector{ComplexF64} = ComplexF64[1.0 + 0.0im, 1.0 + 0.0im, 1.0 + 0.0im, -1.0 + 0.0im, -1.0 + 0.0im, -1.0 + 0.0im],
    #pp::Vector{ComplexF64} = ComplexF64[0.7062828118446747 - 0.6484776839534279im, 0.3958741555825379 + 0.8582299669671247im, 0.7062828118446747 + 0.6484776839534279im, 0.3958741555825379 - 0.8582299669671247im, 0.5445308115452272 - 0.719591589389158im, 0.5445308115452272 + 0.719591589389158im],
    #k::Float64 = 0.003457159486847785,
    #F::Vector{Float64} = [0.2, 0.2, 0.26, 0.42],

    #wynik 0.2902294651279125, srednie wzmonienie git 0.2902294651279068
    #b::Vector{Float64} = [0.002757034434661249, 0.0, -0.008271103303983746, 0.0, 0.008271103303983746, 0.0, -0.002757034434661249],
    #a::Vector{Float64} = [1.0, -2.073528022700252, 3.980982112169337, -3.9212815984659093, 3.5214519410126366, -1.6165796454036947, 0.6896607286372956],
    #F::Vector{Float64} = [0.05, 0.1, 0.19, 0.24],

    #wynik 0.41847835065460415, srednie przesuniecie fazowe git 0.41847835065460437
    #b::Vector{Float64} = [0.3098937918265392, -1.2395751673061568, 1.8593627509592352, -1.2395751673061568, 0.3098937918265392],
    #a::Vector{Float64} = [1.0, -1.8684239203399835, 1.7379343944338954, -0.7436787820592687, 0.21326775601466166],
    #F::Vector{Float64} = [0.09, 0.15, 0.32, 0.39, 0.43, 0.49],

    ##wynik -1.1922183854913784 podac srednia przesuniecia fazowego git 1.192218385491378
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
    
    return x/f
end

println(rozwiazanie())