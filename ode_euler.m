function output = ode_euler(odefun,tSeq,x0,dim)
% This function is used to solve ordinary differential equations with
% Euler method. The following parameters should be passed:
% 1:ode function, 2:time sequence, 3:initial conditions, 4:dimensions of ode
% ode function can be created in the same way for ode45 and related solvers
% time sequence should be given with time difference, such as t = 0:0.1:1
% number of initial conditions should be same as the dimensions of ode function
% dimensions should be same as the number of output elements in ode function
% By Kağan Başkan

% Check how many parameters are passed into this function
if nargin ~= 4
    error('ode_euler: Not enough input parameters. Four parameters needed to be passed:\n%s',...
        '1:ode function, 2:time sequence, 3:initial conditions, 4:dimensions of ode');
end

% Check if number of elements in initial condition is same as dim
if numel(x0) ~= dim
    error('Number of elements in x0 is not equal to dimensions of array.');
end

x = zeros(numel(tSeq),dim); % Creating the solution matrix
x(1,:) = x0; % Assign initial values
for i = 2:numel(tSeq)
    for j = 1:dim
        dt = tSeq(i) - tSeq(i-1); % Time difference between steps
        xPrev = odefun(tSeq(i-1),x(i-1,:)); % Result of odefun in previous step
        x(i,j) = x(i-1,j) + dt*xPrev(j,1); % Euler method implementation
    end
end

output = x;
end
        
