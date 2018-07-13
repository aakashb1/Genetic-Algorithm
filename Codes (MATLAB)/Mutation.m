function M=Mutation(S,P,N,n,M)
%Calculation of effective processing time for each job
for j=1:N
    dummyM=0; 
    for i=1:n(j)
        for k=1:M
            EPT(j)=dummyM+S(i,j,k)*P(i,j,k);
            dummyM=EPT(j);
        end
    end
end

[max1, j]=max(EPT);
i=1; r=0;
Sm=[];
Sm=S;
K=[];
while (i<=n(j) && r==0)
    K(i)=find(Sm(i,j,:));
    X(i,j)=P(i,j,K(i));
    for k=1:M
        if P(i,j,k)<P(i,j,K(i))
            Sm(i,j,K(i))=0;
            Sm(i,j,k)=1;
            r=1;
            break
        else
            continue
        end
    end
    i=i+1;
end
M=Sm;
end
