local ctime = require "ctime"

local second, microsecond = ctime.get_time()

print(second)
print(microsecond)
