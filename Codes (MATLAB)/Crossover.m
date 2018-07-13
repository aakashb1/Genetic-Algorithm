function [Cross1,Cross2]=Crossover(S1,S2,N,n)
for j=1:N
    x(j)=randi([1,N],1);
    x1(j)=randi([x(j),N],1);
    for i=1:n(j)
        y1(i)=randi([1,n(j)],1);
        if x(j)==x1(j)
            y(i)=randi([1,y1(i)],1);
        else
            y(i)=randi([1,n(j)],1);
        end
        k=1;
        while k<=N 
            if k<=x1(j) && k>=x(j)
                l=1;
                while l<=n(j)
                    if (l<=y1(i) && l>=y(i)) || (n(x(j))<=n(j))
                        E1(l,k,:)=S1(l,k,:);
                        E2(l,k,:)=S2(l,k,:);
                    else
                        E1(l,k,:)=S2(l,k,:);
                        E2(l,k,:)=S1(l,k,:);
                    end
                    l=l+1;
                end
            else
                l=1;
                while l<=n(j)
                    if (l<=y1(i) && l>=y(i)) || (n(x(j))<=n(j))
                        E1(l,k,:)=S2(l,k,:);
                        E2(l,k,:)=S1(l,k,:);
                    else
                        E1(l,k,:)=S2(l,k,:);
                        E2(l,k,:)=S1(l,k,:);
                    end
                    l=l+1;
                end
            end
            k=k+1;
        end
    end
%Cross(2)=E2;
end
Cross1=E1;
Cross2=E2;
end