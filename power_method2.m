function[v d] = power_method2(A)
disp('Enter the matrix whose eigenvalue is to be found')
A = input('Enter the matrix: ') 
 [na , ma] = size(A)
  if na ~= ma 
   disp('Error :Matrix A should be square matrix')
   return
   endif
disp('suppose x is an eigenvector corresponding to largest eigenvalue')
r = input ('any guess for initial value of x?,(y/n): ');
switch r
  case 'y'
    x0 = input('plese enter initial guess for x: ')
    [nx,mx] = size (x0)
    if nx ~= na||mx ~= 1
      disp('ERROR:please check your input')
      return
    endif
      otherwise
    x0 = ones (na,1);
endswitch
t = input('Enter the error allowed in final answer: ')
tol = t*ones(na,1);
k=1
x(x0,1) = x0;
err = 1000000000*rand(na,1);
while sum(abs(err)>=tol)~=0
  x(x0,k+1)=A*x(x0,k);
  [v i] = max (abs(A*x(x0,k+1)));
  E = x(x0,k+1);
  e = E(i,1);
  x( x0,k+1) = x( x0,k)/e;
  err = x( x0,k+1)-x( x0,k);
  k = k+1;
endwhile
  fprintf('the largest eigenvalue obtained after %d iterations is %7.7f \n',k,e)
  disp('and the corresponding eigenvector is')
  x(x0,k)
endfunction