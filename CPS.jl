module CPS

using CairoMakie
using GeometryBasics: Point
using GeoMakie
using LinearAlgebra
using Random

author = Dict{Symbol, String}(
    :index => "415834",
    :name  => "Hubert Gąsior",
    :email => "hgasior@student.agh.edu.pl",
    :group => "2",
)

# SygnaĹy ciÄgĹe
##
cw_rectangular(t::Real; T=1.0)::Real = t % T <= 0.5 ? 1 : 0
##

##
cw_triangle(t::Real, T=1.0)::Real = t % T <= 0.5 ? t % T : 1 - (t % T)
##

##
function cw_literka_M(t::Real, T = 1.0)
    fig = Figure()
    ax = Axis(fig[1, 1])
    lines!(ax, [Point(t, 0), Point(t,1), Point(t + T/2, 0.5), Point(t + T, 1), Point(t + T, 0)])
    fig
end
##

##
function cw_literka_U(t::Real; T = 1.0)
    x = -T/2 : 0.0001 : T/2
    fun = 8*x.^2
    shift = x .+ 1.25*t
    fig = Figure()
    ax = Axis(fig[1, 1])
    lines!(ax, shift, fun)
    fig
end
##

##
ramp_wave(t::Real; T = 1.0)::Real = t % T 
##

##
sawtooth_wave(t::Real; T = 1.0)::Real= 1 -(t % T)
##

##
triangular_wave(t::Real, T = 1.0)::Real = t % T <= 0.5 ? 2*(t % T) : 2 - 2*(t % T)
##

##
square_wave(t::Real; T = 1.0)::Real = t % T <= 0.5 ? 1 : -1
##

##
pulse_wave(t::Real; p = 0.2, T = 1.0)::Real = t % T <= p ? 1 : 0
##

##
impulse_reapeter(g::Function, t1::Real, t2::Real)::Function = f(t::Real) = g(t - ((t - t1) % (t2 - t1)))
##

##
function ramp_wave_b1(t; A=1.0, T=1.0, band=20.0)
    w = 2*π/T
    k = 1
    y = 0
    while 2*pi*band > w*k
        y += 1/(pi*k)*sin(2*pi*k*t)
        k += 1
    end
    if t%T == 0
        y = 0
    else
        y = y + 0.5
end
return y
end
##

##
function sawtooth_wave_b1(t; A=1.0, T=1.0, band=20.0)
    w = 2*π/T
    k = 1
    y = 0
    while 2*pi*band > w*k
        y += -1/(pi*k)*sin(2*pi*k*t)
        k += 1
    end
    if t%T == 0
            y = 0
        else
            y = y + 0.5
    end
    return y
end
##

##
function triangular_wave_b1(t; A=1.0, T=1.0, band=20.0)
    w = 2*π/T
    k = 1
    y = 0
    while 2*pi*band > w*k
        y += ((-4*A)/(π^2))*(cos((2*k-1)*w*t)/(2*k-1)^2)
        k += 1
    end
    return y + 0.5
end
##

##
function square_wave_b1(t; A=1.0, T=1.0, band=20.0)
    w = 2*π/T
    k = 1
    y = 0
    while 2*pi*band > w*k
        y += ((2*A)/(π*k))*sin(2*k*π)*cos(k*w*t)
        k += 1
    end
    if t%T == 0
        y = 0
    else
        y = y + A
end
return y
end
##

##
function pulse_wave_b1(t; D=0.2, A=1.0, T=1.0, band=20.0)
end
##

##
function impulse_repeater_b1(g::Function, t0::Real, t1, band::Real)
end
##

##
function rand_signal(f1::Real, f2::Real)    
end
##

##

# SygnaĹy dyskretne
##
kronecker(n::Integer)::Real = n == 0 ? 1 : 0
##

##
heaviside(n::Integer)::Real = n < 0 ? 0 : 1
##

# Okna
##
rect(N::Integer)::AbstractVector{<:Real} = N <= 0 ? println("N must be greater than 0") : samples = ones(N)
##

##
triang(N::Int) = N <= 0 ? println("N must be greater than 0") : (N == 1 ? [1.0] : [(i <= div(N, 2) ? i / (div(N, 2) + 1) : (N - i + 1) / (div(N, 2) + 1)) for i in 1:N])
##

