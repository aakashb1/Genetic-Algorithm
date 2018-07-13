function is=shuffle(is)
N=length(is);
for n=N:-1:2
    in=ceil(rand*(n-1)); 
    tmp=is(in);
    is(in)=is(n);
    is(n)=tmp;
end