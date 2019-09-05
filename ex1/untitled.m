demos
f = factorial(15)
 A = [16 3 2 13; 5 10 11 8; 9 6 7 12; 4 15 14 1]
B = eye(4)
sum(A(:,3))
W(1:4,1) = A(1:4,1)
W(1:4,2) = A(1:4,3)
sum(diag(A))
sum(A)
sum(A')'
A*B
A.*B
sum(sum(A>10))
plot(log(1:100))
for i= 1:4
for j = 1:4
B(i,j) = 1/A(i,j);
end;
end;
B
sum(1./A)'
