clear
p = 1/3;                                    % probability of getting 1 in Bernoulli Distribution
average_length = zeros(1,200);

for n = 1:200
    P = zeros(1,n+1);
    C = zeros(1,n+1);
    for i = 0:n
        P(i+1) = (1-p).^(n-i).*p.^i;        % probability of n+1 classes
        C(i+1) = nchoosek(n,i);             % number of string in each class
    end

    A = C;                                  % testing matrix
    length = zeros(1,n+1);                  % initial length of each class
    remain = 0;                             % remaining number of current bit to assign to  X
    bit = 1;                                % current bit

    for i = 1:n
        if A(i+1) == remain                 % if string in a class equals to remain
            length(i+1) = remain.*(bit-1);  % assign remain to those string in that class
            remain = 0;                     % remain is now 0
        
        elseif A(i+1) < remain              % if string in a class is less than remain
            length(i+1) = A(i+1).*(bit-1);  % assign A slots to those string in that class
            remain = remain - A(i+1);       % remain is now (remain - A)
        
        elseif A(i+1) > remain              % if string in a class is greater than remain
            X = A(i+1) - remain;            % assign those remain to equal number of string in that class
            length(i+1) = length(i+1) + remain.*(bit-1);
        
            % for the rest of the string in that class
            while X>0
                % the rest of the string equal to 2^(current bit)
                if X == 2^bit
                    length(i+1) = length(i+1) + X.*bit;
                    X = 0;
                    bit = bit + 1;
            
                % the rest of the string is less than 2^(current bit)
                elseif X < 2^bit
                    remain = 2^bit - X;
                    length(i+1) = length(i+1) + X.*bit;
                    X = 0;
                    bit = bit + 1;
                
                % the rest of the string is greater than 2^(current bit)
                elseif X > 2^bit
                    length(i+1) = length(i+1) + (2.^bit).*bit;
                    X = X - 2^bit;
                    bit = bit + 1;
                end
            
            end 
        end
    end

    average_length(n) = sum(P.*length)/n;

end

n = 1:1:200;
% entropy
entropy = p.*log2(1/p) + (1-p).*log2(1./(1-p));
upper_bound = entropy + 0*n;
lower_bound = (n*entropy - log2(n*entropy + 1) - log2(exp(1)))./n;

% Plot
plot(average_length)
hold on
plot(n,upper_bound)
hold on
plot(n,lower_bound)
title('Optimal Average Length ')
legend('Optimal Average Length','Upper Bound','Lower Bound')
xlabel('n')