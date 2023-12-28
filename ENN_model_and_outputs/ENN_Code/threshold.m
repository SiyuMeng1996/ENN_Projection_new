function [ t ] = threshold( xcn )
    threshold=[0 1]; %输入的每个列的范围
    t=[];
    for i=1:xcn
        t=[t;threshold];
    end
end