##
hanning(N::Integer)::AbstractVector{<:Real} = N <= 0 ? println("N must be greater than 0") : ( N == 1 ? [1.0] : [0.5*(1-cos((2*π*i)/(N-1))) for i in 0 : N-1])
##

##
hamming(N::Integer)::AbstractVector{<:Real} =  N <= 0 ? println("N must be greater than 0") : (N == 1 ? [1.0] : [0.53836 - 0.46164*cos((2*π*i)/(N-1)) for i in 0 : N-1])
##

##
blackman(N::Integer)::AbstractVector{<:Real} = N <= 0 ? println("N must be greater than 0") : (N == 1 ? [1.0] :  [0.42-(0.5*cos((2*π*i)/(N-1)))+(0.08*cos((4*π*i)/(N-1))) for i in 0 : N-1])
##

# Parametry sygnaĹĂłw
##
mean(x::AbstractVector)::Number = sum(x)/length(x)
##

##
peak2peak(x::AbstractVector)::Real = abs(maximum(x))+abs(minimum(x))
##

##
energy(x::AbstractVector)::Real = sum((abs2.(x)))
##

##
power(x::AbstractVector)::Real = (1/length(x))*sum(abs2.(x))
##

##
rms(x::AbstractVector)::Real = √((1/length(x))*sum(abs2.(x)))
##

##
function running_mean(x::AbstractVector, M::Integer)::Vector
    l = length(x)÷(2*M+1)
    check = length(x)%(2*M+1)
    first_index = 1
    mean = []
    for i in 1 : l+1
        sum = 0
        if first_index > length(x)
            break
        else
            for j in 1 : 2*M+1
                if length(x) - first_index < check
                    for k in 1 : check
                        k += 1
                        if length(x) - first_index == -1
                            break
                        else 
                            sum = sum + x[first_index]
                        end
                        first_index += 1
                    end
                else
                    sum = sum + x[first_index]
                    first_index += 1
                    j += 1
                end
            end
        end
        if length(x) - first_index == -1
            avg = sum/check
        else
            avg = sum/(2*M+1)
        end
        push!(mean, avg)
        first_index = i*(2*M+1)+1
        i += 1
    end
    return mean
end
##

##
function running_energy(x::AbstractVector, M::Integer)::Vector
    l = length(x)÷(2*M+1)
    check = length(x)%(2*M+1)
    first_index = 1
    energy = []
    for i in 1 : l+1
        sum = 0
        if first_index > length(x)
            break
        else
            for j in 1 : 2*M+1
                if length(x) - first_index < check
                    for k in 1 : check
                        k += 1
                        if length(x) - first_index == -1
                            break
                        else 
                            sum = sum + abs2.(x[first_index])
                        end
                        first_index += 1
                    end
                else
                    sum = sum + abs2.(x[first_index])
                    first_index += 1
                    j += 1
                end
            end
        end
        push!(energy, sum)
        first_index = i*(2*M+1)+1
        i += 1
    end
    return energy
end
##

##
function running_power(x::AbstractVector, M::Integer)::Vector
    l = length(x)÷(2*M+1)
    check = length(x)%(2*M+1)
    first_index = 1
    power = []
    for i in 1 : l+1
        sum = 0
        if first_index > length(x)
            break
        else
            for j in 1 : 2*M+1
                if length(x) - first_index < check
                    for k in 1 : check
                        k += 1
                        if length(x) - first_index == -1
                            break
                        else 
                            sum = sum + abs2.(x[first_index])
                        end
                        first_index += 1
                    end
                else
                    sum = sum + abs2.(x[first_index])
                    first_index += 1
                    j += 1
                end
            end
        end
        if length(x) - first_index == -1
            P = (1/check)*sum
        else
            P = (1/(2*M+1))*sum
        end
        push!(power, P)
        first_index = i*(2*M+1)+1
        i += 1
    end
    return power
end
##

# PrĂłbkowanie
##
function interpolate(
    m::AbstractVector,
    s::AbstractVector,
    kernel::Function=sinc
)::Real
    return x -> begin
        sum = 0.0
        Δt = m[2] - m[1]
        for i in eachindex(m)
            sum += s[i] * kernel((x - m[i]) / Δt)
        end
        return sum
    end
end
##

# Kwantyzacja
##
function quantize(x::Real, L::AbstractVector{<:Real})::Real
    return L[argmin(abs.(x .- L))]
