function [vector,p1] = DSP_Price(vector,set,weight,partition)

for i = 1:1:set
vector(partition(i)) = vector(partition(i)) - weight*rand(1,1);
end
p1 = sort(partition);

end

