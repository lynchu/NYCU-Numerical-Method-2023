function [v1 , no_itr, norm1, success,exists, roots] = NewtonRaphson_nl_print(v,fn,jacob_fn,no_itr,error,roots)
    v1 = v;
    fnv1 = feval(fn,v1);
    i = 0;
    
    success=0;
    exists=0;
    while true
        norm1 = norm(fnv1);
        %fprintf('%10d     |%10.4f| %10.4f | %10.4f| %10.4d |\n',i,v1(1),v1(2),v1(3),norm1)
        jacob_fnv1 = feval(jacob_fn,v1);
        H = jacob_fnv1\fnv1;
        v1 = v1 - H;
        fnv1 = feval(fn,v1);
        i = i + 1 ;
        norm1 = norm(fnv1);
        if norm1 < error
            success=1;
            
            s=size(roots);
            for i = 1:s(1)
                dis1= abs(v1(1)-roots(i,1));
                dis2= abs(v1(2)-roots(i,2));
                dis3= abs(v1(3)-roots(i,3));
                if (dis1+dis2+dis3)<3*1e-4
                    exists=1;
                end
            end
            if exists == 0
                fprintf('%10d     |%10.4f| %10.4f | %10.4f| %10.4d |\n',i,v1(1),v1(2),v1(3),norm1)
            end
            break
        end
        if i > no_itr% && norm1 > error
            fprintf("      fail");
            %fprintf('%10d     |%10.4f| %10.4f | %10.4f| %10.4d | fail\n',i,v1(1),v1(2),v1(3),norm1)
            break;
        end
        
    end
end