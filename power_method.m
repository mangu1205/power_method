function[q d] = power_method(A)
% for finding the largest eigenvalue by power method
disp('Enter the matrix whose eigenvalue is to be found')
%calling matrix A
A = input('Enter the matrix: ') 
%check for matrix A
%it should be a square matrix
 [nr , ma] = size(A)
  if nr ~= ma 
   disp('Error :matrix A should be square matrix')
   return
   endif
   % initial guess for x..?
% default guess is [1,1,1,....,1]
disp('suppose x is an eigenvector corresponding to largest eigenvalue')
r = input ('any guess for initial value of x?,(y/n): ');
switch r
  case 'y'
    %askig for initial guess
    x0 = input('plese enter initial guess for x: ')
    % check for initial guess
    [nx,mx] = size (x0)
    if nx ~= nr||mx ~= 1
      disp('ERROR:please check your input')
      return
    endif
      otherwise
    x0 = ones (nr,1);
endswitch
% allowed error in final answer 
t = input ('Enter the error allowed in finrl answer: ')
tol = t*ones(nr,1);
% initialing k and x
k=1
x(x0,1) = x0;
% initial error assumption
err = 100*rand(nr,1);
% loop starts 
while sum(abs(err)>=tol)~=0
  x(x0,k+1)=A*x(x0,k);
  %POWER METHOD formula
  %normalizing the obtained vector
  [v i] = max(abs(A*x(x0,k+1)));
  E = x(x0,k+1);
  e = E(i,1);
  x( x0,k+1) = x( x0,k)/e;
  err = x( x0,k+1)-x( x0,k);
  % finding error
  k = k+1;
endwhile
 %display final result
  fprintf('the largest eigenvalue obtained after %d iterations is %7.7f \n',k,e)
  disp('and the corresponding eigenvector is')
  x( x0,k)
endfunction