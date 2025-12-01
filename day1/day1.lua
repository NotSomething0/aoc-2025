local READ_MODE = 'rb'

-- get all lines from a file, returns an empty 
-- list/table if the file does not exist
function lines_from(file)
  local lines = {}
  for line in io.lines(file) do
    lines[#lines + 1] = line
  end
  return lines
end

function mysplit(inputstr, sep)
  if sep == nil then
    sep = "%s"
  end
  local t = {}
  for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
    table.insert(t, str)
  end
  return t
end

local clicks = 0
local dialLocation = 50

print('The dial start by pointing at 50')


local inputFileLines = lines_from('input.txt')

local t = {}

-- print all line numbers and their contents
for k,v in pairs(inputFileLines) do
  local action = v:match('%a')
  local turns = tonumber(v:match('%d+')) or tonumber(v:match('%z'))

  if not turns then
    print('bad')
  end

  table.insert(t, {
    _action = action,
    _turns = turns
  })
end


for _, data in ipairs(t) do
  for idx = 1, data._turns do
    if data._action == "R" then
      local newLocation = dialLocation + 1

      if newLocation == 100 then
        newLocation = 0
      end

      dialLocation = newLocation
    end

    if data._action == "L" then
      local newLocation = dialLocation - 1

      if newLocation == -1 then
        newLocation = 99
      end
      if newLocation == 100 then
        newLocation = 0
      end

      dialLocation = newLocation
    end

    if dialLocation == 0 then
      clicks = clicks + 1
    end
  end
end

print(clicks, dialLocation)
