function [time,AL01,work]=makespan(Src,P,N,n,M)
K=[];
for j=1:N
    for i=1:n(j)
        K(i,j)=find(Src(i,j,:));
        if K(i,j)==0
            break
        end
        X(i,j)=P(i,j,K(i,j));
    end
end
%%sorting the E vector
X( X == 0 ) = NaN; 
k1=K;
for i=1:max(n)
    [~,Xsort]=sort(X(i,:));
    dum(i,:)=Xsort;
    dummy=k1(i,:);
    k1(i,:)=dummy(Xsort);
    X(i,:)=sort(X(i,:));
end
X( isnan( X ) ) = 0;
Dispo_Machine=zeros(1,M);
Dispo_Job=zeros(1,N);

for i=1:max(n)
    for j=1:N
        if k1(i,j)==0
            continue
        %elseif K(i,j)==0
            %continue
        end
        z=dum(i,j);
        t(i,z)=max(Dispo_Machine(K(i,z)),Dispo_Job(z));
        Dispo_Machine(K(i,z))=t(i,dum(i,j))+P(i,z,K(i,z));
        Dispo_Job(z)=t(i,dum(i,j))+P(i,z,K(i,z));
    end
end

dummy1=K';
dummy2=t';
for j=1:N
    for i=1:n(j)
        AL(i,j,1)=K(i,j);
        AL(i,j,2)=t(i,j);
        if K(i,j)==0
            continue
        end
        AL(i,j,3)=AL(i,j,2)+P(i,j,K(i,j));
    end
end

W=zeros(1,M);
for k=1:M
    for j=1:N
        for i=1:n(j)
            if AL(i,j,1)==k
            W(k)=W(k)+AL(i,j,3)-AL(i,j,2);  
            end
        end
    end
end
time=max(max(AL(:,:,3)));
AL01=AL;
work=sum(W);
end
