local Geometry = require("class.Geometry")

-- criação de instancias
local shape = Geometry.Shape.New(1, 2)
-- circle -> IShape + ICircle -> Shape -> Circle
local circle = Geometry.Circle.New(3, 4, 5)

print("shape: ", shape:tostring())
print("circle: ", circle:tostring())

print("shape x, y: ", shape.x, shape.y)
print("circle x, y, radius: ", circle.x, circle.y, circle.radius)

local pos = shape:GetPosition()
print("shape position: ", pos[1], pos[2])

pos = circle:GetPosition()
print("circle position: ", pos[1], pos[2])
print("circle radius: ", circle:GetRadius())

print("static members number:", 
    shape.StaticShapeNumber, 
    circle.StaticShapeNumber,
    Geometry.Shape.StaticShapeNumber
)

print("static shape only class: ", shape.OnlyClassStatic, Geometry.Shape.OnlyClassStatic)