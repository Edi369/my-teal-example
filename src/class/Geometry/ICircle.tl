local type IShape = require("class.Geometry.IShape")

-- interface de Circle, utilizado para permitir que outras classes 
-- usem Circle como tipo sem conhecer sua implementação de classe e explicitar sua
-- tabela de dados compativeis com metodos de IShape para o Teal
local interface ICircle is IShape
    radius: number
    GetRadius: function(self: ICircle): number
end

return ICircle