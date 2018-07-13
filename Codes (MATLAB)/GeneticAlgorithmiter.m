clc; clear all 
Ng=100;
Pm=0.12; 
Pc=0.88;
Zmax=100;
final=0;
%Initialize the population
for n1=1:Ng
    Assignment_Procedurerc;
    x0(:,:,:,n1)=Src(:,:,:);
end
%Evaluation
for n1=1:Ng
    [fX(n1),AL01,W1]=makespan(x0(:,:,:,n1),P,N,n,M);
    AL0(:,:,:,n1)=AL01(:,:,:);
end
%Crossover
Z=1;
while Z<=Zmax
    is=shuffle([1:Ng]);
    counterp=0;
    for n1=1:2:Ng-1
        if rand<Pc
            counterp=counterp+1;
            S1=x0(:,:,:,n1);
            S2=x0(:,:,:,n1+1);
            [x0(:,:,:,n1),x0(:,:,:,n1+1)]=Crossover(S1,S2,N,n);
            [fXx1c(n1,Z),AL0x1c(:,:,:,n1),W2c(n1,Z)]=makespan(x0(:,:,:,n1),P,N,n,M);
            [fXx1c(n1+1,Z),AL0x1c(:,:,:,n1),W2c(n1+1,Z)]=makespan(x0(:,:,:,n1+1),P,N,n,M);
        end
    end
    %Mutation
    counterm=0;
    L=numel(x0(1,1,1,:));
    for n1=1:L
        if rand(1,1)<Pm
            counterm=counterm+1;
            C3=x0(:,:,:,n1);
            x0(:,:,:,n1)=Mutation(C3,P,N,n,M);
            [fXx1m(n1,Z),AL0x1m(:,:,:,n1),W2m(n1,Z)]=makespan(x0(:,:,:,n1),P,N,n,M);
        end
    end
    %Scheduling and Evaluation
    for n1=1:L
        [fXx1(n1,Z),AL0x1(:,:,:,n1),W2(n1,Z)]=makespan(x0(:,:,:,n1),P,N,n,M);
        %[fXx2(n1,Z),AL0x2(:,:,:,n1)]=makespan(Cx2(:,:,:,n1),P,N,n,M);
    end
    fXx1( fXx1 == 0 ) = inf; 
    %fXx2( fXx2 == 0 ) = inf; 
    if any(fXx1(:,Z)==15)
        loc=find(fXx1(:,Z)==15);
        workload=W2(loc,Z)
        break
    else
        Z=Z+1;
    end
end
obj=max(-fXx1(:))
obj1=max(-fXx1c(:))
obj2=max(-fXx1m(:))
find((fXx1c)==15,1)
