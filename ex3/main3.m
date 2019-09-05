close all;
clear all;
fname = input('Enter a filename to load data for training/testing: ','s');
load(fname);

% Put your NB training function below
%[ "Parameter List" ] = NBTrain(AttributeSet, LabelSet); % NB training
% Put your NB test function below
%[predictLabel, accuracy] = NBTest( "Parameter List" , testAttributeSet, validLabel); % NB test


for ten = 1:10
testAttributeSet = spambase((ten-1)*460+1:(ten-1)*460+1+460,1:57);
validLabel = spambase((ten-1)*460+1:(ten-1)*460+1+460,58);
tempspambase = spambase;
tempspambase((ten-1)*460+1:(ten-1)*460+1+460,:)=[]
AttributeSet = tempspambase(:,1:57);
LabelSet(:,1) = tempspambase(:,58);





labelsum = [sum(LabelSet ==0) sum(LabelSet ==1)]


row = 1;
for features = 1:57
        count0 = 1;
        count1 = 1;
        sample0 = 0;
        sample1 = 0;

        for sample = 1:4140
          if LabelSet(sample)==0
            sample0(count0) = AttributeSet(sample,features);
            count0 = count0+1;
          end
          if LabelSet(sample)==1
            sample1(count1) = AttributeSet(sample,features);
            count1 = count1+1;
          end
        end
        meanN = mean(sample0);
        sdN = std(sample0)
        meanY = mean(sample1);
        sdY = std(sample1)
        if meanN == 0
          meanN = 0.001;
        end
        if sdN == 0
          sdN = 0.001;
        end
        if meanY == 0
          meanY = 0.001;
        end
        if sdY == 0
          sdY = 0.001;
        end
        traintable(row,1) = meanN;
        traintable(row,2) = meanY;
        row = row+1;
        traintable(row,1) = sdN;
        traintable(row,2) = sdY;
        row = row+1;

end


%test

success = 0
for testsample = 1:461
 p0if = sum(LabelSet ==0)/461
 p1if = sum(LabelSet ==1)/461
  for testfeature =  1:57
    p0if = p0if* 1/(traintable((testfeature-1)*2+2, 1) * sqrt(2*pi))*exp(-(testAttributeSet(testsample,testfeature)-traintable((testfeature-1)*2+1, 1))^2/(2*traintable((testfeature-1)*2+2, 1)^2));
    p1if = p1if* 1/(traintable((testfeature-1)*2+2, 2) * sqrt(2*pi))*exp(-(testAttributeSet(testsample,testfeature)-traintable((testfeature-1)*2+1, 2))^2/(2*traintable((testfeature-1)*2+2, 2)^2));

  end
  pif = [p0if p1if]
  maxpif = max(pif)
  if pif(validLabel(testsample)+1) == maxpif
    success  = success +1;
  end
end

accuracy(ten) = success/461
end
acmean = mean(accuracy)
acstd = std(accuracy)

fprintf('********************************************** \n');
fprintf('Overall Accuracy on Dataset %s: %f \n', fname, accuracy);
fprintf('mean of accuracy is %f, std of accuracy is %f' ,acmean,acstd);
fprintf('********************************************** \n');
