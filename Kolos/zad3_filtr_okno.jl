## Oblicz odpowiedź impulsową ℎ∈𝑅63 nierekursywnego filtru górnoprzepustowego rzędu 62 o liniowej charakterystyce fazowej. 
## Filtr zaprojektuj tak aby przy częstotliwości próbkowania 𝑓𝑝=113.0 Hz, 3 dB pasmo przepustowe zaczynało się na częstotliwość 𝑓0=16.95 Hz.
## Do zaprojektowania filtru wykorzystaj metodę okien czasowych i okno Hanninga. Jako rozwiązanie podaj sumę wartości wektora ℎh o indeksach 𝑧=[35,14,25], 
## to znaczy,∑𝑖∈𝑧ℎ𝑖.i∈z∑hi.
##!!!!!!!!!!OKNA STR 213 FILTRY STR 330 !!!!!!!!!!!!!
##
function rozwiazanie(;
    #wynik 0.002769575727554671 , filtr pasmowozaporowy, okno hamminga, obliczyc sume wektora h o indeksach Z, rząd 36 git 0.002769575727554656
    #order::Int = 36,
    #fp::Float64 = 146.0,
    #f1::Float64 = 0.73,
    #f2::Float64 = 13.87,
    #z::Vector{Int} = [33, 3, 32, 29, 33, 24],

    #wynik -0.011101364885805601, filtr górnoprzepustowy zedy 72, okno trojkatne git -0.01110136488580558
    #order::Int = 72,
    #fp::Float64 = 195.0,
    #f0::Float64 = 64.35,
    #z::Vector{Int} = [44, 26, 25, 52],

    #wynik 0.022093758594263418, filtr pasmowprzepustowy rzedu 90, okno hamminga git 0.022093758594263397
    #order::Int = 90,
    #fp::Float64 = 197.0,
    #f1::Float64 = 37.43,
    #f2::Float64 = 80.77,
    #z::Vector{Int} = [36, 5, 27, 23, 74, 75],

    #wynik 0.1327799158448321, filtr dolnoprzepustowy rzedu 56, okno hamminga. git 0.13277991584483212
    #order::Int = 56,
    #fp::Float64 = 101.0,
    #f0::Float64 = 9.09,
    #z::Vector{Int} = [47, 27, 18, 9],

    #wynik -0.11075748127511718 git -0.11075748127511721 dolno hamming
    #order::Int = 88,
    #fp::Float64 = 116.0,
    #f0::Float64 = 52.2,
    #z::Vector{Int} = [53, 41, 7, 23, 28],

    #wynik 0.9322793470185764 zle Nan dolno hanning
    #order::Int = 22,
    #fp::Float64 = 141.0,
    #f0::Float64 = 59.22,
    #z::Vector{Int} = [13, 1, 19, 12, 8],

    #wynik gorno hanning git
    order::Int = 24,
    fp::Float64 = 133.0,
    f0::Float64 = 23.94,
    z::Vector{Int} = [3, 21, 1],
)
    F = f0/fp
    #F1 = f1/fp
    #F2 = f2/fp
    omega = 2*π*F
    #omega1 = 2*π*F1
    #omega2 = 2*π*F2

    triangle(N) = [1-abs(n)/(N+1) for n = -N:N]
    Hann(N) = [0.5+0.5*cos((2*π*n)/(2*N+1)) for n = -N:N]
    Hamming(N) = [0.54 + 0.46*cos((2*π*n)/(2*N+1)) for n = -N:N]
    Blackman(N) = [0.42 + 0.5*cos((2*π*n)/(2*N+1))+0.08*cos((4*π*n)/(2*N+1)) for n in -N:N]

    n=-order/2:order/2
    h=zeros(length(n))
    hw=zeros(length(n))
    result = 0

    function delta(n)
        if n==0
            return 1
        else
            return 0
        end
    end

    for i in 1:length(n)
        #h[i] = (2*F*sin((omega*n[i]))/(omega*n[i])) #dolno
        h[i] = delta(n[i]) - 2*F*(sin(omega*n[i])/(omega*n[i])) #gorno
        #h[i] = 2*F2*(sin(omega2*n[i])/(omega2*n[i])) - 2*F1*(sin(omega1*n[i])/(omega1*n[i])) # pasmowoprzepustowy
        #h[i] = delta(n[i]) - (2*F2*(sin(omega2*n[i])/(omega2*n[i]))-2*F1*(sin(omega1*n[i])/(omega1*n[i]))) #pasmowozaporowy
    end

    #w=triangle(order/2)
    w=Hann(order/2)
    #w=Hamming(order/2)
    #w=Blackman(order/2)
    hw=h.*w

    for z in z
        result += hw[z]
    end

    return result
end

println(rozwiazanie())

###ADI dziala
#function rozwiazanie_9(;
#    order::Int = 46,
#    fp::Float64 = 143.0,
#    f1::Float64 = 5.01,
#    f2::Float64 = 40.76,
#    z::Vector{Int} = [33, 10, 28],
#)
#    #0.030219951507893233 git 0.030219951507893233
#    triangle(N) = [1-abs(n)/(N+1) for n = -N:N]
##    n=-order/2:order/2
#    h=zeros(length(n))
#    hw=zeros(length(n))
#    out = 0
#    F1 = f1/fp
#    F2 = f2/fp
#    function delta(n)
#        if n==0
#            return 1
#        else
#            return 0
#        end
#    end
#    for i in 1:length(n)
#        h[i] = delta(n[i]) - (2*F2*sinc(2*F2*n[i])-2*F1*sinc(2*F1*n[i]))
#    end
#    w=triangle(order/2)
#    hw=h.*w
#
#    for i in z
#        out += hw[i]
#    end
#    return out
#    
#end
#rozwiazanie_9()