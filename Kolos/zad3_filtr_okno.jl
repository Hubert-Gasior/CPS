## Oblicz odpowiedź impulsową ℎ∈𝑅63 nierekursywnego filtru górnoprzepustowego rzędu 62 o liniowej charakterystyce fazowej. 
## Filtr zaprojektuj tak aby przy częstotliwości próbkowania 𝑓𝑝=113.0 Hz, 3 dB pasmo przepustowe zaczynało się na częstotliwość 𝑓0=16.95 Hz.
## Do zaprojektowania filtru wykorzystaj metodę okien czasowych i okno Hanninga. Jako rozwiązanie podaj sumę wartości wektora ℎh o indeksach 𝑧=[35,14,25], 
## to znaczy,∑𝑖∈𝑧ℎ𝑖.i∈z∑hi.
##!!!!!!!!!!OKNA STR 213 FILTRY STR 330 !!!!!!!!!!!!!
##
function rozwiazanie(;
    order::Int = 62,
    fp::Float64 = 113.0,
    f0::Float64 = 16.95,
    z::Vector{Int} = [35, 14, 25],
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
