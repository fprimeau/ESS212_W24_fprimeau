%
% Matlab script to show how to compute and plot the Fibonacci numbers.
%

% (1) compute a sequence of Fibonacci numbers
N = 20; % sequence length
t = 1:N;
y = fib_seq(N);

% (2) Make a table with the sequence together with the ratio of successive terms
%     Demonstrate the use of the fib_term(n) function that computes the nth term using the closed form 
    fprintf('%6i %8i  %8s | %6i %8f  %8s \n',1,y(1),'NaN',1,fib_term(1),'NaN')
for i = 2:N
    fprintf('%6i %8i  %8f | %6i %8i  %8f \n',i,y(i), y(i)./y(i-1), i,fib_term(i),fib_term(i)./fib_term(i-1));
end

% (3) Make a figure showing the growth of the Fibonacci numbers using a stem plkot
figure(1)
stem(t, y, 'LineWidth', 2);
axis([ 0 N+1 0 y(end)])
set(gca, 'FontSize', 16)
xlabel('\it n');
ylabel('\it y[n]')
grid on
drawnow
exportgraphics(gca, 'fib1.png');

% (4) Make a figure of the log-transformed Fibonacci numbers
figure(2)
stem(t, log10(y), 'LineWidth', 2);
axis([ 0 N+1 0 log10(y(end))])
set(gca, 'FontSize', 16)
xlabel('\it n');
ylabel(['log_{10}','\it y[n]',')'])
grid on
exportgraphics(gca, 'fib2.png')


function y = fib_seq(N)
    % function to compute the Fibonacci sequence
    y = [1,1];  % initial conditions
    for i = 3:N
        y = [ y, y(end)+y(end-1) ];
    end
end

function y = fib_term(n)
    % this function computes the nth Fibonacci number using the closed form solution
    z1 = 0.5*(1+sqrt(5));
    z2 = 0.5*(1-sqrt(5));
    % round to nearest integer to correct for errors associated with floating point numbers
    y = round( (z1^n-z2^n)/sqrt(5) ); 
end
