function answerNikal(x, y)
%PLOTDATA Plots the data points x and y into a new figure 
%   PLOTDATA(x,y) plots the data points and gives the figure axes labels of
%   population and profit.

 % open a new figure window

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the training data into a figure using the 
%               "figure" and "plot" commands. Set the axes labels using
%               the "xlabel" and "ylabel" commands. Assume the 
%               population and revenue data have been passed in
%               as the x and y arguments of this function.
%
% Hint: You can use the 'rx' option with plot to have the markers
%       appear as red crosses. Furthermore, you can make the
%       markers larger by using plot(..., 'rx', 'MarkerSize', 10);
data1=csvread('test.csv');
X1=data1(:,10);
data=csvread('sample_submission.csv');
X =data(:,1);y=data(:,2);
for i=1:16282
if(X1(i) > 4000)
y(i)=1;
else
y(i)=0;
endif

endfor
prediction=[X11,y]
csvwrite('gg.csv',prediction);

end

