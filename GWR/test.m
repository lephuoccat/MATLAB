function [nodes,edges] = gwr(datafile,weightfile,outfile,do_plot)
% The Grow When Required Network
% Stephen Marsland, 2000 - 2003
% stephen.marsland@man.ac.uk
% Inputs:   
%   datafile - specified data - no_of_datapoints by no_of_dimensions (blank or '' causes a file dialog to appear)
%   weightfile - weightfile to load from (blank means none, '' causes a file dialog to appear)
%   outfile - file to save the network (blank or '' means that one is
%   generated automatically)
%   do_plot - 1: plot (2D) figures, 0: don't
% Parameters to be set (specified in the code):
%   max_epochs, insert_threshold, epsilon_b, epsilon_n, tau_b, tau_n, hab_threshold,
%   MAX_NODES, MAX_EDGES, MAX_NEIGHBOURS, MAX_AGE
%   The learning rule (lines 84,91) and node position rule (line 368) -
%   comment out the one you don't want to use
% The figure plotting only plots the first 2 dimensions. I should fix this, I
% know. 

% If a datafile isn't specified, get one
if ((nargin<1) | (strcmp('',datafile)))      
    [datafile, pathname] = uigetfile('*.*');
    if(isnumeric(datafile))
        return;
    end
datafile = [pathname,datafile];
end
data = load(datafile);
ninputs = size(data,2);

if(nargin<2)
	[nodes,edges] = initialise_network(ninputs,data);
    weightfile = ''; outfile = ''; do_plot = 1;
elseif (strcmp(weightfile,''))
        % Get the user to choose a file
        [filename, pathname] = uigetfile('*.*');
        if(isnumeric(filename))
            return;
        end
        filename = [pathname,filename];
        [nodes,edges] = load_weights(filename);
        do_plot = 1;
elseif (nargin<3)
    outfile = ''; do_plot = 1;
    [nodes,edges] = load_weights(weightfile);
else
	[nodes,edges] = load_weights(weightfile);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% These need setting for your problem
max_epochs = 100;
hab_threshold = 0.1;
insertion_threshold = 0.7;
epsilon_b = 0.1;
epsilon_n = 0.01;
tau_b = 0.3;
tau_n = 0.1;
MAX_NODES = 300;
MAX_EDGES = 3*MAX_NODES;
MAX_NEIGHBOURS = 10;
MAX_AGE = 100;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

epochs = 0;

% Main loop
while (epochs < max_epochs)
	epochs = epochs + 1;
    disp(['Epoch ',num2str(epochs)]);
	% Get the next input
	for iterations=1:size(data,1)
        input = (data(iterations,:))';

		% Find the two best-matching nodes
		[nodes,best,second] = find_winners(input,nodes);
        % Add an edge between the nodes
		[nodes,edges] = add_edge(nodes,edges,best,second,MAX_EDGES,MAX_NEIGHBOURS);

		% Add a node if required
		if ((nodes(best).habn < hab_threshold) & (nodes(best).distance < insertion_threshold))
			[nodes,edges] = insert_node(nodes,edges,best,second,input,MAX_NODES,MAX_EDGES,MAX_NEIGHBOURS);
		else
			% Train the best node already there - two choices of training rule
			%nodes(best).weights = nodes(best).weights + epsilon_b * nodes(best).habn * (input-nodes(best).weights);
            nodes(best).weights = nodes(best).weights + epsilon_b * (input-nodes(best).weights);
			nodes(best).habn = nodes(best).habn + habituate(nodes(best).habn,tau_b);
		
            % Train the neighbours
			for i=1:size(nodes(best).neighbour,2)
				n = nodes(best).neighbour(i);				
                %nodes(n).weights = nodes(n).weights + epsilon_n * nodes(n).habn * (input-nodes(n).weights);
				nodes(n).weights = nodes(n).weights + epsilon_n * (input-nodes(n).weights);
				nodes(n).habn = nodes(n).habn + habituate(nodes(n).habn,tau_n);
			end
	
            % Age the edges
			[nodes,edges] = age_edges(nodes,edges,best,MAX_AGE);
		end

	end
    % Show a figure of the data and network every 20 epochs
    if ((mod(epochs,20) == 0) & (do_plot))
        plot_fig = figure;
        plot_network(nodes,edges,data,plot_fig,epochs);
    end
    
	% Delete a node without neighbours
    i=1;
    while ((i<=size(nodes,2)) & (size(nodes(i).neighbour,2)>0))
        i = i+1;
    end
    
    if (i<=size(nodes,2))
        [nodes,edges] = delete_node(nodes,edges,i);
    end
end

% Display the final network
if (do_plot)
    plot_fig = figure;
    plot_network(nodes,edges,data,plot_fig,epochs);
