function [X,Y] = generate_ROC(labels,statistics,threshold)
N = length(statistics);
label_1 = sum(labels);
label_0 = N - label_1;
lambda = sort(statistics);

% Choose the threshold criteria
if threshold == "all"
    fprintf("Case (1): all\t\t");
    T = [-Inf; lambda; Inf];
    
elseif threshold == "linear"
    fprintf("Case (2): linear\t");
    min = lambda(1);
    max = lambda(N);
    T = [-Inf, linspace(min,max,99), Inf];
    
elseif threshold == "sample"
    fprintf("Case (3): sample\t");
    n = floor(N/99);
    T = [-Inf; lambda(1:n:(99*n),1); Inf];
    
else
    lambda_h0 = zeros(label_0,1);
    index = 1;
    for i = 1:1:N
        if labels(i) == 0
            lambda_h0(index) = statistics(i);
            index = index + 1;
        end
    end
    
    if threshold == "H0"
        T = [-Inf; sort(lambda_h0); Inf];
        fprintf("Case (4): H0\t\t");
        
    elseif threshold == "interval"
        h0_sorted = sort(lambda_h0);
        n = floor(label_0*0.01);
        T = [h0_sorted(1:n:label_0); Inf];
        fprintf("Case (5): interval\t");
    end
end
fprintf("length of threshold: %d\n", length(T));

% Calculate prob of detection (Y) and
% prob of false alarm (X)
X = zeros(length(T),1);
Y = zeros(length(T),1);
for i = 1:1:length(T)
    count_d = 0;
    count_f = 0;
    for j = 1:1:N
        if statistics(j) >= T(i)
            if labels(j) == 1
                count_d = count_d + 1;
            else
                count_f = count_f + 1;
            end
        end
    end
    X(i) = count_f/label_0;
    Y(i) = count_d/label_1;
end    
end

