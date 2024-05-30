## Oblicz odpowiedź impulsową ℎ∈𝑅63 nierekursywnego filtru górnoprzepustowego rzędu 62 o liniowej charakterystyce fazowej. 
## Filtr zaprojektuj tak aby przy częstotliwości próbkowania 𝑓𝑝=113.0 Hz, 3 dB pasmo przepustowe zaczynało się na częstotliwość 𝑓0=16.95 Hz.
## Do zaprojektowania filtru wykorzystaj metodę okien czasowych i okno Hanninga. Jako rozwiązanie podaj sumę wartości wektora ℎh o indeksach 𝑧=[35,14,25], 
## to znaczy,∑𝑖∈𝑧ℎ𝑖.i∈z∑hi.
##!!!!!!!!!!OKNA STR 213 FILTRY STR 330 !!!!!!!!!!!!!
##
function rozwiazanie(;
    ##wynik: 0.029903596958541175 okno blackmana
    ##order::Int = 32,
    ##fp::Float64 = 115.0,
    ##f0::Float64 = 36.8,
    ##z::Vector{Int} = [9, 31, 12],

    ## Prawidłwe rozwiązanie tego problemu to -0.03809121223861556
    order::Int = 62,
    fp::Float64 = 113.0,
    f1::Float64 = 15.82,
    f2::Float64 = 18.08,
    z::Vector{Int} = [35, 14, 25],
)
  
end

rozwiazanie()

##wynik: 0.029903596958541175 okno blackmana
##order::Int = 32,
##fp::Float64 = 115.0,
##f0::Float64 = 36.8,
##z::Vector{Int} = [9, 31, 12],