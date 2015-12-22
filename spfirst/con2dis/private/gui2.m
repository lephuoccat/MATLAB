function fig = gui()
% This is the machine-generated representation of a Handle Graphics object
% and its children.  Note that handle values may change when these objects
% are re-created. This may cause problems with any callbacks written to
% depend on the value of the handle at the time the object was saved.
% This problem is solved by saving the output as a FIG-file.
%
% To reopen this object, just type the name of the M-file at the MATLAB
% prompt. The M-file and its associated MAT-file must be on your path.
% 
% NOTE: certain newer features in MATLAB may not have been saved in this
% M-file due to limitations of this format, which has been superseded by
% FIG-files.  Figures which have been annotated using the plot editor tools
% are incompatible with the M-file/MAT-file format, and should be saved as
% FIG-files.

load gui

h0 = figure('Units','normalized', ...
	'Color',[0.8 0.8 0.8], ...
	'Colormap',mat0, ...
	'CreateFcn','con2dis SetFigSize', ...
	'DoubleBuffer','on', ...
	'PaperPosition',[18 180 576 432], ...
	'PaperUnits','points', ...
	'Position',[0.446875 0.1337890625 0.55 0.80078125], ...
	'RendererMode','manual', ...
	'ResizeFcn','con2dis ResizeFcn', ...
	'Tag','Fig1');
h1 = uimenu('Parent',h0, ...
	'Label','&Plot Options', ...
	'Tag','&Plot Options1');
h2 = uimenu('Parent',h1, ...
	'Callback','con2dis SetLineWidth', ...
	'Label','Set Line Width...', ...
	'Tag','setlinewidth');
h2 = uimenu('Parent',h1, ...
	'Callback','con2dis PlotsMenu ', ...
	'Label','Show All Plots', ...
	'Tag','&ShowAllPlots');
h2 = uimenu('Parent',h1, ...
	'Callback','con2dis ShowW', ...
	'Label','Show Radian Frequency', ...
	'Tag','ShowRadFreq');
h2 = uimenu('Parent',h1, ...
	'Callback','con2dis ShowW_hat', ...
	'Label','Show Discrete Radian Frequency', ...
	'Tag','ShowDiscreteRadFreq');
h2 = uimenu('Parent',h1, ...
	'Callback','con2dis showLF', ...
	'Label','Show Lower Freq. Signal', ...
	'Tag','&ShowLF');
h2 = uimenu('Parent',h1, ...
	'Callback','con2dis FontResize', ...
	'Label','Set Font Size . . .', ...
	'Tag','&FontSize', ...
	'Visible','off');
h1 = uimenu('Parent',h0, ...
	'Callback','close ', ...
	'Label','&Exit', ...
	'Tag','Exit');
h1 = uicontrol('Parent',h0, ...
	'Units','normalized', ...
	'BackgroundColor',[0.752941176470588 0.752941176470588 0.752941176470588], ...
	'Callback','con2dis Slider2', ...
	'ListboxTop',0, ...
	'Max',40, ...
	'Position',[0.6879432624113475 0.04234527687296417 0.1595744680851064 0.04071661237785017], ...
	'SliderStep',[0.05 0.1], ...
	'String','11', ...
	'Style','slider', ...
	'Tag','Slider2', ...
	'Value',20);
h1 = uicontrol('Parent',h0, ...
	'Units','normalized', ...
	'BackgroundColor',[1 1 1], ...
	'Callback','con2dis Editbox2', ...
	'ListboxTop',0, ...
	'Position',[0.8581560283687943 0.04234527687296415 0.08156028368794326 0.04071661237785017], ...
	'String','20', ...
	'Style','edit', ...
	'Tag','EditText2');
h1 = uicontrol('Parent',h0, ...
	'Units','normalized', ...
	'BackgroundColor',[1 1 1], ...
	'Callback','con2dis Editbox1', ...
	'FontSize',9, ...
	'ListboxTop',0, ...
	'Position',[0.2529550827423168 0.04234527687296415 0.08156028368794326 0.04071661237785017], ...
	'String','8', ...
	'Style','edit', ...
	'Tag','EditText1');
