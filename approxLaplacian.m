
function [ approx ] = approxLaplacian(discX, discY, walkNum, uBound, dBound, lBound, rBound)
%approxLaplacian Approximates a potential map for the given Laplacian boundary
%   value problem problem using montecarlo method
%   Finds an approximation potential map for the given Laplacian boundary
%   value problem problem discretized over the x-axis from 0 to width, and 
%   over the y-axis from 0 to length using random walkers (montecarlo). 
    
    %create an nx x ny x 2 matrix to store the approximation
    % approx(:, :, 1) being the sum of the walks
    % approx(:, :, 2) being the number of current walks from that location
    trans = zeros(discY, discX, 2);
    %disp('Here')
    %starting in the bottom left
    for i = 1 : discY
        %for each row
        for j = 1 : discX
            %for each col
            %walk 10 times from each discretized location
            while (trans(i, j, 2) < walkNum)
                trans = randWalk(trans, i, j, walkNum, uBound, dBound, lBound, rBound);
            end
        end
    end
    
    %consider the approximation completed and divide the transition by the
    %number of walks
    %disp(trans(:, :, 2));
    approx = trans(:, :, 1) ./ trans(:, :, 2);

end

