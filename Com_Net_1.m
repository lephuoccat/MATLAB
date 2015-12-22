load    = [0.001:0.01:1];
LN = length(load);
    
p1 = zeros(1,LN);
p2 = zeros(1,LN);
p3 = zeros(1,LN);
p4 = zeros(1,LN);
    
for i = 1:length(load)
    p1(i) = MMcc(25, load(i));
    p2(i) = MM1c(25, load(i)); 
    p3(i) = MMcc(50, load(i));
    p4(i) = MM1c(50, load(i));
end
    
figure
semilogy(load,p1); hold on;
semilogy(load,p2); hold on;
semilogy(load,p3); hold on;
semilogy(load,p4); grid on
legend('M/M/25/25', 'M/M/1/25', 'M/M/50/50', 'M/M/1/50');
xlabel('Normalized Load');
ylabel('Blocking Probability');