h1 = axes('Parent',h0, ...
	'Box','on', ...
	'CameraUpVector',[0 1 0], ...
	'CameraUpVectorMode','manual', ...
	'Color',[1 1 1], ...
	'ColorOrder',mat1, ...
	'Position',[0.07624113475177305 0.2263843648208469 0.398936170212766 0.2996742671009772], ...
	'Tag','Axis4', ...
	'XColor',[0 0 0], ...
	'YColor',[0 0 0], ...
	'ZColor',[0 0 0]);
h2 = text('Parent',h1, ...
	'Color',[0 0 0], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','center', ...
	'Position',mat2, ...
	'Tag','Axes1Text4', ...
	'VerticalAlignment','cap');
set(get(h2,'Parent'),'XLabel',h2);
h2 = text('Parent',h1, ...
	'Color',[0 0 0], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','center', ...
	'Position',[-0.125 0.4959016393442624 9.160254037844386], ...
	'Rotation',90, ...
	'Tag','Axes1Text3', ...
	'VerticalAlignment','baseline');
set(get(h2,'Parent'),'YLabel',h2);
h2 = text('Parent',h1, ...
	'Color',[0 0 0], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','right', ...
	'Position',[-0.1964285714285714 2.59016393442623 9.160254037844386], ...
	'Tag','Axes1Text2', ...
	'Visible','off');
set(get(h2,'Parent'),'ZLabel',h2);
h2 = text('Parent',h1, ...
	'Color',[0 0 0], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','center', ...
	'Position',mat3, ...
	'Tag','Axes1Text1', ...
	'VerticalAlignment','bottom');
set(get(h2,'Parent'),'Title',h2);
h1 = axes('Parent',h0, ...
	'Box','on', ...
	'CameraUpVector',[0 1 0], ...
	'CameraUpVectorMode','manual', ...
	'Color',[1 1 1], ...
	'ColorOrder',mat4, ...
	'Position',[0.5460992907801419 0.2263843648208469 0.400709219858156 0.2996742671009772], ...
	'Tag','Axis3', ...
	'XColor',[0 0 0], ...
	'YColor',[0 0 0], ...
	'ZColor',[0 0 0]);
h2 = text('Parent',h1, ...
	'Color',[0 0 0], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','center', ...
	'Position',mat5, ...
	'Tag','Axes2Text4', ...
	'VerticalAlignment','cap');
set(get(h2,'Parent'),'XLabel',h2);
h2 = text('Parent',h1, ...
	'Color',[0 0 0], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','center', ...
	'Position',mat6, ...
	'Rotation',90, ...
	'Tag','Axes2Text3', ...
	'VerticalAlignment','baseline');
set(get(h2,'Parent'),'YLabel',h2);
h2 = text('Parent',h1, ...
	'Color',[0 0 0], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','right', ...
	'Position',mat7, ...
	'Tag','Axes2Text2', ...
	'Visible','off');
set(get(h2,'Parent'),'ZLabel',h2);
h2 = text('Parent',h1, ...
	'Color',[0 0 0], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','center', ...
	'Position',mat8, ...
	'Tag','Axes2Text1', ...
	'VerticalAlignment','bottom');
set(get(h2,'Parent'),'Title',h2);
h1 = axes('Parent',h0, ...
	'Box','on', ...
	'ButtonDownFcn','con2dis showLF', ...
	'CameraUpVector',[0 1 0], ...
	'CameraUpVectorMode','manual', ...
	'Color',[1 1 1], ...
	'ColorOrder',mat9, ...
	'Position',[0.5432758562737388 0.6327160493827155 0.3996840442338073 0.2993827160493826], ...
	'Tag','Axis2', ...
	'XColor',[0 0 0], ...
	'YColor',[0 0 0], ...
	'ZColor',[0 0 0]);
