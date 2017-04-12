
function setTime(Split, Player)
	if Split[2] == 'on' then
		Root:ForEachWorld(
			function (World)
				local thisWorld = World:GetName()
				isStopped[thisWorld] = true
				savedTime[thisWorld] = nil
				if Split[3] ~= nil then
					World:SetTimeOfDay(Split[3])
				end
				print( thisWorld .. ": time stopped at " .. World:GetTimeOfDay() )
			end
		)
	elseif Split[2] == 'off' then
		Root:ForEachWorld(
			function(World)
				local thisWorld = World:GetName()
				if	isStopped[thisWorld] == true then
					isStopped[thisWorld] = false
					print(thisWorld .. ": time resumed" )
				end
			end
		)
	elseif Split[2] == "overview" and Split[3] == nil then
		Player:SendMessage( "------------------------------------------" )
		Root:ForEachWorld(
			function(World)
				local thisWorld = World:GetName()
				if isStopped[thisWorld] then
					Player:SendMessage( thisWorld .. ": " .. cChatColor.Rose .. "stopped at " .. savedTime[thisWorld] )
				else
					Player:SendMessage( thisWorld .. ": " .. cChatColor.Green .. "running at " .. World:GetTimeOfDay() )
				end
			end
		)
		Player:SendMessage( "------------------------------------------" )
	else
		setTimeWorld(Split, Player)
	end
	
	return true
end

function setTimeWorld(Split, Player)
	Root:ForEachWorld(
		function(World)
			local thisWorld = World:GetName()
			if thisWorld == Split[2] then
				if Split[3] == 'on' then
					isStopped[Split[2]] = true
					savedTime[Split[2]] = nil
					if Split[4] ~= nil then
						World:SetTimeOfDay(Split[4])
					end
					print(Split[2] .. ": time stopped at " .. World:GetTimeOfDay() )
				end
				if Split[3] == 'off' then
					isStopped[thisWorld] = false
				end
			end
		end
	)
end
