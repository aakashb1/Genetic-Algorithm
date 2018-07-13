data;
%interchanging a random row with another random row
nr=[1 2 3 4 5 6 7 8];
posr1 = randi(length(nr)); %First row to be interchanged
positionr1 = nr(posr1);

posr2 = randi(length(nr)); %Second row to be interchanged
positionr2 = nr(posr2);

r1=positionr1; %select the rows to be interchanged
r2=positionr2; %select the rows to be interchanged
P1=P;
C=P1(:,r1,:);
P1(:,r1,:)=P1(:,r2,:);
P1(:,r2,:)=C;
P=P1;

S=zeros(size(P));
N=8;

%Interchanging
n=[3,4,3,3,4,3,3,4];
d=n(r1);
n(r1)=n(r2);
n(r2)=d;

nj=8;
M=8;
M1=[1 2 3 4 5 6 7 8];
for j=1:N
    for i=1:n(j)
        min=inf;
        pos = randi(length(M1));
        position = M1(pos);
        for k=position:M
            if P1(i,j,k)<min
                min=P1(i,j,k);
                position=k;
            end
        end
        for k=1:position-1
            if P1(i,j,k)<min
                min=P1(i,j,k);
                position=k;
            end
        end
        S(i,j,position)=1;
        for I=(i+1):n(j)
            check1=P1(I,j,position);
            P1(I,j,position)=P1(I,j,position)+P(i,j,position);
            check2=P1(I,j,position);
        end
        for J=(j+1):N
            for I=1:n(J)
                check3=P1(I,j,position);
                P1(I,J,position)=P1(I,J,position)+P(i,j,position);
                check4=P1(I,j,position);
            end
        end
    end
end

%interchanging elements of P1 (D matrix after operation)
CD1=P1(:,r2,:);
P1(:,r2,:)=P1(:,r1,:);
P1(:,r1,:)=CD1;
%interchanging elements of S (After assignment procedure)
CS=S(:,r2,:);
S(:,r2,:)=S(:,r1,:);
S(:,r1,:)=CS;
%interchanging elements of D (Original matrix)
CD=P(:,r2,:);
P(:,r2,:)=P(:,r1,:);
P(:,r1,:)=CD;
%Interchanging
d=n(r1);
n(r1)=n(r2);
n(r2)=d;

