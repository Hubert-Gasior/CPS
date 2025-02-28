## Z ciągłego sygnału 𝑓(𝑡)∈𝑅 o paśmie ograniczonym od dołu i góry przez częstotliwość ∣𝐵∣<12Δ𝑚, 
## zostało pobrane 8787 próbek w równych odstępach czasu Δ𝑚=𝑚𝑛+1−𝑚𝑛. Wartości sygnału oraz momenty w których zostały pobrane kolejne próbki, 
## znajdują się odpowiednio w wektorze 𝑠∈𝑅87 oraz w wektorze 𝑚∈𝑅87, gdzie 𝑠𝑛=𝑓(𝑚𝑛).
## Na podstawie wektorów 𝑚 oraz 𝑠, znajdź sygnał 𝑔(𝑡), będący rekonstrukcją sygnału 𝑓(𝑡) otrzymaną z wykorzystaniem wzoru interpolacyjnego Whittakera-Shannona. 
## Jako rozwiązanie podaj sumę wartości sygnału 𝑔(𝑡) dla momentów 𝑡∈𝑅16, to znaczy:∑𝑛=116𝑔(𝑡𝑛)

function interpolation(;
    m::Vector{Float64} = [3.2, 3.2006, 3.2012, 3.2018, 3.2024, 3.203, 3.2036, 3.2042, 3.2048, 3.2054, 3.206, 3.2066, 3.2072, 3.2078, 3.2084, 3.209, 3.2096, 3.2102, 3.2108, 3.2114, 3.212, 3.2126, 3.2132, 3.2138, 3.2144, 3.215, 3.2156, 3.2162, 3.2168, 3.2174, 3.218, 3.2186, 3.2192, 3.2198, 3.2204, 3.221, 3.2216, 3.2222, 3.2228, 3.2234, 3.224, 3.2246, 3.2252, 3.2258, 3.2264, 3.227, 3.2276, 3.2282, 3.2288, 3.2294, 3.23],
    s::Vector{Float64} = [0.886, 0.0665, 0.2816, 0.0565, 0.4975, 0.0335, 0.9742, 0.455, 0.3927, 0.7236, 0.1186, 0.5896, 0.2592, 0.4961, 0.4209, 0.642, 0.7256, 0.0717, 0.5057, 0.2198, 0.0899, 0.5736, 0.4955, 0.5075, 0.7755, 0.7802, 0.6523, 0.8459, 0.7478, 0.5404, 0.2042, 0.3162, 0.5685, 0.7426, 0.4902, 0.4047, 0.9645, 0.603, 0.9666, 0.0127, 0.9181, 0.1197, 0.0613, 0.0448, 0.2695, 0.4974, 0.7787, 0.6833, 0.6863, 0.9352, 0.2903],
    t::Vector{Float64} = [3.21602, 3.21782, 3.21722, 3.22382, 3.20918, 3.20012, 3.22694, 3.20582, 3.2159, 3.21248, 3.2234],
    )
    Delta_m = m[2] - m[1]
    g_sum = 0
    
    for t in t
        sinc_values = sinc.((t .- m) ./ Delta_m)
        g_sum += sum(s .* sinc_values)
    end
    
    return g_sum
end
