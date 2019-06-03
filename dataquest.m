data = csvread('train1.csv');
outdata = csvread('test1.csv');
X = data(:, [1,2,3,4,5,6,7,8,9,10,11,12,13]);
[m, n] = size(X);
X = [ones(m, 1) X];
X1 = outdata(:, [1,2,3,4,5,6,7,8,9,10,11,12,13]);
[m1, n1] = size(X1);
X1 = [ones(m1, 1) X1];
y = data(:, 14);

initial_theta = csvread('ggtheta.csv');
[cost, grad] = costFunction(initial_theta, X, y);
fprintf('Cost at initial theta (zeros): %f\n', cost);
fprintf('Gradient at initial theta (zeros): \n');
fprintf(' %f \n', grad);
 % Set options for fminunc
options = optimset('GradObj', 'on', 'MaxIter', 400);

%  Run fminunc to obtain the optimal theta
%  This function will return theta and the cost 
[theta, cost, exitFlag] = ...
	fminunc(@(t)(costFunction(t, X, y)), initial_theta, options);

% Print theta to screen
%fprintf('Cost at theta found by fminunc: %f\n', cost);
%fprintf('theta: \n');
%fprintf(' %f \n', theta);
%p = predict(theta, X);

%fprintf('Train Accuracy: %f\n', mean(double(p == y)) * 100);

y11 = predict(theta, X1);

X11 = outdata(:, 14);
prediction=[X11,y11];
csvwrite('gg.csv',prediction);
csvwrite('ggtheta.csv',theta);

