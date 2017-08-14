Stack={}

function Stack.Create()
    local s={}
    local n=1

    function push(item)
        if(item~=nil)then
            s[n]=item
            n=n+1
        end
    end

    function pop()
        if(n>1)
        then
            n=n-1
            item=s[n]
            s[n]=nil
            return item
        else 
            return nil
        end
    end
    
    s.Push=push
    s.Pop=pop
    return s
end

-- !!! This will empty the stack.
function Stack.PrintStack(st)
    while(true)do
        temp=st.Pop()
        if(temp==nil)then break end
        print(temp)
    end
end

return Stack