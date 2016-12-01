mat = [197 37 38;1 158 1; 1 20 142];
imagesc(mat) 
%colormap(flipud(gray));
colorbar 

textStrings = num2str(mat(:),'%0.2f');  %# Create strings from the matrix values
textStrings = strtrim(cellstr(textStrings));  %# Remove any space padding

idx = find(strcmp(textStrings(:), '0.00'));
textStrings(idx) = {'   '};

[x,y] = meshgrid(1:3);

hStrings = text(x(:),y(:),textStrings(:),'HorizontalAlignment','center');
midValue = mean(get(gca,'CLim'));
textColors = repmat(mat(:) > midValue,1,3);
set(hStrings,{'Color'},num2cell(textColors,2));
set(gca,'XTick',1:3,...                       
        'XTickLabel',{'Traffic Light','Stop Sign','Background'},...  
        'YTick',1:3,...
        'YTickLabel',{'Traffic Light','Stop Sign','Background'},...
        'TickLength',[0 0]);
title('Confusion Matrix');
%labels = {'Traffic Light';'Stop Sign';'Background'};
%disp(labels)
%HeatMap(conf_mat,'Traffic Light',1,'Traffic',1);
%plotconfusion(conf_mat)