end
##

##
SQNR(N::Integer)::Real = N*6.02 + 1.76
##

##
SNR(Psignal, Pnoise)::Real = (10*log10(Psignal/Pnoise))
##

# Obliczanie DFT
##
function dtft(f::Real, signal::AbstractVector{Complex{T}}, fs::Real) where T<:Real
    DTFT = 0.0 + 0.0im
    for i in 1:length(signal) - 1
        DTFT += signal[i] * exp(-im * 2 * π * f * (i - 1) / fs)
    end
    return DTFT
end
##

##
function dft(x::AbstractVector)::Vector
    N = length(x)
    #n = 0
    dft = zeros(Complex, N)

    for k in 1:N
        for n in 1:N-1
           dft[k] += x[n]*exp(-im*((2*π*n*k)/N))   
        end
    end

    return dft
end
##

##
function idft(X::AbstractVector)::Vector
    N = length(x)
    k = 0
    idft = zeros(Complex, N)
    for n in  1:N
        for k in 1:N-1
            idft[n] += (1/N)*x[k]*exp(im*(2*π*k*n)/N)
        end
    end

    return idft
end
##

##
function rdft(x::AbstractVector)::Vector
    N = length(x)
    rdft = zeros(Complex, Int(N/2)+1)
    for k in 1 : length(rdft)
        for n in 1:N
            rdft[k] = sum(x[n]*exp(-2π*im*(k-1)*(n-1)/N))
        end
    end

    return rdft
end
##

##
function irdft(X::AbstractVector, N::Integer)::Vector
    irdft = zeros(Float64, N)
    for n = 1:N
        for k = 1:length(X)
            irdft[n] += real(X[k]) * cos(2π*(k-1)*(n-1)/N) + imag(X[k]) * sin(2π*(k-1)*(n-1)/N)
        end
        irdft[n] /= N
    end
    
    return irdft

    return irdft
end
##

##
function fft_radix2_dit_r(x::AbstractVector)::Vector
    N = length(x)
    x_even = x[1:2:N]
    x_odd = x[2:2:N]
    X = zeros(Complex, N)

    for k in 1:N
        for m in 1:div(N, 2)-1
            X[k] += x_even[m]*exp((-im*2*π*m*k)/(N/2)) + exp((-im*2*π*k)/N)*x_odd[m]*exp((-im*2*π*m*k)/(N/2))
        end
    end

    return X
end
##

##
function ifft_radix2_dif_r(X::AbstractVector)::Vector
    N = length(x)
    x_even = x[1:2:N]
    x_odd = x[2:2:N]
    X = zeros(Complex, N)

    for k in 1:N
        for m in 1:div(N, 2)-1
            X[k] += x_even[m]*exp((im*2*π*m*k)/(N/2)) + exp((im*2*π*k)/N)*x_odd[m]*exp((im*2*π*m*k)/(N/2))
        end
    end

    return X
end
##

##
function fft(x::AbstractVector)::Vector
    dft(x) # MoĹźe da rade lepiej?
end
##

##
function ifft(X::AbstractVector)::Vector
    idft(X) # MoĹźe da rade lepiej?
end
##

##
fftfreq(N::Integer, fs::Real)::Vector = [(k <= N÷2 ? k*(fs/N) : (k-N)*(fs/N)) for k in 0:(N-1)]
##

##
rfftfreq(N::Integer, fs::Real)::Vector = [k*(fs/N) for k in 0 : (N÷2)]
##

##
amplitude_spectrum(x::AbstractVector, w::AbstractVector=rect(length(x)))::Vector = abs.(fft(x.*w))
##

##
power_spectrum(x::AbstractVector, w::AbstractVector=rect(length(x)))::Vector = (1/length(x)).*abs2.(fft(x.*w))
##

##
psd(x::AbstractVector, w::AbstractVector=rect(length(x)), fs::Real=1.0)::Vector = abs2.(fft(x.*w))/(sum(abs2, w)*fs)
##

##
function periodogram(
    x::AbstractVector,
    w::AbstractVector=rect(length(x)),
    L::Integer = 0,
    fs::Real=1.0)::Vector
    N = length(x)
    K = length(w)
    delta = K - L
    num = (N-K)÷delta + 1
    psd = zeros(Complex, K)

    for i in 1:num
        seg = x[(i-1)*delta + 1 : (i-1)*delta + K]
        window_seg = seg .* w
        seg_fft = fft(window_seg)
        psd .+= abs2.(seg_fft)/(sum(abs2.(w))*fs)
    end

    psd ./= num

    return psd[1:K÷2 + 1]
