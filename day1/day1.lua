local totalClicks = 0
local dialLocation = 50

-- https://stackoverflow.com/a/11204889
local function lines_from(file)
  local lines = {}
  for line in io.lines(file) do
    lines[#lines + 1] = line
  end
  return lines
end

local inputData = {}
local inputLines = lines_from('input.txt')

for _,v in pairs(inputLines) do
  local action = v:match('%a')
  local turns = tonumber(v:match('%d+')) or tonumber(v:match('%z'))

  if turns then
    table.insert(inputData, {
      _action = action,
      _turns = turns
    })
  end
end

for _, data in ipairs(inputData) do
  for _ = 1, data._turns do
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
      totalClicks = totalClicks + 1
    end
  end
end

print(('Total clicks %d | Dial location after password: %d'):format(totalClicks, dialLocation))
