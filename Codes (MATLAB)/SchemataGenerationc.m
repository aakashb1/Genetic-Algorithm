
Sch=zeros(4,8,8);
alpha=0.03;
beta=0.95;
En=100; %Cardinal (E)
for z=1:En
    Assignment_Procedurer;
    for j=1:N
        for i=1:n(j)
            for k=1:M
                Sch(i,j,k)=Sch(i,j,k)+(S(i,j,k)/En);
            end
        end
    end
end
for j=1:N
    for i=1:n(j)
        for k=1:M
            if Sch(i,j,k)<alpha
                Sch(i,j,k)=0;
            elseif Sch(i,j,k)>alpha && Sch(i,j,k)<beta
                Sch(i,j,k)=10; %Instead of star
            else
                Sch(i,j,k)=1;
            end
        end
    end
end
dummy1=[];
for i=1:M
    O=Sch(:,:,i);
    V1=O(:);
    D1=cat(2,dummy1,V1);
    dummy1=D1;
end

for j=1:N
    for i=1:n(j)
        keg=0;
        if any(Sch(i,j,:)==1)
            keg=find(Sch(i,j,:)==1,1);
        else
            continue
        end
        for k=1:M
            if k~=keg
                Sch(i,j,k)=0;
            else
                continue
            end
        end
    end
end

Prc=P;
for j=1:N
    for i=1:n(j)
        for k=1:M
            if Sch(i,j,k)==0
                Prc(i,j,k)=999;
            elseif Sch(i,j,k)==1
                Prc(i,j,k)=-999;
            end
        end
    end
end

dummy2=[];
for i=1:M
    O=Sch(:,:,i);
    V1=O(:);
    D2=cat(2,dummy2,V1);
    dummy2=D2;
end

dummy3=[];
for i=1:M
    O=Prc(:,:,i);
    V1=O(:);
    D3=cat(2,dummy3,V1);
    dummy3=D3;
end