%hw2_1
n = 1e3;
p = [1 2 4 Inf];
paper_figure();
for j = 1:5 % 5 matrices
    if j == 1
        A = [2 0;0 3];
    elseif j == 2
        A = [2 1;1 3];
    elseif j == 3
        A = [2 5;1 3];
    elseif j == 4
        A = [3 3;0 3];
    elseif j == 5
        A = [3 0;0 0];
    end
    
    for i = 1:4 % different norms 
        theta = 2*pi*rand(1,n);
        x = cos(theta)';
        y = sin(theta)';
        dp = [x y];
        output = zeros(n,2);
        
        for m = 1:n
            %normalize the vector
            if p(i) == 4
                un = sum(dp(m,:).^4)^(1/4);
            else
                un = norm(dp(m,:),p(i));
            end
            up = dp(m,:)./un; 
            output(m,:) = A*up';
        end
        
        subplot(5,4,i+(j-1)*4)
        plot(output(:,1),output(:,2),'b.')
        title(['Matrix ' num2str(j) ', ' num2str(p(i)) '-norm'])
        axis equal
        hold on
    end
    
end
hold off
