te(1:100,1:256) = data(1002:1101,:);
te(101:200,1:256) = data(3601:3700,:);

row_idx = randperm(200,100)
Train_Idx = logical(zeros(size(te,1),1));
Train_Idx(row_idx) = true;
Test_Idx = ~Train_Idx;
Train_Data = te(Train_Idx,:)
Test_Data = te(Test_Idx,:)
mylabel = mylabel(Test_Idx,:)

correct = 0;
lambda = 0;
index = 1;
while(index<17)
  lambda = 10^(index-6);
  correct = 0;
  x(index) = index-6;

    [Y,w] = RegLS(lambda, Test_Data, Train_Data, mylabel);
    for i = 1:100
      if Y(i,1)*mylabel(i,1)>0
        correct = correct+1;
      end


  end

  training_Acuracy(index) = correct/200;


  index=index+1;
end

for(i=1:16)
  err(i) = std(training_Accuracy);
end

errorbar(x, training_Accuracy, err)
