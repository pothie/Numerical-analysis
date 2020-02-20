%4.4-1
%% a
paper_figure()
x = rand(1,10000);
Y = [];
for i= 1:2:10000
    temp = max(x(i),x(i+1));
    Y = [Y,temp];
end
histogram(Y,"Normalization","pdf");
xlabel('Larger of two uniform random number between [0,1)')
ylabel('Frequency')
title('Part(a)')

%% b
Y = [];
for i= 1:3:9999
    temp = sort([x(i) x(i+1) x(i+2)]);
    Y = [Y,temp(3)];
end
histogram(Y,"Normalization","pdf");
xlabel('Largest of three uniform random number between [0,1)')
ylabel('Frequency')
title('Part(b)')

%% c
Y = [];
for i= 1:3:9999
    temp = sort([x(i) x(i+1) x(i+2)]);
    Y = [Y,temp(2)];
end
histogram(Y,"Normalization","pdf");
xlabel('Middle of three uniform random numbers between [0,1)')
ylabel('Frequency')
title('Part(c)')

%% d
Y = [];
x = 2.*rand(1,10000)-1;
y = randn(1,10000);
for i= 1:10000
    temp = x(i)+y(i);
    Y = [Y,temp];
end
histogram(Y,"Normalization","pdf");
xlabel('Sum of a random number between [-1,1] and a Gaussian random number with mean 0 and standard deviation 1')
ylabel('Frequency')
title('Part(d)')

