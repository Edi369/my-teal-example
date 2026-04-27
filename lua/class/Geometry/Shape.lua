local _tl_compat; if (tonumber((_VERSION or ''):match('[%d.]*$')) or 0) < 5.3 then local p, m = pcall(require, 'compat53.module'); if p then _tl_compat = m end end; local string = _tl_compat and _tl_compat.string or string



local Shape = {}







Shape.OnlyClassStatic = 10
Shape.StaticShapeNumber = 12


function Shape.tostring(self)
   return string.format("x = %f, y = %f", self.x, self.y)
end




function Shape.init(self, x, y)
   self.x = x
   self.y = y
end

function Shape.New(x, y)
   local self = setmetatable({}, { __index = Shape })
   self.init(self, x, y)
   return self
end



function Shape.GetPosition(self)
   return { self.x, self.y }
end

return Shape
