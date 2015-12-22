function gameover = winner(coord_log)
gameover = 0;
if coord_log(1,:) == [1 1 1]
        disp('You Won! Type 1')
        gameover = 1;
    elseif coord_log(2,:) == [1 1 1]
        disp('You Won! Type 1')
        gameover = 1;
    elseif  coord_log(3,:) == [1 1 1]
        disp('You Won! Type 1')
        gameover = 1;
    elseif coord_log(:,1) == [1 1 1]'
        disp('You Won! Type 2')
        gameover = 1;
    elseif coord_log(:,2) == [1 1 1]'
        disp('You Won! Type 2')
        gameover = 1;
    elseif coord_log(:,3) == [1 1 1]'
        disp('You Won! Type 2')
        gameover = 1;
    elseif [coord_log(1,1),coord_log(2,2),coord_log(3,3)] == [1 1 1]
        disp('You Won! TYPE 3')
        gameover = 1;
    elseif [coord_log(3,1),coord_log(2,2),coord_log(1,3)] == [1 1 1]
        disp('You Won! Type 4')
        gameover = 1;
end
end 
