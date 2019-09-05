test(1:100,1:256) = data(1102:1201,:);
test(101:200,1:256) = data(3701:3800,:);
correct(1:200) = 0;
for i = 1:200
  for k = 1:200
    if knearest(k, test(i,:),te,mylabel) == mylabel(i)
      correct(k)= correct(k)+1;
    end
  end
end
y = correct/k;
plot(1:200,y)
