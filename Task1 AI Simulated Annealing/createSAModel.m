function SA = createSAModel()
%% Make SA Model 
% return these param

% requirement of the model (variable, limits, and function)
SA.req.variables = {'x', 'y'};
SA.req.limits = {[-10; 10], [-10; 10]};
SA.req.function = @(x,y)((4 - (2.1*(x.^2)) + (x.^4)/3) * (x.^2)) + (x*y) + ((-4+(4*(y.^2))) * (y.^2));

% settings of the model
SA.set.coolingRate = 0.999; % cooling rate is the dumping temperature (for the decreases of temp)
SA.set.maxAcceptTemp = 1; % maximum number iterations on same temperature with accept condition  
SA.set.maxFailedTemp = 1; % maximum number iteration on same temperature with failed condition
SA.set.stopTemp = 1; % condition of end iteration

% initial start of the model
SA.start.temperature = 5000;
SA.start.position = [0, 0];

[x, y] = meshgrid(-10:0.25:10);
surf(x,y, SA.req.function(x,y), 'FaceColor', 'interp', 'EdgeColor','none');

end