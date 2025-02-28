##Dany jest dyskretny system liniowy niezmienny w czasie, który jest opisany Z-transmitacją 𝐻(𝑧). 
##Transmitancja 𝐻(𝑧) jest zdefiniowana poprzez dwa wektory 𝑏=[𝑏0,𝑏1,…,𝑏𝑀]∈𝑅𝑀+1 oraz 𝑎=[𝑎0,𝑎1,…,𝑎𝑁]∈𝑅𝑁+,
## które są odpowiednio współczynnikami wielomianu w liczniku i mianowniku funkcji wymiernej 𝐻(𝑧)
##Oblicz przesunięcie fazowe 𝜑(𝑓) tego systemu dla częstotliwości 𝑓∈𝑅
##znormalizowanej względem częstotliwości próbkowania. 
##Jako odpowiedź podaj średnie przesunięcie fazowe dla następujących częstotliwości 𝐹=[0.18,0.19,0.28,0.36, to znaczy,1/4∑𝑖=14𝜑(𝐹𝑖).

function Z_transform(;
    # z - zera transmitacnji, p - bieguny transmitancji, k - wspolczynnik wzmocnienia, podac srednie przesunieice fazowe
    # wynik 2.1041142174748932 git 2.1041142174749004 
    #zz::Vector{ComplexF64} = ComplexF64[1.0 + 0.0im, 1.0 + 0.0im, 1.0 + 0.0im, -1.0 + 0.0im, -1.0 + 0.0im, -1.0 + 0.0im],
    #pp::Vector{ComplexF64} = ComplexF64[0.7062828118446747 - 0.6484776839534279im, 0.3958741555825379 + 0.8582299669671247im, 0.7062828118446747 + 0.6484776839534279im, 0.3958741555825379 - 0.8582299669671247im, 0.5445308115452272 - 0.719591589389158im, 0.5445308115452272 + 0.719591589389158im],
    #k::Float64 = 0.003457159486847785,
    #F::Vector{Float64} = [0.2, 0.2, 0.26, 0.42],
        
    b::Vector{Float64} = [0.006157162658076966, -0.03129569309345338, 0.09481154824693733, -0.2008606047620769, 0.3317744059440209, -0.440525761591387, 0.4842782823030848, -0.440525761591387, 0.33177440594402074, -0.20086060476207684, 0.09481154824693731, -0.03129569309345336, 0.006157162658076963],
    a::Vector{Float64} = [1.0, -5.3902906047044965, 17.145305167299856, -37.188353339479946, 61.2585278933829, -78.67209718248131, 81.04187274604377, -66.81775993179158, 44.18610929081598, -22.777806676539583, 8.916502101290128, -2.3795356066315185, 0.3749420847476254],
    F::Vector{Float64} = [0.03, 0.09, 0.16, 0.22, 0.28],
)
    ###### do zz pp
#    function conv(f1::AbstractVector, f2::AbstractVector)::Vector
#        F1 = length(f1)
#        F2 = length(f2)
##        y = zeros(eltype(f1), F1 + F2 - 1)
 #       for i in 1:F1
#            for j in 1:F2
#                y[i+j-1] += f1[i] * f2[j]
#            end
#        end
#        return y
#    end
#
 #   function poly(r::AbstractVector)
  #      p = [1.0 + 0im]
   #     for i in eachindex(r)
#            p = conv(p, [1,-r[i]])
#        end
#        return p
#    end
#    
#    a = poly(pp)
#    b = poly(zz) .* k
    ######
    
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

        x += angle(h[i])
        #x += abs(h[i])
    end
    
    return x/f
end
