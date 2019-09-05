te2(1:100,1:256) = data(1202:1301,:);
te2(101:200,1:256) = data(3501:3600,:);
mylabel(101:200,1) = -1;
mylabel(1:100,1) = 1;
correct = 0;
lambda = 0;
[Y,w] = RegLS(lambda, te2, te, mylabel);

for i = 1:200
  if Y(i,1)*mylabel(i,1)>0
    correct = correct+1;
  end
end
  training_Accuracy = correct/200
  training_Accuracy
