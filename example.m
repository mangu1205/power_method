function x = example(x)
  y=1;
  n=0;

  %r = input ('any guess for initial value of x?,(y/n) "s": ')
 r="y";
  switch r
   case 'y'
    %askig for initial guess
    x0 = input('plese enter initial guess for x: ')
    % check for initial guess
    [nx,mx] = size (x0)
    if nx ~= 2||mx ~= 1
      disp('ERROR:please check your input')
      return
    endif
   otherwise
    1
    x0 = ones (2,1)
  endswitch
endfunction