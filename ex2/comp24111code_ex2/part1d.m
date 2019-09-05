test1(1:100,1:256) = data(1102:1201,:);
test1(101:200,1:256) = data(3701:3800,:);
correct(1:200) = 0;
for i = 1:200
  for k = 1:200
    if knearest(k, test1(i,:),te,mylabel) == mylabel(i)
      correct(k)= correct(k)+1;
    end
  end
end
y1 = correct/k;
m1 = mean(y1)

test2(1:100,1:256) = data(1202:1301,:);
test2(101:200,1:256) = data(3801:3900,:);
correct(1:200) = 0;
for i = 1:200
  for k = 1:200
    if knearest(k, test2(i,:),te,mylabel) == mylabel(i)
      correct(k)= correct(k)+1;
    end
  end
end
y2 = correct/k;
m2 = mean(y2)

test3(1:100,1:256) = data(1002:1101,:);
test3(101:200,1:256) = data(3601:3700,:);
correct(1:200) = 0;
for i = 1:200
  for k = 1:200
    if knearest(k, test3(i,:),te,mylabel) == mylabel(i)
      correct(k)= correct(k)+1;
    end
  end
end
y3 = correct/k;
m3 = mean(y3)

x = [1 2 3];
y = [m1 m2 m3];
err=[std(y) std(y) std(y)];

errorbar(x,y,err)