end

% Save the network
save_weights(nodes,edges,outfile,weightfile,datafile);

%%% Local Functions %%%

function plot_network(nodes,edges,data,plot_fig,epochs)
% Plot a figure showing the network and the data (2D)

figure(plot_fig), hold on, plot(data(:,1),data(:,2),'ro');
for i=1:size(nodes,2)
    figure(plot_fig), hold on, plot(nodes(i).weights(1),nodes(i).weights(2),'k+');
end

% Draw the edges in
for i=1:size(edges,2)
	a1(1) = nodes(edges(i).from).weights(1);
	a2(1) = nodes(edges(i).from).weights(2);
	a1(2) = nodes(edges(i).to).weights(1);
	a2(2) = nodes(edges(i).to).weights(2);
	line(a1,a2);
end

% Give information about the network
f1 = sprintf('%d epochs',epochs);
a = text(5.0,6.5,f1,'FontSize',16);
f1 = sprintf('%d nodes',size(nodes,2));
a = text(5.0,5.5,f1,'FontSize',16);
f1 = sprintf('%d edges',size(edges,2));
a = text(5.0,4.5,f1,'FontSize',16);

%%%%%%
function [nodes,edges] = initialise_network(ninputs,data)
% If there is no weightfile to load, initialise 2 nodes 
% to randomly match 2 members of the dataset
nnodes = 2;
for i=1:nnodes
	nodes(i).habn = 1;
	nodes(i).distance = 0;
	nodes(i).old = 0;
  	nodes(i).neighbour=[];
    index = round(rand(1)*size(data,1));
	nodes(i).weights = data(index,1:ninputs)';	
end

% Make the edges struct empty
edges = struct([]);

%%%%%%%%
function [nodes,edges] = load_weights(weightfile)
% Load in a previously saved network

dummy = load(weightfile,'-mat');
nodes = dummy.nodes;
edges = dummy.edges;
clear dummy;

%%%%%%%%
function [savefile] = save_weights(nodes,edges,outfile,weightfile,datafile)
% Save the network, different cases depending whether a name was specified

if (strcmp(outfile,''))
    % Generate a filename
    if (strcmp(weightfile,''))
        for i=1:length(datafile)
            if (strcmp('.',datafile(i)))
                savefile = datafile(1:i-1);
            end
        end
        savefile = sprintf('%s_1.net',savefile);
    else    
        % This should find a number before (the first) dot and increment it, or stick
        % a 1 in. It only works up to 9.
        savefile = weightfile;
        for i=1:length(savefile) 
            if (strcmp('.',savefile(i)))
                if(~isletter(savefile(i-1))) 
                    savefile(i-1) = savefile(i-1) + 1; 
                else
                    for j=length(savefile):i
                        savefile(j+1) = savefile(j);
                        savefile(i) = 1;
                    end
                end
            end
        end
    end
else
    savefile = outfile;
end
    
save(savefile,'nodes','edges','-mat');
    
disp('File written to ');
disp(savefile);

%%%%%%%%
function [nodes,best,second] = find_winners(input,nodes)
% Compute the 2 winning nodes

for i=1:size(nodes,2)
	nodes(i).distance = exp(-sum((nodes(i).weights - input).^2));
end

[dummy,index] = sort([nodes.distance]);
best = index(size(nodes,2));
second = index(size(nodes,2)-1);

%%%%%%%%
function [edge] = find_edge(edges,from,to)
% Check whether an edge exists between 2 nodes, return its number of -1 if
% it does not exist

if(~isempty(edges))
    where = find((([edges.from] == from) & ([edges.to] == to))|(([edges.from] == to) & ([edges.to] == from)));
else
    where = [];
end
if (isempty(where))
	edge = -1;	
else
    if (size(where,2)>1)
    	edge = where(1);
    else
        edge = where;
    end
end

%%%%%%%
function [nodes,edges] = add_edge(nodes,edges,from,to,MAX_EDGES,MAX_NEIGHBOURS)
% Add an edge between 2 nodes, or set its age to 0 if it already exists

edge = find_edge(edges,from,to);
if (edge > -1)
	% Edge exists - set age to 0;
	edges(edge).age = 0;
else
	% Add an edge if you can
	if (size(edges,2) < MAX_EDGES)
		nedges = size(edges,2) + 1;
		edges(nedges).from = from; 
		edges(nedges).to = to;
		edges(nedges).age = 0; 
		nodes = add_neighbours(nodes,to,from,MAX_NEIGHBOURS);
        %disp(['Added Edge ',num2str(size(edges,2))]);
    else
        disp('Max Number of Edges Reached');
	end
end

