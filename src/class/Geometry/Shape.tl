local type IShape = require("class.Geometry.IShape")

-- record é o tipo class para o Teal, mas você não define logica dentro
-- diferente de interface, aqui você pode atribuir codigo fora da mesma forma em lua
local record Shape is IShape
    OnlyClassStatic: number
    GetPosition: function(self: IShape): {number, number}
    New: function(x: number, y: number): Shape
    init: function(self: IShape, x: number, y: number)
    tostring: function(self: IShape): string
end

Shape.OnlyClassStatic = 10
Shape.StaticShapeNumber = 12

-- metodo de exemplo para herdar no Circle com novas instruções
function Shape.tostring(self: IShape): string
   return string.format("x = %f, y = %f", self.x, self.y)
end

-- init server como um "inicializador" da classe que define todas as propriedades
-- e feito assim pra poder reaproveitar seu construtor em outras classes que podem herdar 
-- o Shape com novas propriedades
function Shape.init(self: IShape, x: number, y: number)
    self.x = x
    self.y = y
end

function Shape.New(x: number, y: number): Shape
    local self = setmetatable({}, { __index = Shape }) as Shape
    self.init(self, x, y) -- define propriedades aqui!
    return self
end

-- metodo de exemplo base que Shape e Circle tera, sua logica base sendo setado aqui
-- acessavel tanto por Shape como também por Circle
function Shape.GetPosition(self: IShape): {number, number}
    return {self.x, self.y}
end

return Shape