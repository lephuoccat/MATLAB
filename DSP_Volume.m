function [ vector,time ] = DSP_Volume(vector,wieght_volume,set,partition)

for i = 1:1:set
vector(partition(i)) = vector(partition(i)) + (wieght_volume/set)*rand(1,1);
end
time = sort(partition);
end

