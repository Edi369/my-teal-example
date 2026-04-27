local type ICircle = require("class.Geometry.ICircle")
local type Shape = require("class.Geometry.Shape")

local record Circle is ICircle
    -- GetPosition não precisa ser declarado aqui pois ja é definido em ICircle
    GetRadius: function(self: ICircle): number
    New: function(x: number, y: number, r: number): Circle -- função base pra criação do objeto
    init: function(self: ICircle, x: number, y: number, r: number) -- função base de inicialização
    PrintCreationDebug: function()
    tostring: function(self: ICircle): string -- declarando novamente tostring que será alterada para mesclar com a função pai
                                              -- Detalhe: pra fazer qualquer metodo de uma classe seja herdada, precisa estar
                                              -- declarado na sua interface, ja que herdamos apenas a interface, não a classe
                                              -- mas teoricamente ele pode possuir metodos e valores das clases com o setmetatable
end

-- Herdar propriedades e metodos
-- por exemplo, logica não definida do `Shape:GetPosition` é capturado assim
-- outros metodos da propria classe e valores internos, mas o Teal não consegue
-- enxergar eles se não for herdado de uma interface!
setmetatable(Circle, { __index = Shape })

function Circle.tostring(self: ICircle): string
    -- "super" ou "base" tipo C# ou Java, usando o metodo original da função pai
    return Shape.tostring(self) .. string.format(", r = %f", self.radius)
    -- mescla o metodo pai do `tostring` e adiciona novas informações a mensagem final
end

-- init aqui utiliza o `Shape.init` para reutilizar a definição de propriedades
-- depois adicionas suas próprias propriedades no final
-- da para reaproveitar esse init por exemplo com uma classe Sphere herdando Circle
function Circle.init(self: ICircle, x: number, y: number, r: number)
    Shape.init(self, x, y)
    self.radius = r
end

-- codigo aqui e a mesma que Shape, ja que não tem logica especial alem de definir
-- suas propriedades, mas com
function Circle.New(x: number, y: number, r: number): Circle
    local self = setmetatable({} as Circle, { __index = Circle })
    self.init(self, x, y, r) -- Shape.init + Circle.init
    self.PrintCreationDebug() -- chamando metodo de classe para inicialização
    return self
end

function Circle.PrintCreationDebug()
    print("Circle created")
end

-- metodo especial para Circle
function Circle.GetRadius(self: ICircle): number
    return self.radius
end

return Circle