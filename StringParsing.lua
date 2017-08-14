StringParsing={}

require('string')
require('Stack')

separators={' ','.','(',')'}

-- Return split strings in a stack.
function StringParsing.SplitString(str)
    result=Stack.Create()

    -- Prevent that str only has spaces.
    str=RemoveHeadSpaces(str)
    while(str~='')do
        temp,str=GetWord(str)
        result.Push(temp)
    end

    return result
end

--以下函数需要优化，写成四个用and或者or连接的elseif。或者整体优化，先合并空白符，然后再做分割检测。Need to optimized.
-- Remove the spaces at the head of str.
function RemoveHeadSpaces(str)
    repeat 
        c,str=GetChar(str)
    until(c~=' ' or (str=='' and c==''))
    str=c..str
    return str
end

-- Return the first word and the rest.Ignore all Spaces.
function GetWord(str)
    temp=''

    repeat
        while(str~='')do
            c,str=GetChar(str)
            if(IsSeparator(c))then
                if(c==' ')then
                    break
                else
                    if(temp~='')then
                        str=c..str
                    else
                        temp=c
                    end
                    break
                end
            end
            temp=temp..c
        end
    until((temp~='')or(str==''))

    return temp,str
end


-- Return the first character and the rest.
function GetChar(s)
    return string.sub(s,1,1),string.sub(s,2)
end

-- To Determine whether c has a special grammatical meaning.
function IsSeparator(c)
    for i,v in ipairs(separators)
    do
        if (c==v)
        then 
            return true
        end
    end
    return false
end

return StringParsing