end
##

##
function stft(x::AbstractVector, w::AbstractVector, L::Integer)::Matrix
    missing
end
##

##
function istft(X::AbstractMatrix{<:Complex}, w::AbstractVector{<:Real}, L::Integer)::AbstractVector{<:Real}
    missing
end
##

##
function conv(f::Vector, g::Vector)::Vector
    F = length(f)
    G = length(g)
    y = zeros(F+G-1)

    for i in 1:length(y)
        for j in 1:F
            if i-j+1 > 0 && i-j+1 <= G
                y[i] += f[j]*g[i-j+1]
            end
        end
    end
    return y
end
##

##
function fast_conv(f::Vector, g::Vector)::Vector
    N = length(f)
    M = length(g)
    L = N + M - 1

    f_padded = vcat(f, zeros(L - N))
    g_padded = vcat(g, zeros(L - M))

    F_f = fft(f_padded)
    F_g = fft(g_padded)

    F_conv = F_f .* F_g

    conv_result = real(ifft(F_conv))

    return conv_result[1:L]
end
##

##
function overlap_add(x::Vector, h::Vector, L::Integer)::Vector
    missing
end
##

##
function overlap_save(x::Vector, h::Vector, L::Integer)::Vector
    missing
end
##

##
function lti_filter(b::Vector, a::Vector, x::Vector)::Vector
    N = length(x)
    M = length(b) - 1
    K = length(a) - 1
    y = zeros(Float64, N)

    for n in 1:N
        for k in 0:M
            if n - k > 0
                y[n] += b[k+1] * x[n-k]
            end
        end
        for k in 1:K
            if n - k > 0
                y[n] -= a[k+1] * y[n-k]
            end
        end
    end
    return y
end
##

##
function filtfilt(b::Vector, a::Vector, x::Vector)::Vector
    y_fwd_filt = lti_filter(b, a, x)
    y_rvs = reverse(y_fwd_filt)
    y_rvs_filt = lti_filter(b, a, y_rvs)
    return reverse(y_rvs_filt)
end
##

##
function lti_amp(f::Real, b::Vector, a::Vector)::Real
    M = length(b)
    K = length(a)
    num = sum(b[m+1] * cispi(-2 * f * m) for m in 0:M-1)
    denom = sum(a[k+1] * cispi(-2 * f * k) for k in 0:K-1)
    H_f = num / denom
    return abs(H_f)
end
##

##
function lti_phase(f::Real, b::Vector, a::Vector)::Real
    M = length(b)
    K = length(a)
    num = sum(b[m+1] * cispi(-2 * f * m) for m in 0:M-1)
    denom = sum(a[k+1] * cispi(-2 * f * k) for k in 0:K-1)
    H_f = num / denom
    return angle(H_f)
end
##

##
function firwin_lp_I(order, F0)
    return [2F0 * sinc(2F0 * n) for n in -order/2:order/2]
end
##

##
function firwin_hp_I(order, F0)
    return [kronecker(Int(n)) - 2F0 * sinc(2F0 * n) for n in -order/2:order/2]
end
##

##
function firwin_bp_I(order, F1, F2)
    return [2F2 * sinc(2F2 * n) - 2F1 * sinc(2F1 * n) for n in -order/2:order/2]
end
##

##
function firwin_bs_I(order, F1, F2)
    return [kronecker(Int(n)) - (2F2 * sinc(2F2 * n) - 2F1 * sinc(2F1 * n)) for n in -order/2:order/2]
end
##

##
function firwin_lp_II(N, F0)
    N = range(start=order / 2, stop=order / 2, length=order)
    return [2F0 * sinc(2F0 * n) for n in N]
end
##

##
function firwin_bp_II(N, F1, F2)
    N = range(start=order / 2, stop=order / 2, length=order)
    return [2F2 * sinc(2F2 * n) - 2F1 * sinc(2F1 * n) for n in N]
end
##

##
function firwin_diff(N::Int)
    missing
end
##

##
function resample(x::Vector, M::Int, N::Int)
    missing
end
##
end