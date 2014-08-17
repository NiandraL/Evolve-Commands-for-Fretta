local PLUGIN = {}
PLUGIN.Title = "Round Restart"
PLUGIN.Description = "Forces round restart."
PLUGIN.Author = "NiandraLades"
PLUGIN.ChatCommand = "restartround"
PLUGIN.Privileges = { "Fretta_RoundRestart" }

function PLUGIN:Call( ply, args )
	if ( ply:EV_HasPrivilege( "Fretta_RoundRestart" ) ) then		
		if (GAMEMODE:InRound()) then
			GAMEMODE:PreRoundStart( GetGlobalInt( "RoundNumber" ) )
			evolve:Notify( evolve.colors.blue, ply:Nick(), evolve.colors.white, " has restarted the round." )
		else
			evolve:Notify( ply, evolve.colors.red, "Must be in round to restart it!" )
		end	

	else
		evolve:Notify( ply, evolve.colors.red, evolve.constants.notallowed )
	end	
	
end

evolve:RegisterPlugin( PLUGIN )