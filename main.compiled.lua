local Carbon = (...)

function test(a,b)
a = (a ~= nil) and a or 6
b = (b ~= nil) and b or function() end

	print(a, b)
end