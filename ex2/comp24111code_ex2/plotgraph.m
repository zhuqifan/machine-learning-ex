error=0;
accuracy = 0;
k = 1;
while(k < 200)
    if(knearest(k, data(1001:1500,:), te, mylabel) == 3)
        error = error +1;
    end
    if(knearest(k, data(3501:4000,:), te, mylabel) == 8)
        error = error +1;
    end
    accuracy = (1000-error)/1000;
    plot(k, accuracy);
    k = k+2;
end
