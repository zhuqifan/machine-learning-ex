load postaldata

te(1:100,1:256) = data(1002:1101,:);
te(101:200,1:256) = data(3601:3700,:);
te(201:300,1:256) = data(2501:2600,:);
mylabel(101:200,1) = 8;
mylabel(1:100,1) = 3;
mylabel(201:300) = 6
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

  te2(1:100,1:256) = data(1202:1301,:);
  te2(101:200,1:256) = data(3501:3600,:);
  te(201:300,1:256) = data(2501:2600,:);
  mylabel(101:200,1) = 8;
  mylabel(1:100,1) = 3;
  mylabel(201:300) = 6;

  correct = 0;
  lambda = 0;
  index = 1;
  while(index<17)
    lambda = 10^(index-6);
    x(index) = index-6;
    correct = 0;
    for(i=1:3)
      te2(1:100,1:256) = data((902+(i*100)):(1001+(i*100)),:);
      te2(101:200,1:256) = data((3401+(i*100)):(3500+(i*100)),:);
      [Y,w] = RegLS(lambda, te2, te, mylabel);
      for i = 1:200
        if Y(i,1)*mylabel(i,1)>0
          correct = correct+1;
        end
      end
      each_training_Accuracy(i) = correct/200
    end


    training_Accuracy(index) = mean(each_training_Accuracy);
    index=index+1;
  end

  for(i=1:16)
    err(i) = std(training_Accuracy);
  end

  errorbar(x, training_Accuracy, err)


  te2(1:100,1:256) = data(1202:1301,:);
  te2(101:200,1:256) = data(3501:3600,:);
    te2(201:300,1:256) = data(2501:2600,:);
  mylabel(101:200,1) = -1;
  mylabel(1:100,1) = 1;
  correct = 0;
  lambda = 10^8;
  [Y,w] = RegLS(lambda, te2, te, mylabel);

  for i = 1:200
    if Y(i,1)*mylabel(i,1)>0
      correct = correct+1;
    end
  end
    training_Accuracy = correct/200
    training_Accuracy
