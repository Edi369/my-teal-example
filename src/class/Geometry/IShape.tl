-- declaração da interface base que será utilizada por todas as classes desse exemplo
-- variaveis e funções definidas aqui são compativeis com todas as classes filhas
-- dessa forma a gente pode expor variaveis e funções para o Teal entre classes herdadas
local interface IShape
    StaticShapeNumber: number
    x: number
    y: number
    GetPosition: function(self: IShape): {number, number}
end

return IShape