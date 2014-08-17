local PLUGIN = {}
PLUGIN.Title = "Rounds Left"
PLUGIN.Description = "Prints in chat how many rounds are left until map change."
PLUGIN.Author = "NiandraLades"
PLUGIN.ChatCommand = "roundsleft"
PLUGIN.Privileges = { nil }


function PLUGIN:Call( ply, args )
	local limit = GAMEMODE:GetRoundLimit()
	local current = GetGlobalInt("RoundNumber")
	local rounds = (limit - current)
	
	if current != limit then
		ply:ChatPrint(""..ply:Nick()..", there are "..rounds.." rounds until map change.")
	else
		ply:ChatPrint(""..ply:Nick()..", this is the last round!")
	end
end
evolve:RegisterPlugin( PLUGIN )