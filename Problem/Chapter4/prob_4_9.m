%%  9
fs = 2000;
rp = 3 ; 
rs = 10;
fc = 200;
fc_s = fc*(rp/rs)^(6/40);
wp = fc*2/fs;
ws = fc_s *2/fs;
[n,wn] = buttord(wp,ws,rp,rs);
n