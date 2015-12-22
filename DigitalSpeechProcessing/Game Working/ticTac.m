% SET UP THE BOARD rough start
% 400x400 is a good size
% bkgrnd = ones(400,400);
% rows first
clc
clear
close all
whtsq = ones(100,100);
blsq = .5*ones(100,100);
row1 = [whtsq, blsq, whtsq];
row2 = [blsq, whtsq,blsq];
row3 = [whtsq, blsq, whtsq];
bkgrnd = [ row1;row2;row3];

imshow(bkgrnd)
figHand = gcf; % figure handle to alter figure
bdHand = gca; % axis handle to pass to functions
set(figHand,'resize','off')
set(figHand,'toolbar','none')
set(figHand,'menubar','none')
set(figHand,'position',[ 327 105 694 584])
set(figHand,'name','Tic-Tac-Toe')
text(-40,50,'3','fontsize',20)
text(-40,150,'2','fontsize',20)
text(-40,250,'1','fontsize',20)
text(40,325,'A','fontsize',20)
text(140,325,'B','fontsize',20)
text(240,325,'C','fontsize',20)
title('Tic-Tac-Toe','FontSize',20)

% foo = get(bdHand,'ylabel');
hold on

% using pixel coordinates so y is positive down
% piece location is (25+50*x),(25+50*y) n from 0:7
% generate all positions in a big list:
X = zeros(3);
Y = zeros(3);
Y(1,:) = 50;
Y(2,:) = 150;
Y(3,:) = 250;
X(:,1) = 50;
X(:,2) = 150;
X(:,3) = 250;


% OLog = false(3);
% XLog = false(3);

% MasterMoveList = {'A1';'A2';'A3';'B1';'B2';'B3';'C1';'C2';'C3'};
structA1 = struct('move',{'A1'},'coordLog',logical([0,0,0;0,0,0;1,0,0]));
structA2 = struct('move',{'A2'},'coordLog',logical([0,0,0;1,0,0;0,0,0]));
structA3 = struct('move',{'A3'},'coordLog',logical([1,0,0;0,0,0;0,0,0]));
structB1 = struct('move',{'B1'},'coordLog',logical([0,0,0;0,0,0;0,1,0]));
structB2 = struct('move',{'B2'},'coordLog',logical([0,0,0;0,1,0;0,0,0]));
structB3 = struct('move',{'B3'},'coordLog',logical([0,1,0;0,0,0;0,0,0]));
structC1 = struct('move',{'C1'},'coordLog',logical([0,0,0;0,0,0;0,0,1]));
structC2 = struct('move',{'C2'},'coordLog',logical([0,0,0;0,0,1;0,0,0]));
structC3 = struct('move',{'C3'},'coordLog',logical([0,0,1;0,0,0;0,0,0]));
% MasterCoordMat = [3,1;2,1;1,1;3,2;2,2;1,2;3,3;2,3;1,3];
% gameMoveList = MasterMoveList;
% gameCoordMat = MasterCoordMat;
% inputCoordMat = [];
% inputMoveList = {};

% put a piece like this
%putPiece(bdHand,X,Y,structC3.coordLog,'o')

% setup new game parameters
% isGameOver = 0;
% isXturn = 1;
% moveCounter = 0;




% 
% if 0
% while ~isempty(gameMoveList)
% 
% nextMoveInd = 0; % index of the next move
% nextMoveLog = false(length(gameMoveList),1);
% nextMoveInd = gameInputValid(gameMoveList)
% 
% nextMoveInd
% nextMoveLog(nextMoveInd) = true(1);
% % inputMoveList = {inputMoveList; inputMoveList(nextMoveLog)}
% gameMoveList = gameMoveList(~nextMoveLog)
% % inputCoordMat
% gameCoordMat = gameCoordMat(~nextMoveLog,:)
% 
% end
% end


% game start:
% Set a player number
player_one = 1;
player_two = 2;
% Set a round counter
turn_counter = 1;

% Initialize the game logic board as all 0's
game_coordLog1 = false(3);
game_coordLog2 = false(3);
game_coordLogMaster = false(3); 
% Tie condition
coordLog = true(3);

% GAME LOOP STARTING
% Calls twice for the two inputs
while turn_counter < 10
    % Player 1's turn is on the odd turn
    
    if mod(turn_counter,2) ~= 0
        
        
         fprintf('Player 1: Prepare to speak your column LETTER\n')
         pause
%         prompt = 'Letter? ';
%         letter_position = input(prompt,'s');
        letter_position = VoiceInput1()
        fprintf('Player 1: Prepare to speak your row NUMBER\n')
        pause
%         prompt = 'Number? ';
%         number_position = input(prompt,'s');
        number_position = VoiceInput2()

        % COMPARE THE STRING WITH All POSSIBLE STRUCTS
        move_input = strcat(letter_position, number_position);
        placement = matchMove(move_input);
        % Place Symbol on board
        putPiece(bdHand,X,Y,placement,'x')

        % Update overall board logic
        game_coordLog1 = update_coord(game_coordLog1, move_input);
        game_coordLogMaster = update_coord(game_coordLogMaster, move_input);

        % Check if board game is over
        isgameover = winner(game_coordLog1);
        if isgameover == 1
            break
        end 
        
        fprintf('Press any key to continue\n')
        pause
   
    % Player 2
    else
        fprintf('Player 2: Prepare to speak your column LETTER\n')
        pause
%         prompt = 'Letter? ';
%         letter_position = input(prompt,'s');
        letter_position = VoiceInput1()
        fprintf('Player 2: Prepare to speak your row NUMBER\n')
        pause
%         prompt = 'Number? ';
%         number_position = input(prompt,'s');
        
        number_position = VoiceInput2()
        move_input = strcat(letter_position, number_position);
        placement = matchMove(move_input);

        % Place Symbol on board
        putPiece(bdHand,X,Y,placement,'o')

        % Update overall board logic
        game_coordLog2 = update_coord(game_coordLog2, move_input);
        game_coordLogMaster = update_coord(game_coordLogMaster, move_input);

        % Check if board game is over
       isgameover = winner(game_coordLog2);
       if isgameover == 1
         break
       end 
       fprintf('Press any key to continue\n')
       pause
       
    end
    
    turn_counter = turn_counter + 1;
    
    % Check if game is a tie
    if (game_coordLogMaster == coordLog)
        disp('Game is a TIE, Let us Play again')
    end
 end
   

        
% define board then save it as a fig that gets recalled instead of screwin
% around and programatically doing it everytime!!!!!!!!!!!!





shg
