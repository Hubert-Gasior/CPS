##Dany jest dyskretny system liniowy niezmienny w czasie, który jest opisany poniższym równaniem różnicowym.
##∑𝑚=0𝑀𝑏𝑚𝑥[𝑛−𝑚]=∑𝑘=0𝐾𝑎𝑘𝑦[𝑛−𝑘]m=0∑Mbmx[n−m]=k=0∑Kaky[n−k]
##Współczynniki tego systemu znajdują się odpowiednio w wektorach 𝑏=[𝑏0,𝑏1,…,𝑏𝑀]∈𝑅𝑀+1 i 𝑎=[𝑎0,𝑎1,…,𝑎𝑁]∈𝑅𝑁+1. 
##System ten został pobudzony impulsowym sygnałem 𝑥[𝑛]∈𝑅, którego niezerowe próbki znajdują się w wektorze 𝑥=[𝑥[0],𝑥[1],…,𝑥[10]]𝑇∈𝑅11. 
##Znajdź sygnał 𝑦[𝑛]∈𝑅 będący odpowiedą systemu na pobudzenie go sygnałem 𝑥[𝑛]. 
##Jako odpowiedź podaj średnią sygnału utworzonego z pierwszych 𝐿=40 próbek znalezionego sygnału 𝑦[𝑛]], to znaczy dla 𝑛=0,1,…,39.

function difference_equation (;
    b::Vector{Float64} = [0.005441273376759906, -0.03449901039942005, 0.0972585889978529, -0.15218569455537972, 0.12341632380530557, 0.0, -0.12341632380530561, 0.15218569455537972, -0.09725858899785288, 0.03449901039942004, -0.005441273376759905],
    a::Vector{Float64} = [1.0, -8.160505413183758, 31.277669308450633, -73.84900794345239, 118.69652834396393, -135.54813953579742, 111.34022205528859, -64.97832314456227, 25.814750355472402, -6.318085735345264, 0.7264507175996398],
    x::Vector{Float64} = [0.65, 0.47, 0.35, 0.47, 0.98, -1.0, 0.31, 0.92, 0.86, 0.99, -0.4, 0.23, 0.89, 0.49, -0.33, 0.13, 0.37, -0.63, -0.85, 0.9, 0.19, -0.32, -0.87, 0.18, 0.47, -0.69, 0.63, -0.15, 0.88, 1.0, 0.85, 0.94, 0.91, -0.78, 0.39, 0.8, 0.91, -0.07, 0.07, -0.42, -0.15, 0.68, -0.91, 0.52, 0.89, -0.48, -0.86, 0.22],
    L::Int = 70,
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