h2 = text('Parent',h1, ...
	'Color',[0 0 0], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','center', ...
	'Position',mat10, ...
	'Tag','Axes3Text4', ...
	'VerticalAlignment','cap');
set(get(h2,'Parent'),'XLabel',h2);
h2 = text('Parent',h1, ...
	'Color',[0 0 0], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','center', ...
	'Position',[-0.1245551601423487 0.4959016393442622 9.160254037844386], ...
	'Rotation',90, ...
	'Tag','Axes3Text3', ...
	'VerticalAlignment','baseline');
set(get(h2,'Parent'),'YLabel',h2);
h2 = text('Parent',h1, ...
	'Color',[0 0 0], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','right', ...
	'Position',[-1.362989323843416 1.225409836065574 9.160254037844386], ...
	'Tag','Axes3Text2', ...
	'Visible','off');
set(get(h2,'Parent'),'ZLabel',h2);
h2 = text('Parent',h1, ...
	'Color',[0 0 0], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','center', ...
	'Position',mat11, ...
	'Tag','Axes3Text1', ...
	'VerticalAlignment','bottom');
set(get(h2,'Parent'),'Title',h2);
h1 = axes('Parent',h0, ...
	'Box','on', ...
	'CameraUpVector',[0 1 0], ...
	'CameraUpVectorMode','manual', ...
	'Color',[1 1 1], ...
	'ColorOrder',mat12, ...
	'Position',[0.07266982622432859 0.6327160493827155 0.3996840442338073 0.2993827160493826], ...
	'Tag','Axis1', ...
	'XColor',[0 0 0], ...
	'YColor',[0 0 0], ...
	'ZColor',[0 0 0]);
h2 = text('Parent',h1, ...
	'ButtonDownFcn','ctlpanel SelectMoveResize', ...
	'Color',[0 0 0], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','center', ...
	'Interruptible','off', ...
	'Position',mat13, ...
	'Tag','Axes1Text12', ...
	'VerticalAlignment','cap');
set(get(h2,'Parent'),'XLabel',h2);
h2 = text('Parent',h1, ...
	'ButtonDownFcn','ctlpanel SelectMoveResize', ...
	'Color',[0 0 0], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','center', ...
	'Interruptible','off', ...
	'Position',mat14, ...
	'Rotation',90, ...
	'Tag','Axes1Text11', ...
	'VerticalAlignment','baseline');
set(get(h2,'Parent'),'YLabel',h2);
h2 = text('Parent',h1, ...
	'ButtonDownFcn','ctlpanel SelectMoveResize', ...
	'Color',[0 0 0], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','right', ...
	'Interruptible','off', ...
	'Position',[-0.1850533807829181 1.225409836065574 9.160254037844386], ...
	'Tag','Axes1Text10', ...
	'Visible','off');
set(get(h2,'Parent'),'ZLabel',h2);
h2 = text('Parent',h1, ...
	'ButtonDownFcn','ctlpanel SelectMoveResize', ...
	'Color',[0 0 0], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','center', ...
	'Interruptible','off', ...
	'Position',mat15, ...
	'Tag','Axes1Text9', ...
	'VerticalAlignment','bottom');
set(get(h2,'Parent'),'Title',h2);
h1 = uicontrol('Parent',h0, ...
	'Units','normalized', ...
	'BackgroundColor',[0.752941176470588 0.752941176470588 0.752941176470588], ...
	'Callback','con2dis Slider1', ...
	'ListboxTop',0, ...
	'Position',[0.08156028368794326 0.04234527687296415 0.1595744680851064 0.04071661237785017], ...
	'Style','slider', ...
	'Tag','Slider1');
h1 = uicontrol('Parent',h0, ...
	'Units','normalized', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','con2dis Button1', ...
	'ListboxTop',0, ...
	'Position',[0.5536277602523659 0.5606936416184971 0.03154574132492113 0.02023121387283237], ...
	'Style','radiobutton', ...
	'Tag','Radiobutton1');
