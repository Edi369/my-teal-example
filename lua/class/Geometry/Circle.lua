local _tl_compat; if (tonumber((_VERSION or ''):match('[%d.]*$')) or 0) < 5.3 then local p, m = pcall(require, 'compat53.module'); if p then _tl_compat = m end end; local string = _tl_compat and _tl_compat.string or string
local Shape = require("lua.class.Geometry.Shape")

local Circle = {}















setmetatable(Circle, { __index = Shape })

function Circle.tostring(self)

   return Shape.tostring(self) .. string.format(", r = %f", self.radius)

end




function Circle.init(self, x, y, r)
   Shape.init(self, x, y)
   self.radius = r
end



function Circle.New(x, y, r)
   local self = setmetatable({}, { __index = Circle })
   self.init(self, x, y, r)
   self.PrintCreationDebug()
   return self
end

function Circle.PrintCreationDebug()
   print("Circle created")
end


function Circle.GetRadius(self)
   return self.radius
end

return Circle
