local PLUGIN = {}
PLUGIN.Title = "Add Round Time"
PLUGIN.Description = "Add time onto the current round."
PLUGIN.Author = "NiandraLades"
PLUGIN.ChatCommand = "addtime"
PLUGIN.Usage = "[seconds]"
PLUGIN.Privileges = { "Fretta_AddRoundTime" }

function PLUGIN:Call( ply, args )
	if ( ply:EV_HasPrivilege( "Fretta_AddRoundTime" ) ) then
		local time = tonumber(args[ #args ])
		
		if (GAMEMODE:InRound()) then
			GAMEMODE:AddRoundTime( time )
			evolve:Notify( evolve.colors.blue, ply:Nick(), evolve.colors.white, " has extended round time by ", evolve.colors.red, ""..time.." seconds", evolve.colors.white, "." )
		else
			evolve:Notify( ply, evolve.colors.red, "Can't add time while not in round!" )
		end	
	else
		evolve:Notify( ply, evolve.colors.red, evolve.constants.notallowed )
	end	
	
end

evolve:RegisterPlugin( PLUGIN )