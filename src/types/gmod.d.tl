local record playerIns
   Name: string
   SteamID: string
   Nick: function(self: playerIns): string
end

global record player
   GetAll: function(): {playerIns}
   GetByID: function(number): playerIns
end

global SERVER: boolean
global CLIENT: boolean