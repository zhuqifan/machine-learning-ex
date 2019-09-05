load postaldata
te(1:100,1:256) = data(1002:1101,:);
te(101:200,1:256) = data(3601:3700,:);
mylabel(101:200,1) = 8
mylabel(1:100,1) = 3
knearest(3, data(1000,:), te, mylabel)
