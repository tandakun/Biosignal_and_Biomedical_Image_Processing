function x = hilber(xin)
%  Function to generate the analytic function of xin
%  Assumes xr real
%  Takes the FT of Xin and zeros out second half
%   then take inverse FT
%
N = length(xin);
h = zeros(N,1);         % Define scaling array
h(1) = 1;               % Fill scaling array
if 2*fix(N/2)== N
    h(2:N/2) = 2;       % length xin is even
    h(N/2 + 1) = 2;
else 
    h(2:(N+1)/2) = 2;
end
XF = fft(xin);          % Take FT of input
XF_mod = XF .* h;       % Scale and set second half to zero
x = ifft(XF_mod);       % Take inverse FT of scaled and zeroed spectra