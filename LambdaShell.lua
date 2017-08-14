LambdaShell={}

require('io')

function LambdaShell.Prompt()
    io.write('lambda>')
    str=io.read()
    return str
end

return LambdaShell