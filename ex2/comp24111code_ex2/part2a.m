load postaldata

te(1:100,1:256) = data(1002:1101,:);
te(101:200,1:256) = data(3601:3700,:);
mylabel(101:200,1) = -1;
mylabel(1:100,1) = 1;
correct = 0;
lambda = 0;
[Y,w] = RegLS(lambda, te, te, mylabel);

for i = 1:200
  if Y(i,1)*mylabel(i,1)>0
    correct = correct+1;
  end
end
  training_Accuracy = correct/200
  training_Accuracy
