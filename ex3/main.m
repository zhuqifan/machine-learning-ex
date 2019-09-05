close all;
clear all;
fname = input('Enter a filename to load data for training/testing: ','s');
load(fname);

% Put your NB training function below
%[ "Parameter List" ] = NBTrain(AttributeSet, LabelSet); % NB training
% Put your NB test function below
%[predictLabel, accuracy] = NBTest( "Parameter List" , testAttributeSet, validLabel); % NB test

labelsum = [sum(LabelSet ==0) sum(LabelSet ==1) sum(LabelSet ==2)]


row = 1;
count=0;
for label = 1:3
  for features = 1:57
    for feature_result = 1:7
        for sample = 1:2301
            if LabelSet(sample)==(label-1) && AttributeSet(sample,features)==(feature_result-1)
              count = count +1;
            end
        end
        if count ==0
         ifdelte(features)=1;
         end
        traintable(row,label) = count/labelsum(label);
        row = row+1;
        count = 0;
    end
  end
  row = 1;
end

for label = 1:3
  for features = 1:57
    if(ifdelte(features) == 1)
    for feature_result = 1:7
        for sample = 1:2301
            if LabelSet(sample)==(label-1) && AttributeSet(sample,features)==(feature_result-1)
              count = count +1;
            end
        end

        traintable(row,label) = (count+20/7)/(labelsum(label)+20);
        row = row+1;
        count = 0;
    end
    end
  end
  row = 1;
end









%test

success = 0
for testsample = 1:2300
 p0if = sum(LabelSet ==0)/2301
 p1if = sum(LabelSet ==1)/2301
 p2if = sum(LabelSet ==2)/2301
  for testfeature =  1:57
    p0if = p0if* traintable((testfeature-1)*7+1+testAttributeSet(testsample,testfeature),1)
    p1if = p1if* traintable((testfeature-1)*7+1+testAttributeSet(testsample,testfeature),2)
    p2if = p2if* traintable((testfeature-1)*7+1+testAttributeSet(testsample,testfeature),3)

  end
  pif = [p0if p1if p2if]
  maxpif = max(pif)
  if pif(validLabel(testsample)+1) == maxpif
    success  = success +1;
  end
end

accuracy = success/2300;


fprintf('********************************************** \n');
fprintf('Overall Accuracy on Dataset %s: %f \n', fname, accuracy);
fprintf('********************************************** \n');