%%%%%%%%%
function [nodes,edges] = delete_edge(nodes,edges,from,to)
% Delete an edge 
% 1st case: edge number specified
% 2nd case: two nodes specified

if (nargin < 4)
    % Note that from is actually an edge here
	[nodes] = delete_neighbour(nodes,edges(from).from,edges(from).to);
	[nodes] = delete_neighbour(nodes,edges(from).to,edges(from).from);        
    nedges = size(edges,2);
	edges(from) = edges(nedges);
	edges = edges(:,1:nedges-1);
else
	edge = find_edge(edges,from,to);
	if (edge > -1)
		[nodes] = delete_neighbour(nodes,edges(edge).from,edges(edge).to);
		[nodes] = delete_neighbour(nodes,edges(edge).to,edges(edge).from);
	
		% Fill in the gap by moving the last edge
        nedges = size(edges,2);
		edges(edge) = edges(nedges);	
		edges = edges(:,1:nedges-1);
	end        
%disp('Deleted Edge');
end

%%%%%%%%
function [nodes] = add_neighbours(nodes,to,from,MAX_NEIGHBOURS)
% Make 2 nodes neighbours of each other

% Add neighbours both ways round
if (size(nodes(to).neighbour,2) < MAX_NEIGHBOURS)
	nodes(to).neighbour(size(nodes(to).neighbour,2)+1) = from;
end

if (size(nodes(from).neighbour,2) < MAX_NEIGHBOURS)
	nodes(from).neighbour(size(nodes(from).neighbour,2)+1) = to;
end

%%%%%%%%
function [nodes] = delete_neighbour(nodes,n1,n2)
% Delete a node from the neighbours list

where = [];
where = find([nodes(n1).neighbour]==n2);
if (~isempty(where))
	nodes(n1).neighbour(where) = nodes(n1).neighbour(size(nodes(n1).neighbour,2));
	nodes(n1).neighbour = nodes(n1).neighbour(:,1:size(nodes(n1).neighbour,2)-1);
end

%%%%%%
function [nodes,edges] = delete_node(nodes,edges,n)
% Delete a node. Nodes are only deleted if they don't have any neighbours

nnodes = size(nodes,2);
nodes(n) = nodes(nnodes);
nodes = nodes(1,1:nnodes-1); 

% Replace occurrences of node(n) in the neighbours list
for i=1:size(nodes,2)
    where = [];
    where = find(nodes(i).neighbour == nnodes);
    % Loop over size of where to replace all occurrences
    if (~isempty(where))
        for j=1:size(where,2)
            nodes(i).neighbour(where(j)) = n;
        end
    end
end

where = [];
where = find([edges.from] == nnodes);
if(~isempty(where))
    for i=1:size(where,2)
        edges(where(i)).from = n;
    end
end
    
where = [];
where = find([edges.to] == nnodes);
if(~isempty(where))
    for i=1:size(where,2)
        edges(where(i)).to = n;
    end
end

%%%%%%%%
function [nodes,edges] = insert_node(nodes,edges,n1,n2,inputs,MAX_NODES,MAX_EDGES,MAX_NEIGHBOURS)
% Insert a new node

if (size(nodes,2) < MAX_NODES)
	nnodes = size(nodes,2) + 1;
	nodes(nnodes).habn = 1;
	nodes(nnodes).distance = 0;
	nodes(nnodes).old = 0;
	%nodes(nnodes).weights = (nodes(n1).weights + inputs)/2;
    nodes(nnodes).weights = nodes(n1).weights - ((nodes(n1).weights - inputs)/2);
	[nodes,edges] = add_edge(nodes,edges,n1,nnodes,MAX_EDGES,MAX_NEIGHBOURS);
	[nodes,edges] = add_edge(nodes,edges,n2,nnodes,MAX_EDGES,MAX_NEIGHBOURS);
	[nodes,edges] = delete_edge(nodes,edges,n1,n2);
    disp(['Added node ',num2str(size(nodes,2))]);
else
    disp('Maximum Number of Nodes Reached')
end

%%%%%%%
function [nodes,edges] = age_edges(nodes,edges,best,MAX_AGE)
% Age all edges with an end at the best node

where = [];
where = find(([edges.from] == best) | ([edges.to] == best));
if (~isempty(where))
    for i=1:size(where,2)
        edges(where(i)).age = edges(where(i)).age + 1;
    end
end

% Delete any edges that are too old
where = find([edges.age]>MAX_AGE);

%disp(['No of edges to delete ',num2str(size(where,2))]);
for i=1:size(where,2)
	[nodes,edges] = delete_edge(nodes,edges,where(i));
end

%%%%%%%
function [hab] = habituate(hab,tau)
% Habituate a node

hab = tau * 1.05 * (1 - hab) - tau;
