function [ nextTrans ] = randWalk( trans, i, j, walkNum, uBound, dBound, lBound, rBound )
%randWalk Performs a random walk from a starting location until
%   a boundary is reached
%   Performs a random walk from a starting location until
%   a boundary is reached at which point it applies the value of
%   the boundary to the approx matrix at every point it passed along its
%   walk as well as appending to the 2nd page of that matrix the number of
%   steps before completion
    %disp('In Walk');
    dims = size(trans);
    numRows = dims(1);
    numCols = dims(2);
    %fprintf('numRows: %d\n', numRows);
    %fprintf('numCols: %d\n', numCols);
    %Adjacency matrix for visited nodes
    visited = zeros(numRows, numCols);
    %Mark the current starting node
    visited(i, j) = 1;
    %reward for hitting a boundary
    reward = 0;
    
    walked = false;
    %disp('starting walk...');
    while (~walked)
        %disp('commencing walk');
        %random walk direction
        dir = floor(rand * 4);
        %state machine that takes a step
        switch(dir)
            case 0 %move down
                %disp('case 0');
                i = i - 1; 
            case 1 %move up
                %disp('case 1');
                i = i + 1;
            case 2 %move right
                %disp('case 2');
                j = j - 1;
            case 3 %move left
                %disp('case 3');
                j = j + 1; 
        end
        %fprintf('i: %d\t', i); %fprintf('j: %d\n', j);
        %check to see if we've hit a boundary (we can only hit one at a
        %time because we only can only step in the 4 cardinal directions
        if (i < 1)%downward boundary
            reward = dBound;
            %set walked true and continue
            walked = true;
            continue;
        end
        if (i > numRows)%upward boundary
            reward = uBound;
            %set walked true
            walked = true;
        end
        if (j < 1)%right boundary
            reward = rBound;
            %set walked true 
            walked = true;
        end
        if (j > numCols)%left boundary
            reward = lBound;
            %set walked true
            walked = true;
        end
        if (walked)%finished walking
            %disp('Finished Walking!');
            continue;%continue and end walking logic
        end
        
        %we are still within boundaries, add node to visited
        visited(i, j) = 1;  
    end

    %we are finished walking now apply reward to every visited node in our adjacency matrix (once) 
    for i = 1 : numRows
        for j = 1 : numCols
            if (visited(i, j) == 1 && trans(i, j, 2) < walkNum)
                
                %apply reward
                trans(i, j, 1) =  trans(i, j, 1) + reward;
                %add this walk in the sum of walks for the node
                trans(i, j, 2) =  trans(i, j, 2) + 1;
            end
        end
    end
    %set and return the new transition
    nextTrans = trans;
end

