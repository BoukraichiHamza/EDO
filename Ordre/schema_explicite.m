function ynew = schema_explicite(A,B,C,phi,h,tactu,yactu)
s = size(B,1);
k = zeros(s,length(yactu));
for i = 1:s
    k(i,:) = phi(tactu + C(i)*h,yactu+h*(A(i,:)*k));
end
ynew = yactu + h*(B'*k);
end
