function coordlog = matchMove(input_string)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

structA1 = struct('move',{'A1'},'coordLog',logical([0,0,0;0,0,0;1,0,0]));
structA2 = struct('move',{'A2'},'coordLog',logical([0,0,0;1,0,0;0,0,0]));
structA3 = struct('move',{'A3'},'coordLog',logical([1,0,0;0,0,0;0,0,0]));
structB1 = struct('move',{'B1'},'coordLog',logical([0,0,0;0,0,0;0,1,0]));
structB2 = struct('move',{'B2'},'coordLog',logical([0,0,0;0,1,0;0,0,0]));
structB3 = struct('move',{'B3'},'coordLog',logical([0,1,0;0,0,0;0,0,0]));
structC1 = struct('move',{'C1'},'coordLog',logical([0,0,0;0,0,0;0,0,1]));
structC2 = struct('move',{'C2'},'coordLog',logical([0,0,0;0,0,1;0,0,0]));
structC3 = struct('move',{'C3'},'coordLog',logical([0,0,1;0,0,0;0,0,0]));

    if input_string == structA1.move
                coordlog = structA1.coordLog;
        
    elseif input_string == structA2.move
                coordlog = structA2.coordLog;

    elseif input_string == structA3.move
                coordlog = structA3.coordLog;

    elseif input_string == structB1.move
                coordlog = structB1.coordLog;

    elseif input_string == structB2.move
                coordlog = structB2.coordLog;

    elseif input_string == structB3.move
                coordlog = structB3.coordLog;

    elseif input_string == structC1.move
                coordlog = structC1.coordLog;

    elseif input_string == structC2.move
                coordlog = structC2.coordLog;

    else input_string == structC3.move
                coordlog = structC3.coordLog;
    end
    
end

