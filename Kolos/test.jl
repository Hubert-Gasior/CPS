using LinearAlgebra
function rozwiazanie(;
    b::Vector{Float64} = [0.013174984956056434, 0.012809044978673764, 0.012809044978673764, 0.013174984956056434],
    a::Vector{Float64} = [1.0, -2.164536098004265, 1.6450496095358393, -0.42854545166211355],
)
    N = length(a) -2
    H = Matrix(I ,N ,N)
    Z = zeros(N)
    H = vcat(Z', H)
    H = hcat(H, -1*reverse(a[2:end]))
    roots = eigvals(H)
    pkt = abs.(roots)
    if all(pkt .< 1.0)
        return 1.0
    else 
        return -1.0
    end
end

println(rozwiazanie())

#p1 sygnal git                              1:43 min
#p2 interpolacja git                        1:20 min
#p3 kwantyzator git                         2:30 min
#p4 dft git ale powtorzyc                   3:06 min
#p5 y po sygnale (x, h) git ale powtorzc    1:53 min
#p6 roznicwe git ale powtorzyc              2:38 min
#p7 Z-transmitancja git powtorzyc    (zz,pp 6:21 min)
#p8 stabilnosc git                       (p 0:45 min)
#p9 filtr                                   4:50 min 
##razem                                     25:06 min

#wyniki                                     29 min, 23 min, 28:21 min 25:36 min 23:47 min 24:54 min 29:37 z luzem