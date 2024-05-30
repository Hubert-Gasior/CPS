##Dany jest dyskretny system liniowy niezmienny w czasie, który jest opisany poniższym równaniem różnicowym.
##∑𝑚=0𝑀𝑏𝑚𝑥[𝑛−𝑚]=∑𝑘=0𝐾𝑎𝑘𝑦[𝑛−𝑘]m=0∑Mbmx[n−m]=k=0∑Kaky[n−k]
##Współczynniki tego systemu znajdują się odpowiednio w wektorach 𝑏=[𝑏0,𝑏1,…,𝑏𝑀]∈𝑅𝑀+1 i 𝑎=[𝑎0,𝑎1,…,𝑎𝑁]∈𝑅𝑁+1. 
##System ten został pobudzony impulsowym sygnałem 𝑥[𝑛]∈𝑅, którego niezerowe próbki znajdują się w wektorze 𝑥=[𝑥[0],𝑥[1],…,𝑥[10]]𝑇∈𝑅11. 
##Znajdź sygnał 𝑦[𝑛]∈𝑅 będący odpowiedą systemu na pobudzenie go sygnałem 𝑥[𝑛]. 
##Jako odpowiedź podaj średnią sygnału utworzonego z pierwszych 𝐿=40 próbek znalezionego sygnału 𝑦[𝑛]], to znaczy dla 𝑛=0,1,…,39.

function rozwiazanie(;
    ##wyniik: 0.0031422521075326853 nie dziala 
    ##b::Vector{Float64} = [5.9397909049140326e-5, 0.0, -0.0002375916361965613, 0.0, 0.000356387454294842, 0.0, -0.0002375916361965613, 0.0, 5.9397909049140326e-5],
    ##a::Vector{Float64} = [1.0, -6.584519678539641, 20.03633183347548, -36.53850677645415, 43.560079456205045, -34.73190004025754, 18.10437659097832, -5.655996664319091, 0.8167826139792291],
    ##x::Vector{Float64} = [-0.88, -0.62, 0.34, -0.69, -0.28, 0.08, -0.26, 0.15, -0.22, -0.16, -0.23, -0.68, 0.53, 0.01, -0.56, -0.48, -0.67, -0.35, 0.73, -0.17, -0.12, -0.5, -0.49],
    ##L::Int = 44,

    ## wynik: 0.024568587682586115 dziala 
    b::Vector{Float64} = [0.7149786181915332, -1.77298988519781, 4.508648987179774, -6.000386214321165, 7.692950947454359, -6.000386214321165, 4.508648987179776, -1.7729898851978108, 0.7149786181915339],
    a::Vector{Float64} = [1.0, -2.3390339671688585, 5.602055595207316, -7.05443164379444, 8.55973395630644, -6.345659411227064, 4.534773149144444, -1.7046178495898439, 0.6570833736809241],
    ::Vector{Float64} = [1.0, 0.8, -0.54, -0.28, -0.75, 0.69, 0.8, 0.46, -0.91, 0.29, -0.36],
    L::Int = 40,
)
    M = length(b) - 1
    K = length(a) - 1
    y = zeros(Float64, L)

    for n in 1:L
        for m in 0:M
            if n - m > 0 && n - m <= length(x)
                y[n] += b[m+1] * x[n-m]
            end
        end
        for k in 1:K
            if n - k > 0
                y[n] -= a[k+1] * y[n-k]
            end
        end
        y[n] /= a[1]
    end
    return sum(y)/L
end

println(rozwiazanie())