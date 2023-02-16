function [NN] = ML_Detector_Mary(avSNR,K,M,PwrSC,y,h,jj,ref_sym,ref_symmm,indices_de)

sym_norm = ref_symmm; %normal symbol 
idx = indices_de(jj,:); %selected sub-carriers index
sym_m = zeros(1,K); %symbol in the receiver

for i=1:K
    n=idx(i);
    dis = zeros(1,M);
    for k=1:M
        dis(k)=abs(y(n,jj)-avSNR*sqrt(PwrSC).*h(n,jj).*sym_norm(k)).^2;
    end
    [~,I] = min(dis); %predict selected indicies in the receiver
    sym_m(i)=ref_sym(I); %symbol received via lookup table
end
NN=sym_m;