h1 = uicontrol('Parent',h0, ...
	'Units','normalized', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','con2dis Button2', ...
	'ListboxTop',0, ...
	'Position',[0.0443262411347518 0.148208469055375 0.0301418439716312 0.0260586319218241], ...
	'Style','radiobutton', ...
	'Tag','Radiobutton2');
h1 = uicontrol('Parent',h0, ...
	'Units','normalized', ...
	'BackgroundColor',[0.8 0.8 0.8], ...
	'Callback','con2dis Button22', ...
	'ListboxTop',0, ...
	'Position',[0.525 0.148208469055375 0.0301418439716312 0.0260586319218241], ...
	'Style','radiobutton', ...
	'Tag','Radiobutton22');
h1 = axes('Parent',h0, ...
	'CameraUpVector',[0 1 0], ...
	'CameraUpVectorMode','manual', ...
	'Color',[1 1 1], ...
	'ColorOrder',mat16, ...
	'Position',[0.07801418439716312 0.04234527687296415 0.05319148936170213 0.03745928338762215], ...
	'Tag','AxisRef', ...
	'Visible','off', ...
	'XColor',[0 0 0], ...
	'YColor',[0 0 0], ...
	'ZColor',[0 0 0]);
h2 = text('Parent',h1, ...
	'Color',[0 0 0], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','center', ...
	'Position',[0.4722222222222223 -0.9655172413793096 9.160254037844386], ...
	'Tag','Axes1Text8', ...
	'VerticalAlignment','cap', ...
	'Visible','off');
set(get(h2,'Parent'),'XLabel',h2);
h2 = text('Parent',h1, ...
	'Color',[0 0 0], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','center', ...
	'Position',[-0.9722222222222221 0.448275862068968 9.160254037844386], ...
	'Rotation',90, ...
	'Tag','Axes1Text7', ...
	'VerticalAlignment','baseline', ...
	'Visible','off');
set(get(h2,'Parent'),'YLabel',h2);
h2 = text('Parent',h1, ...
	'Color',[0 0 0], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','right', ...
	'Position',mat17, ...
	'Tag','Axes1Text6', ...
	'Visible','off');
set(get(h2,'Parent'),'ZLabel',h2);
h2 = text('Parent',h1, ...
	'Color',[0 0 0], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','center', ...
	'Position',[0.482758620689655 1.31818181818182 9.160254037844386], ...
	'Tag','Axes1Text5', ...
	'VerticalAlignment','bottom', ...
	'Visible','off');
set(get(h2,'Parent'),'Title',h2);
h1 = uicontrol('Parent',h0, ...
	'Units','normalized', ...
	'BackgroundColor',[0.752941176470588 0.752941176470588 0.752941176470588], ...
	'ListboxTop',0, ...
	'Position',[0.076 0.148208 0.0851063829787234 0.0256093451645514], ...
	'String','Rad/sec ', ...
	'Style','text', ...
	'Tag','TextRButton2');
h1 = uicontrol('Parent',h0, ...
	'Units','normalized', ...
	'BackgroundColor',[0.752941176470588 0.752941176470588 0.752941176470588], ...
	'ListboxTop',0, ...
	'Position',[0.55 0.148208 0.0851063829787234 0.0256093451645514], ...
	'String','Radian ', ...
	'Style','text', ...
	'Tag','TextRButton22');
h1 = uicontrol('Parent',h0, ...
	'Units','normalized', ...
	'BackgroundColor',[1 1 1], ...
	'Callback','con2dis Editbox3', ...
	'FontSize',10, ...
	'ListboxTop',0, ...
	'Position',[0.4751773049645389 0.04234527687296415 0.08156028368794326 0.03908794788273615], ...
	'Style','edit', ...
	'Tag','EditText3');
if nargout > 0, fig = h0; end
