## Oblicz odpowiedź impulsową ℎ∈𝑅63 nierekursywnego filtru górnoprzepustowego rzędu 62 o liniowej charakterystyce fazowej. 
## Filtr zaprojektuj tak aby przy częstotliwości próbkowania 𝑓𝑝=113.0 Hz, 3 dB pasmo przepustowe zaczynało się na częstotliwość 𝑓0=16.95 Hz.
## Do zaprojektowania filtru wykorzystaj metodę okien czasowych i okno Hanninga. Jako rozwiązanie podaj sumę wartości wektora ℎh o indeksach 𝑧=[35,14,25], 
## to znaczy,∑𝑖∈𝑧ℎ𝑖.i∈z∑hi.
##!!!!!!!!!!OKNA STR 213 FILTRY STR 330 !!!!!!!!!!!!!
##
function rozwiazanie(;
    #wynik 0.002769575727554671 , filtr pasmowozaporowy, okno hamminga, obliczyc sume wektora h o indeksach Z, rząd 36
    #order::Int = 36,
    #fp::Float64 = 146.0,
    #f1::Float64 = 0.73,
    #f2::Float64 = 13.87,
    #z::Vector{Int} = [33, 3, 32, 29, 33, 24],

    #wynik -0.011101364885805601, filtr górnoprzepustowy zedy 72, okno trojkatne 
    #order::Int = 72,
    #fp::Float64 = 195.0,
    #f0::Float64 = 64.35,
    #z::Vector{Int} = [44, 26, 25, 52],

    #wynik 0.022093758594263418, filtr pasmowprzepustowy rzedu 90, okno hamminga 
    #order::Int = 90,
    #fp::Float64 = 197.0,
    #f1::Float64 = 37.43,
    #f2::Float64 = 80.77,
    #z::Vector{Int} = [36, 5, 27, 23, 74, 75],

    ## Prawidłwe rozwiązanie tego problemu to -0.03809121223861556
    order::Int = 62,
    fp::Float64 = 113.0,
    f1::Float64 = 15.82,
    f2::Float64 = 18.08,
    z::Vector{Int} = [35, 14, 25],
)
  
end

rozwiazanie()