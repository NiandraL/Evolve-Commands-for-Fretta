local PLUGIN = {}
PLUGIN.Title = "Force Vote Screen"
PLUGIN.Description = "Forces the Fretta vote on-screen."
PLUGIN.Author = "NiandraLades"
PLUGIN.ChatCommand = "forcefretta"
PLUGIN.Privileges = { "Fretta_ForceVote" }

function PLUGIN:Call( ply, args )
	if ( ply:EV_HasPrivilege( "Fretta_AddRoundTime" ) ) then		
		if( !GAMEMODE.m_bVotingStarted ) then
			GAMEMODE:StartGamemodeVote()
		else
			evolve:Notify( ply, evolve.colors.red, "Vote already in-progress!" )
		end
	else
		evolve:Notify( ply, evolve.colors.red, evolve.constants.notallowed )
	end	
	
end

evolve:RegisterPlugin( PLUGIN )