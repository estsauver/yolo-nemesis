function [ output ] = initConstants( vargin )
%Returns a standard list of the initial conditions 
%   Detailed explanation goes here
if nargin > 0
    Cs0 = vargin{1};
    V0 = vargin{2};
    Ce0 = vargin{3};
    X0 = vargin{4};
    Co0 = vargin{5};
    Cc0 = vargin{6};
    
else
    % defaults
    Cs0 = 1.2;
    V0 = 50000;
    Ce0 = 0;
    Co0 = 0;
    Cc0 = 0;
    X0 = 0.15;
end

output = [Cs0, V0, Ce0, X0, Co0,Cc0];

end

