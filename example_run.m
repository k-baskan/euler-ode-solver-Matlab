% This code is an example of how to use ode_euler function to solve Van der
% Pol equation. For comparison, ode45 is used and results of it are given
% in figure(2) with the Euler method solution in figure(1).

clc; clear; close all;

tSeq = 0:0.001:50; % time sequence
x0 = [1; 2]; % initial conditions

% Euler solver, Four parameters needed to be passed:
% 1:ode function, 2:time sequence, 3:initial conditions, 4:dimensions of ode
% Gives the solution of Van der Pol equation defined in example_vdp.m
x = ode_euler(@example_vdp,tSeq,x0,2); 

% Solution with Matlab's ode45 solver
[t,y] = ode45(@example_vdp,[0 50],x0);

figure(1)
plot(tSeq,x)
title('Solutions with ode_euler', 'Interpreter', 'none');
xlabel('t');
ylabel('Solutions: x_1 , x_2');
legend('x_1','x_2')

figure(2)
plot(t,y)
title('Solutions with ode45');
xlabel('t');
ylabel('Solutions: x_1 , x_2');
legend('x_1','x_2')
