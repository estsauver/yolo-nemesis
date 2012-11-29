%genetic algorithm stuff as set-up by Prof. Ryder
%set up p = sqrt(x1^2+x2^2+...xf^2)
%where x1 = xv_data-xv_model
%minimize p

%collects data
global index;
Td=batchdata(:,1);
Fd=btchdata(:,2);
Yd=batchdata(:,3);
%pval=bounds;


%Batch data used to "tune" parameters

%Stage 1 analysis
bestsets=[];
for j=1:10;
    index j;
    popsize=100;
    fbounds=zeros(16,2);
    fbounds(:,1)=pval*0.5; fbounds(:,2)=pval*1.5;
    evalFN='p_find';
    %[fbest,endpop,bestpop,traceInfo]=ga(f_bounds,evalFN,initpop,[],MaxGenTerm,[]...
    bestsets=[bestsets];   
    
end