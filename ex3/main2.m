close all;
clear all;
fname = input('Enter a filename to load data for training/testing: ','s');
load(fname);

% Put your NB training function below
%[ "Parameter List" ] = NBTrain(AttributeSet, LabelSet); % NB training
% Put your NB test function below
%[predictLabel, accuracy] = NBTest( "Parameter List" , testAttributeSet, validLabel); % NB test

labelsum = [sum(LabelSet ==0) sum(LabelSet ==1)]


row = 1;
for features = 1:57
        count0 = 1;
        count1 = 1;
        sample0 = 0;
        sample1 = 0;

        for sample = 1:2400
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
for testsample = 1:2201
 p0if = sum(LabelSet ==0)/2201
 p1if = sum(LabelSet ==1)/2201
  for testfeature =  1:57
    p0if = p0if* 1/(traintable((testfeature-1)*2+2, 1) * sqrt(2*pi))*exp(-(testAttributeSet(testsample,testfeature)-traintable((testfeature-1)*2+1, 1))^2/(2*traintable((testfeature-1)*2+2, 1)^2))
    p1if = p1if* 1/(traintable((testfeature-1)*2+2, 2) * sqrt(2*pi))*exp(-(testAttributeSet(testsample,testfeature)-traintable((testfeature-1)*2+1, 2))^2/(2*traintable((testfeature-1)*2+2, 2)^2))

  end
  pif = [p0if p1if]
  maxpif = max(pif)
  if pif(validLabel(testsample)+1) == maxpif
    success  = success +1;
  end
end

accuracy = success/2201;


fprintf('********************************************** \n');
fprintf('Overall Accuracy on Dataset %s: %f \n', fname, accuracy);
fprintf('********************************************** \n');
