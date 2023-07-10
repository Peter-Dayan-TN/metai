function mi=midp(d)
dc=0.00001;
conf=0.5:dc:(1-dc);
xs=(1/d)*log(conf./(1-conf));
ps=normpdf(xs,d/2,1).*ent(conf);
psp=normpdf(xs,-d/2,1).*ent(conf);
ind=1:(length(xs)-1);
mi = ent(normcdf(0,d/2,1));
mi= mi - sum(diff(xs).*(ps(2:end)+ps(1:(end-1)))/2);
mi= mi - sum(diff(xs).*(psp(2:end)+psp(1:(end-1)))/2);