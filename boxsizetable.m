function boxsizetable
%BOXSIZETABLE Demonstrate tabular output with fprintf
%             labels and sizes for shipping containers
clear
label = char('small','medium','large','jumbo');
width = [5;5;10;15];
height = [5;8;15;25];
depth = [15;15;20;35];
vol = width.*height.*depth/10000; %volume in cubic meters
fprintf('\n                Sizes of boxes\n\n');
fprintf('size         width    height    depth     volume\n');
fprintf('              (cm)     (cm)      (cm)      (m^3)\n');
for i=1:length(width)
    fprintf('%-8s %8d %8d %8d    %9.5f\n',...
        label(i,:),width(i),height(i),depth(i),vol(i))

end

