%SchemataGenerationc;
Assignment_Procedurerc;
%SchedulingAlgorithmrc;
dummy=[];
for i=1:M
    O=P(:,:,i);
    V1=O(:);
    D=cat(2,dummy,V1);
    dummy=D;
end
%Sch_narrow = cat(1, Sch(:,1:4,:), Sch(:,5:end,:));
dummy1=[];
for i=1:M
    O=Src(:,:,i);
    V1=O(:);
    D1=cat(2,dummy1,V1);
    dummy1=D1;
end