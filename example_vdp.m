function dkdt = example_vdp(t,k)
% Van der Pol oscillator in two dimensions

mu = 5; % constant

x = k(1); % for readability
y = k(2); % for readability

dkdt = [y;
    mu*(1-x^2)*y-x];