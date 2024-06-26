##Dany jest dyskretny system liniowy niezmienny w czasie, który jest opisany poniższym równaniem różnicowym.
##∑𝑚=0𝑀𝑏𝑚𝑥[𝑛−𝑚]=∑𝑘=0𝐾𝑎𝑘𝑦[𝑛−𝑘]m=0∑Mbmx[n−m]=k=0∑Kaky[n−k]
##Współczynniki tego systemu znajdują się odpowiednio w wektorach 𝑏=[𝑏0,𝑏1,…,𝑏𝑀]∈𝑅𝑀+1 i 𝑎=[𝑎0,𝑎1,…,𝑎𝑁]∈𝑅𝑁+1. 
##System ten został pobudzony impulsowym sygnałem 𝑥[𝑛]∈𝑅, którego niezerowe próbki znajdują się w wektorze 𝑥=[𝑥[0],𝑥[1],…,𝑥[10]]𝑇∈𝑅11. 
##Znajdź sygnał 𝑦[𝑛]∈𝑅 będący odpowiedą systemu na pobudzenie go sygnałem 𝑥[𝑛]. 
##Jako odpowiedź podaj średnią sygnału utworzonego z pierwszych 𝐿=40 próbek znalezionego sygnału 𝑦[𝑛]], to znaczy dla 𝑛=0,1,…,39.

function rozwiazanie(;

    #wynik 0.08395252761329497, poadc RMS git 0.08395252761329497
    b::Vector{Float64} = [0.005441273376759906, -0.03449901039942005, 0.0972585889978529, -0.15218569455537972, 0.12341632380530557, 0.0, -0.12341632380530561, 0.15218569455537972, -0.09725858899785288, 0.03449901039942004, -0.005441273376759905],
    a::Vector{Float64} = [1.0, -8.160505413183758, 31.277669308450633, -73.84900794345239, 118.69652834396393, -135.54813953579742, 111.34022205528859, -64.97832314456227, 25.814750355472402, -6.318085735345264, 0.7264507175996398],
    x::Vector{Float64} = [0.65, 0.47, 0.35, 0.47, 0.98, -1.0, 0.31, 0.92, 0.86, 0.99, -0.4, 0.23, 0.89, 0.49, -0.33, 0.13, 0.37, -0.63, -0.85, 0.9, 0.19, -0.32, -0.87, 0.18, 0.47, -0.69, 0.63, -0.15, 0.88, 1.0, 0.85, 0.94, 0.91, -0.78, 0.39, 0.8, 0.91, -0.07, 0.07, -0.42, -0.15, 0.68, -0.91, 0.52, 0.89, -0.48, -0.86, 0.22],
    L::Int = 70,

    #wynik 0.02159717078064099, podac moc git 0.02159717078064099
    #b::Vector{Float64} = [5.1434804424349956e-5, 0.0, -0.0002571740221217498, 0.0, 0.0005143480442434996, 0.0, -0.0005143480442434996, 0.0, 0.0002571740221217498, 0.0, -5.1434804424349956e-5],
    #a::Vector{Float64} = [1.0, -9.36729505097898, 39.75296189668305, -100.67309664445722, 168.51507693056055, -194.83880406051463, 157.5983115371838, -88.06143876804697, 32.531052137580645, -7.173838602900698, 0.7170706249130379],
    #x::Vector{Float64} = [-0.43, 0.89, -0.46, -0.67, -0.92, 0.54, 0.44, 0.05, -0.69, -0.2, -0.71, -0.51, 0.57, 0.64, 0.32, 0.61, 0.81, 0.35, 0.72, 0.69, -0.4, 0.27, -0.65, 0.73, -0.06, 0.1, 0.17, 0.01, 0.88, -0.42, 0.15, 0.16, -0.04, -0.23, -0.17, 0.38, -0.06],
    #::Int = 77,

    ## wynik: 0.024568587682586115 git 0.024568587682586105
    #b::Vector{Float64} = [0.7149786181915332, -1.77298988519781, 4.508648987179774, -6.000386214321165, 7.692950947454359, -6.000386214321165, 4.508648987179776, -1.7729898851978108, 0.7149786181915339],
    #a::Vector{Float64} = [1.0, -2.3390339671688585, 5.602055595207316, -7.05443164379444, 8.55973395630644, -6.345659411227064, 4.534773149144444, -1.7046178495898439, 0.6570833736809241],
    #x::Vector{Float64} = [1.0, 0.8, -0.54, -0.28, -0.75, 0.69, 0.8, 0.46, -0.91, 0.29, -0.36],
    #L::Int = 40,
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
    end

    RMS = sqrt(sum(abs2, y)/L)
    #power = sum(abs2.(y))/L
    return RMS
end

println(rozwiazanie())