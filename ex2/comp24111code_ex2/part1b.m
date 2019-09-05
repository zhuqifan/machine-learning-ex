
correct(1:200) = 0;
for i = 1:200
  for k = 1:200
    if knearest(k, te(i,:),te,mylabel) == mylabel(i)
      correct(k)= correct(k)+1;
    end
  end
end
y = correct/k;
plot(1:200,y)
