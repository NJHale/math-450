%Solution Space for Approximation of Laplacian
a = 7; b = 9;
uBound = 12;%Upward Bound
dBound = 0;%Downward Bound
lBound = 0;%Left Bound
rBound = 0;%Right Bound
%Approximate Solution to Laplace's Eq
disc = 100;%Discretization parameter
numWalks = 50;%initial number of walks
%laplaceApprox = zeros(disc, disc);
%attempt increasing walk numbers until norm is similar

%for numWalks = 1 : 300
%    laplaceApprox = approxLaplacian(disc, disc, numWalks, 12, 0, 0, 0);
%    fprintf('Norm_2 at %d walks: %d\n', numWalks, norm(laplaceApprox, 2));  
%end
laplaceApprox = approxLaplacian(disc, disc, numWalks, 12, 0, 0, 0);

%generate the linspace for our x-axis
x = linspace(0, a, disc);
%generate the linspace for our y-axis
y = linspace(0, b, disc);

disp(laplaceApprox);

contourf(x, y, laplaceApprox);
surf(x, y, laplaceApprox);