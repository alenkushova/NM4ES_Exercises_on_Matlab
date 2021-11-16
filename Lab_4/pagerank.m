function [y] = pagerank(H,gamma,maxit,tol,v)
% pagerank: quick but computationally efficient implementation of a simplified version
% of the celebrated algorithm, see https://en.wikipedia.org/wiki/PageRank  
N=size(H,1);
d=sum(H,2);
dangling = (d==0);
% for i=1:N
%     if H(i,:)==zeros(1,N)
%         H(i,:)=ones(1,N);
%     end
% end
dhat=d+N*dangling;

% v=1/N*ones(N,1); % this is the "a-priori importance" vector
                   % activate if v is removed from the inputs
                   
y=rand(N,1);     % this is the "initial guess" vector, for the power method
y=y/sum(y);      % normalization w.r.t the 1-norm
err=tol+1; i=0;       % just to enter the while loop
while  i < maxit && err>tol
    y_new=(gamma*((y./dhat)'*H + ((y./dhat)'*dangling)*ones(1,N)) + (1-gamma)* (y'*ones(N,1))*v')';
    err = norm(y_new-y,1); % norm(y,1)=1, no need of normalization 
    y=y_new;
    i=i+1;
end
end
