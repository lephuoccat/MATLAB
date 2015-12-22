function [ result ] = checkstr( str1,str2 )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
if ~(ischar(str1)&ischar(str2))
    error('Input strings only!!!')
else
    string=strvcat(str1,str2);
    diff=(string(1,:)~=string(2,:));
    if sum(diff)==0
        result=0;
    else
        ival=find(diff);
        if string(1,ival(1))>string(2,ival(1))
            result=1;
        else
            result=-1;
        end
    end
end

