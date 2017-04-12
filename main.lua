-- The Plugin stops the gametime by reverting it every 20 seconds

-- Commands: 	timestop on/off [<time>] 			Stop Time in all worlds at given time
--			 	timestop <world> on/off [<time>]	Stop Time in selected world at given time#
--			 	timestop overview					Shows timestop values for all worlds

-- Permissions: timestop							Permission for all commands


function Initialize( Plugin )
	PLUGIN = Plugin
	Plugin:SetName( "TimeStop" )
	Plugin:SetVersion(1)
		
		
	PluginManager = cRoot:Get():GetPluginManager()
	PluginManager:AddHook(cPluginManager.HOOK_WORLD_TICK, OnWorldTick);
	PluginManager.BindCommand("/timestop <world>", "timestop", setTime, "on/off [<time>]  - Stops time of selected world at given value")
	PluginManager.BindCommand("/timestop", "timestop", setTime, "on/off [<time>]  - Stops time in all worlds at given value")	
	PluginManager.BindCommand("/timestop overview", "timestop", setTime, " - Shows timestop values for all worlds")
	isStopped = {}
	savedTime = {}
	now = 0
	Root = cRoot.Get(cRoot)
	
	LOG("Initialized " .. PLUGIN:GetName() .. " v" .. PLUGIN:GetVersion())
	return true
end

function OnDisable()
	LOG( PLUGIN:GetName() .. " v" .. PLUGIN:GetVersion() .. " is shutting down..." )
end