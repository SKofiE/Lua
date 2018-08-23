local name = "Animations"
local toolbar = plugin:CreateToolbar(name)
local text = "Despacito Parse"
local tooltip = "Select your animation to print code"
local iconName = "rbxassetid://89453041"
local button = toolbar:CreateButton(text,tooltip,iconName)

function Error()
	error("Please select only one Keyframe Sequence")
end

function KeyframeSort(Index1,Index2)
	return Index1.Time < Index2.Time
end

button.Click:connect(function()
	for oppA,Sequence in pairs(game:GetService("Selection"):Get()) do
		if not Sequence:IsA("KeyframeSequence") then
			Error()
		else
			local keyframes = Sequence:GetKeyframes()
			table.sort(keyframes,KeyframeSort)
			local TotalTime = keyframes[#keyframes].Time
			
			--Getting Limb Frames
			local LimbsKeyframes = {}	
			local LeftLowerArmFrames = {}	
			local RightHandFrames = {}	
			local RightUpperArmFrames = {}	
			local LeftUpperArmFrames = {}	
			local UpperTorsoFrames = {}	
			local LeftHandFrames = {}	
			local LeftFootFrames = {}	
			local RightFootFrames = {}	
			local RightLowerLegFrames = {}	
			local RightUpperLegFrames = {}	
			local HeadFrames = {}	
			local LowerTorsoFrames = {}	
			local LeftLowerLegFrames = {}	
			local RightLowerArmFrames = {}	
			local LeftUpperLegFrames = {}	
	
			print(#keyframes)
			
			for i,  v in pairs(keyframes) do	
	
				local LLA = v:FindFirstChild("LeftLowerArm",true)	
				if LLA then	
					print(LLA)
					print(LLA.Weight)
					local returning = {LLA}	
					if returning[1].Weight > 0 then
						returning.Time = v.Time
						local style = LLA.EasingStyle.Name
						local direction = nil
						if style == "Cubic" then
							style = "Quad"
						elseif style == "Constant" then
							style = "Quint"
							if LLA.EasingDirection.Value < 3 then
								direction = Enum.EasingDirection.Out
							end
						end
						assert(loadstring("b = Enum.EasingStyle."..style))()
						returning.EasingStyle = b
						if direction == nil then
							direction = LLA.EasingDirection.Value
						end
						returning.EasingDirection = direction
						returning.Weight = returning[1].Weight
						returning.Transform = "CFrame.new(".. tostring(LLA.CFrame)..")"	
						LeftLowerArmFrames[#LeftLowerArmFrames+1] = returning	
					end
				end	
	
				local RH = v:FindFirstChild("RightHand",true)	
				if RH then	
					local returning = {RH}	
					if returning[1].Weight > 0 then
						returning.Time = v.Time
						local style = RH.EasingStyle.Name
						local direction = nil
						if style == "Cubic" then
							style = "Quad"
						elseif style == "Constant" then
							style = "Quint"
							if RH.EasingDirection.Value < 3 then
								direction = Enum.EasingDirection.Out
							end
						end
						assert(loadstring("b = Enum.EasingStyle."..style))()
						returning.EasingStyle = b
						if direction == nil then
							direction = RH.EasingDirection.Value
						end
						returning.EasingDirection = direction
						returning.Weight = returning[1].Weight
						returning.Transform = "CFrame.new(".. tostring(RH.CFrame)..")"	
						RightHandFrames[#RightHandFrames+1] = returning	
					end
				end	
				local RUA = v:FindFirstChild("RightUpperArm",true)	
				if RUA then	
					local returning = {RUA}	
					if returning[1].Weight > 0 then
						returning.Time = v.Time
						local style = RUA.EasingStyle.Name
						local direction = nil
						if style == "Cubic" then
							style = "Quad"
						elseif style == "Constant" then
							style = "Quint"
							if RUA.EasingDirection.Value < 3 then
								direction = Enum.EasingDirection.Out
							end
						end
						assert(loadstring("b = Enum.EasingStyle."..style))()
						returning.EasingStyle = b
						if direction == nil then
							direction = RUA.EasingDirection.Value
						end
						returning.EasingDirection = direction
						returning.Weight = returning[1].Weight
						returning.Transform = "CFrame.new(".. tostring(RUA.CFrame)..")"	
						RightUpperArmFrames[#RightUpperArmFrames+1] = returning	
					end
				end	
	
				local LUA = v:FindFirstChild("LeftUpperArm",true)	
				if LUA then	
					local returning = {LUA}	
					if returning[1].Weight > 0 then
						returning.Time = v.Time
						local style = LUA.EasingStyle.Name
						local direction = nil
						if style == "Cubic" then
							style = "Quad"
						elseif style == "Constant" then
							style = "Quint"
							if LUA.EasingDirection.Value < 3 then
								direction = Enum.EasingDirection.Out
							end
						end
						assert(loadstring("b = Enum.EasingStyle."..style))()
						returning.EasingStyle = b
						if direction == nil then
							direction = LUA.EasingDirection.Value
						end
						returning.EasingDirection = direction
						returning.Weight = returning[1].Weight
						returning.Transform = "CFrame.new(".. tostring(LUA.CFrame)..")"	
						LeftUpperArmFrames[#LeftUpperArmFrames+1] = returning	
					end
				end	
	
				local UT = v:FindFirstChild("UpperTorso",true)	
				if UT then	
					local returning = {UT}	
					if returning[1].Weight > 0 then
						returning.Time = v.Time
						local style = UT.EasingStyle.Name
						local direction = nil
						if style == "Cubic" then
							style = "Quad"
						elseif style == "Constant" then
							style = "Quint"
							if UT.EasingDirection.Value < 3 then
								direction = Enum.EasingDirection.Out
							end
						end
						assert(loadstring("b = Enum.EasingStyle."..style))()
						returning.EasingStyle = b
						if direction == nil then
							direction = UT.EasingDirection.Value
						end
						returning.EasingDirection = direction
						returning.Weight = returning[1].Weight
						returning.Transform = "CFrame.new(".. tostring(UT.CFrame)..")"	
						UpperTorsoFrames[#UpperTorsoFrames+1] = returning	
					end
				end	
	
				local LH = v:FindFirstChild("LeftHand",true)	
				if LH then	
					local returning = {LH}	
					if returning[1].Weight > 0 then
						returning.Time = v.Time
						local style = LH.EasingStyle.Name
						local direction = nil
						if style == "Cubic" then
							style = "Quad"
						elseif style == "Constant" then
							style = "Quint"
							if LH.EasingDirection.Value < 3 then
								direction = Enum.EasingDirection.Out
							end
						end
						assert(loadstring("b = Enum.EasingStyle."..style))()
						returning.EasingStyle = b
						if direction == nil then
							direction = LH.EasingDirection.Value
						end
						returning.EasingDirection = direction
						returning.Weight = returning[1].Weight
						returning.Transform = "CFrame.new(".. tostring(LH.CFrame)..")"	
						LeftHandFrames[#LeftHandFrames+1] = returning	
					end
				end	
	
				local LF = v:FindFirstChild("LeftFoot",true)	
				if LF then	
					local returning = {LF}	
					if returning[1].Weight > 0 then
						returning.Time = v.Time
						local style = LF.EasingStyle.Name
						local direction = nil
						if style == "Cubic" then
							style = "Quad"
						elseif style == "Constant" then
							style = "Quint"
							if LF.EasingDirection.Value < 3 then
								direction = Enum.EasingDirection.Out
							end
						end
						assert(loadstring("b = Enum.EasingStyle."..style))()
						returning.EasingStyle = b
						if direction == nil then
							direction = LF.EasingDirection.Value
						end
						returning.EasingDirection = direction
						returning.Weight = returning[1].Weight
						returning.Transform = "CFrame.new(".. tostring(LF.CFrame)..")"	
						LeftFootFrames[#LeftFootFrames+1] = returning	
					end
				end	
	
				local RF = v:FindFirstChild("RightFoot",true)	
				if RF then	
					local returning = {RF}	
					if returning[1].Weight > 0 then
						returning.Time = v.Time
						local style = RF.EasingStyle.Name
						local direction = nil
						if style == "Cubic" then
							style = "Quad"
						elseif style == "Constant" then
							style = "Quint"
							if RF.EasingDirection.Value < 3 then
								direction = Enum.EasingDirection.Out
							end
						end
						assert(loadstring("b = Enum.EasingStyle."..style))()
						returning.EasingStyle = b
						if direction == nil then
							direction = RF.EasingDirection.Value
						end
						returning.EasingDirection = direction
						returning.Weight = returning[1].Weight
						returning.Transform = "CFrame.new(".. tostring(RF.CFrame)..")"	
						RightFootFrames[#RightFootFrames+1] = returning	
					end
				end	
	
				local RLL = v:FindFirstChild("RightLowerLeg",true)	
				if RLL then	
					local returning = {RLL}	
					if returning[1].Weight > 0 then
						returning.Time = v.Time
						local style = RLL.EasingStyle.Name
						local direction = nil
						if style == "Cubic" then
							style = "Quad"
						elseif style == "Constant" then
							style = "Quint"
							if RLL.EasingDirection.Value < 3 then
								direction = Enum.EasingDirection.Out
							end
						end
						assert(loadstring("b = Enum.EasingStyle."..style))()
						returning.EasingStyle = b
						if direction == nil then
							direction = RLL.EasingDirection.Value
						end
						returning.EasingDirection = direction
						returning.Weight = returning[1].Weight
						returning.Transform = "CFrame.new(".. tostring(RLL.CFrame)..")"	
						RightLowerLegFrames[#RightLowerLegFrames+1] = returning	
					end
				end	
	
				local RUL = v:FindFirstChild("RightUpperLeg",true)	
				if RUL then	
					local returning = {RUL}	
					if returning[1].Weight > 0 then
						returning.Time = v.Time
						local style = RUL.EasingStyle.Name
						local direction = nil
						if style == "Cubic" then
							style = "Quad"
						elseif style == "Constant" then
							style = "Quint"
							if RUL.EasingDirection.Value < 3 then
								direction = Enum.EasingDirection.Out
							end
						end
						assert(loadstring("b = Enum.EasingStyle."..style))()
						returning.EasingStyle = b
						if direction == nil then
							direction = RUL.EasingDirection.Value
						end
						returning.EasingDirection = direction
						returning.Weight = returning[1].Weight
						returning.Transform = "CFrame.new(".. tostring(RUL.CFrame)..")"	
						RightUpperLegFrames[#RightUpperLegFrames+1] = returning	
					end
				end	
	
				local H = v:FindFirstChild("Head",true)	
				if H then	
					local returning = {H}	
					if returning[1].Weight > 0 then
						returning.Time = v.Time
						local style = H.EasingStyle.Name
						local direction = nil
						if style == "Cubic" then
							style = "Quad"
						elseif style == "Constant" then
							style = "Quint"
							if H.EasingDirection.Value < 3 then
								direction = Enum.EasingDirection.Out
							end
						end
						assert(loadstring("b = Enum.EasingStyle."..style))()
						returning.EasingStyle = b
						if direction == nil then
							direction = H.EasingDirection.Value
						end
						returning.EasingDirection = direction
						returning.Weight = returning[1].Weight
						returning.Transform = "CFrame.new(".. tostring(H.CFrame)..")"	
						HeadFrames[#HeadFrames+1] = returning	
					end
				end	
	
				local LT = v:FindFirstChild("LowerTorso",true)	
				if LT then	
					local returning = {LT}	
					if returning[1].Weight > 0 then
						returning.Time = v.Time
						local style = LT.EasingStyle.Name
						local direction = nil
						if style == "Cubic" then
							style = "Quad"
						elseif style == "Constant" then
							style = "Quint"
							if LT.EasingDirection.Value < 3 then
								direction = Enum.EasingDirection.Out
							end
						end
						assert(loadstring("b = Enum.EasingStyle."..style))()
						returning.EasingStyle = b
						if direction == nil then
							direction = LT.EasingDirection.Value
						end
						returning.EasingDirection = direction
						returning.Weight = returning[1].Weight
						returning.Transform = "CFrame.new(".. tostring(LT.CFrame)..")"	
						LowerTorsoFrames[#LowerTorsoFrames+1] = returning	
					end
				end	
	
				local LLL = v:FindFirstChild("LeftLowerLeg",true)	
				if LLL then	
					local returning = {LLL}	
					if returning[1].Weight > 0 then
						returning.Time = v.Time
						local style = LLL.EasingStyle.Name
						local direction = nil
						if style == "Cubic" then
							style = "Quad"
						elseif style == "Constant" then
							style = "Quint"
							if LLL.EasingDirection.Value < 3 then
								direction = Enum.EasingDirection.Out
							end
						end
						assert(loadstring("b = Enum.EasingStyle."..style))()
						returning.EasingStyle = b
						if direction == nil then
							direction = LLL.EasingDirection.Value
						end
						returning.EasingDirection = direction
						returning.Weight = returning[1].Weight
						returning.Transform = "CFrame.new(".. tostring(LLL.CFrame)..")"	
						LeftLowerLegFrames[#LeftLowerLegFrames+1] = returning	
					end
				end	
	
				local RLA = v:FindFirstChild("RightLowerArm",true)	
				if RLA then	
					local returning = {RLA}	
					if returning[1].Weight > 0 then
						returning.Time = v.Time
						local style = RLA.EasingStyle.Name
						local direction = nil
						if style == "Cubic" then
							style = "Quad"
						elseif style == "Constant" then
							style = "Quint"
							if RLA.EasingDirection.Value < 3 then
								direction = Enum.EasingDirection.Out
							end
						end
						assert(loadstring("b = Enum.EasingStyle."..style))()
						returning.EasingStyle = b
						if direction == nil then
							direction = RLA.EasingDirection.Value
						end
						returning.EasingDirection = direction
						returning.Weight = returning[1].Weight
						returning.Transform = "CFrame.new(".. tostring(RLA.CFrame)..")"	
						RightLowerArmFrames[#RightLowerArmFrames+1] = returning	
					end
				end	
	
				local LUL = v:FindFirstChild("LeftUpperLeg",true)	
				if LUL then	
					local returning = {LUL}	
					if returning[1].Weight > 0 then
						returning.Time = v.Time
						local style = LUL.EasingStyle.Name
						local direction = nil
						if style == "Cubic" then
							style = "Quad"
						elseif style == "Constant" then
							style = "Quint"
							if LUL.EasingDirection.Value < 3 then
								direction = Enum.EasingDirection.Out
							end
						end
						assert(loadstring("b = Enum.EasingStyle."..style))()
						returning.EasingStyle = b
						if direction == nil then
							direction = LUL.EasingDirection.Value
						end
						returning.EasingDirection = direction
						returning.Weight = returning[1].Weight
						returning.Transform = "CFrame.new(".. tostring(LUL.CFrame)..")"	
						LeftUpperLegFrames[#LeftUpperLegFrames+1] = returning	
					end
				end	
			end	
	
			LimbsKeyframes = {	
				LeftLowerArmFrames,	
				RightHandFrames,	
				RightUpperArmFrames,	
				LeftUpperArmFrames,	
				UpperTorsoFrames,	
				LeftHandFrames,	
				LeftFootFrames,	
				RightFootFrames,	
				RightLowerLegFrames,	
				RightUpperLegFrames,	
				HeadFrames,	
				LowerTorsoFrames,	
				LeftLowerLegFrames,	
				RightLowerArmFrames,	
				LeftUpperLegFrames
			}	

			--Getting lengths
			for _, RRTT in pairs(LimbsKeyframes) do --RRTT stands for nothing, I pressed random letters on my keyboard
				local LimbFrames = RRTT --Sorted
				for i, v in pairs(LimbFrames) do
					if i > 1 then
						v.Length = v.Time - LimbFrames[i-1].Time
					else
						v.Length = 0
					end
				end
			end
			
			--Making function to return the data
			
			print("function ".. Sequence.Name .. "()")	
	
			for i,v in pairs(LeftLowerArmFrames) do	
				local Prefix = "LeftLowerArms[".. tostring(i).. "]"	
				local Prefix2 = string.sub(Prefix,1,string.len(Prefix)-3)
				local Prefix3 = "	"
				if i == 1 then
					Prefix3 = "	local "..Prefix2.. " = {} \n	"
				end
				print(Prefix3..Prefix.. " = {}\n	"..Prefix.. ".Time = ".. tostring(v.Time).."\n	"..Prefix.. ".Length = ".. tostring(v.Length).."\n	"..Prefix.. ".EasingStyle = ".. tostring(v.EasingStyle).."\n	"..Prefix.. ".EasingDirection = ".. tostring(v.EasingDirection).. "\n	"..Prefix.. ".Transform = ".. v.Transform.. "\n	"..Prefix.. ".Weight = ".. tostring(v.Weight))
			end	
	
			for i,v in pairs(RightHandFrames) do	
				local Prefix = "RightHands[".. tostring(i).. "]"	
				local Prefix2 = string.sub(Prefix,1,string.len(Prefix)-3)
				local Prefix3 = "	"
				if i == 1 then
					Prefix3 = "	local "..Prefix2.. " = {} \n	"
				end
				print(Prefix3..Prefix.. " = {}\n	"..Prefix.. ".Time = ".. tostring(v.Time).."\n	"..Prefix.. ".Length = ".. tostring(v.Length).."\n	"..Prefix.. ".EasingStyle = ".. tostring(v.EasingStyle).."\n	"..Prefix.. ".EasingDirection = ".. tostring(v.EasingDirection).. "\n	"..Prefix.. ".Transform = ".. v.Transform.. "\n	"..Prefix.. ".Weight = ".. tostring(v.Weight))
			end	
	
			for i,v in pairs(RightUpperArmFrames) do	
				local Prefix = "RightUpperArms[".. tostring(i).. "]"	
				local Prefix2 = string.sub(Prefix,1,string.len(Prefix)-3)
				local Prefix3 = "	"
				if i == 1 then
					Prefix3 = "	local "..Prefix2.. " = {} \n	"
				end
				print(Prefix3..Prefix.. " = {}\n	"..Prefix.. ".Time = ".. tostring(v.Time).."\n	"..Prefix.. ".Length = ".. tostring(v.Length).."\n	"..Prefix.. ".EasingStyle = ".. tostring(v.EasingStyle).."\n	"..Prefix.. ".EasingDirection = ".. tostring(v.EasingDirection).. "\n	"..Prefix.. ".Transform = ".. v.Transform.. "\n	"..Prefix.. ".Weight = ".. tostring(v.Weight))
			end	
	
			for i,v in pairs(LeftUpperArmFrames) do	
				local Prefix = "LeftUpperArms[".. tostring(i).. "]"	
				local Prefix2 = string.sub(Prefix,1,string.len(Prefix)-3)
				local Prefix3 = "	"
				if i == 1 then
					Prefix3 = "	local "..Prefix2.. " = {} \n	"
				end
				print(Prefix3..Prefix.. " = {}\n	"..Prefix.. ".Time = ".. tostring(v.Time).."\n	"..Prefix.. ".Length = ".. tostring(v.Length).."\n	"..Prefix.. ".EasingStyle = ".. tostring(v.EasingStyle).."\n	"..Prefix.. ".EasingDirection = ".. tostring(v.EasingDirection).. "\n	"..Prefix.. ".Transform = ".. v.Transform.. "\n	"..Prefix.. ".Weight = ".. tostring(v.Weight))
			end	
	
			for i,v in pairs(UpperTorsoFrames) do	
				local Prefix = "UpperTorsos[".. tostring(i).. "]"	
				local Prefix2 = string.sub(Prefix,1,string.len(Prefix)-3)
				local Prefix3 = "	"
				if i == 1 then
					Prefix3 = "	local "..Prefix2.. " = {} \n	"
				end
				print(Prefix3..Prefix.. " = {}\n	"..Prefix.. ".Time = ".. tostring(v.Time).."\n	"..Prefix.. ".Length = ".. tostring(v.Length).."\n	"..Prefix.. ".EasingStyle = ".. tostring(v.EasingStyle).."\n	"..Prefix.. ".EasingDirection = ".. tostring(v.EasingDirection).. "\n	"..Prefix.. ".Transform = ".. v.Transform.. "\n	"..Prefix.. ".Weight = ".. tostring(v.Weight))
			end	
	
			for i,v in pairs(LeftHandFrames) do	
				local Prefix = "LeftHands[".. tostring(i).. "]"	
				local Prefix2 = string.sub(Prefix,1,string.len(Prefix)-3)
				local Prefix3 = "	"
				if i == 1 then
					Prefix3 = "	local "..Prefix2.. " = {} \n	"
				end
				print(Prefix3..Prefix.. " = {}\n	"..Prefix.. ".Time = ".. tostring(v.Time).."\n	"..Prefix.. ".Length = ".. tostring(v.Length).."\n	"..Prefix.. ".EasingStyle = ".. tostring(v.EasingStyle).."\n	"..Prefix.. ".EasingDirection = ".. tostring(v.EasingDirection).. "\n	"..Prefix.. ".Transform = ".. v.Transform.. "\n	"..Prefix.. ".Weight = ".. tostring(v.Weight))
			end	
	
			for i,v in pairs(LeftFootFrames) do	
				local Prefix = "LeftFoots[".. tostring(i).. "]"	
				local Prefix2 = string.sub(Prefix,1,string.len(Prefix)-3)
				local Prefix3 = "	"
				if i == 1 then
					Prefix3 = "	local "..Prefix2.. " = {} \n	"
				end
				print(Prefix3..Prefix.. " = {}\n	"..Prefix.. ".Time = ".. tostring(v.Time).."\n	"..Prefix.. ".Length = ".. tostring(v.Length).."\n	"..Prefix.. ".EasingStyle = ".. tostring(v.EasingStyle).."\n	"..Prefix.. ".EasingDirection = ".. tostring(v.EasingDirection).. "\n	"..Prefix.. ".Transform = ".. v.Transform.. "\n	"..Prefix.. ".Weight = ".. tostring(v.Weight))
			end	
	
			for i,v in pairs(RightFootFrames) do	
				local Prefix = "RightFoots[".. tostring(i).. "]"	
				local Prefix2 = string.sub(Prefix,1,string.len(Prefix)-3)
				local Prefix3 = "	"
				if i == 1 then
					Prefix3 = "	local "..Prefix2.. " = {} \n	"
				end
				print(Prefix3..Prefix.. " = {}\n	"..Prefix.. ".Time = ".. tostring(v.Time).."\n	"..Prefix.. ".Length = ".. tostring(v.Length).."\n	"..Prefix.. ".EasingStyle = ".. tostring(v.EasingStyle).."\n	"..Prefix.. ".EasingDirection = ".. tostring(v.EasingDirection).. "\n	"..Prefix.. ".Transform = ".. v.Transform.. "\n	"..Prefix.. ".Weight = ".. tostring(v.Weight))
			end	
	
			for i,v in pairs(RightLowerLegFrames) do	
				local Prefix = "RightLowerLegs[".. tostring(i).. "]"	
				local Prefix2 = string.sub(Prefix,1,string.len(Prefix)-3)
				local Prefix3 = "	"
				if i == 1 then
					Prefix3 = "	local "..Prefix2.. " = {} \n	"
				end
				print(Prefix3..Prefix.. " = {}\n	"..Prefix.. ".Time = ".. tostring(v.Time).."\n	"..Prefix.. ".Length = ".. tostring(v.Length).."\n	"..Prefix.. ".EasingStyle = ".. tostring(v.EasingStyle).."\n	"..Prefix.. ".EasingDirection = ".. tostring(v.EasingDirection).. "\n	"..Prefix.. ".Transform = ".. v.Transform.. "\n	"..Prefix.. ".Weight = ".. tostring(v.Weight))
			end	
	
			for i,v in pairs(RightUpperLegFrames) do	
				local Prefix = "RightUpperLegs[".. tostring(i).. "]"	
				local Prefix2 = string.sub(Prefix,1,string.len(Prefix)-3)
				local Prefix3 = "	"
				if i == 1 then
					Prefix3 = "	local "..Prefix2.. " = {} \n	"
				end
				print(Prefix3..Prefix.. " = {}\n	"..Prefix.. ".Time = ".. tostring(v.Time).."\n	"..Prefix.. ".Length = ".. tostring(v.Length).."\n	"..Prefix.. ".EasingStyle = ".. tostring(v.EasingStyle).."\n	"..Prefix.. ".EasingDirection = ".. tostring(v.EasingDirection).. "\n	"..Prefix.. ".Transform = ".. v.Transform.. "\n	"..Prefix.. ".Weight = ".. tostring(v.Weight))
			end	
	
			for i,v in pairs(HeadFrames) do	
				local Prefix = "Heads[".. tostring(i).. "]"	
				local Prefix2 = string.sub(Prefix,1,string.len(Prefix)-3)
				local Prefix3 = "	"
				if i == 1 then
					Prefix3 = "	local "..Prefix2.. " = {} \n	"
				end
				print(Prefix3..Prefix.. " = {}\n	"..Prefix.. ".Time = ".. tostring(v.Time).."\n	"..Prefix.. ".Length = ".. tostring(v.Length).."\n	"..Prefix.. ".EasingStyle = ".. tostring(v.EasingStyle).."\n	"..Prefix.. ".EasingDirection = ".. tostring(v.EasingDirection).. "\n	"..Prefix.. ".Transform = ".. v.Transform.. "\n	"..Prefix.. ".Weight = ".. tostring(v.Weight))
			end	
	
			for i,v in pairs(LowerTorsoFrames) do	
				local Prefix = "LowerTorsos[".. tostring(i).. "]"	
				local Prefix2 = string.sub(Prefix,1,string.len(Prefix)-3)
				local Prefix3 = "	"
				if i == 1 then
					Prefix3 = "	local "..Prefix2.. " = {} \n	"
				end
				print(Prefix3..Prefix.. " = {}\n	"..Prefix.. ".Time = ".. tostring(v.Time).."\n	"..Prefix.. ".Length = ".. tostring(v.Length).."\n	"..Prefix.. ".EasingStyle = ".. tostring(v.EasingStyle).."\n	"..Prefix.. ".EasingDirection = ".. tostring(v.EasingDirection).. "\n	"..Prefix.. ".Transform = ".. v.Transform.. "\n	"..Prefix.. ".Weight = ".. tostring(v.Weight))
			end	
	
			for i,v in pairs(LeftLowerLegFrames) do	
				local Prefix = "LeftLowerLegs[".. tostring(i).. "]"	
				local Prefix2 = string.sub(Prefix,1,string.len(Prefix)-3)
				local Prefix3 = "	"
				if i == 1 then
					Prefix3 = "	local "..Prefix2.. " = {} \n	"
				end
				print(Prefix3..Prefix.. " = {}\n	"..Prefix.. ".Time = ".. tostring(v.Time).."\n	"..Prefix.. ".Length = ".. tostring(v.Length).."\n	"..Prefix.. ".EasingStyle = ".. tostring(v.EasingStyle).."\n	"..Prefix.. ".EasingDirection = ".. tostring(v.EasingDirection).. "\n	"..Prefix.. ".Transform = ".. v.Transform.. "\n	"..Prefix.. ".Weight = ".. tostring(v.Weight))
			end	
	
			for i,v in pairs(RightLowerArmFrames) do	
				local Prefix = "RightLowerArms[".. tostring(i).. "]"	
				local Prefix2 = string.sub(Prefix,1,string.len(Prefix)-3)
				local Prefix3 = "	"
				if i == 1 then
					Prefix3 = "	local "..Prefix2.. " = {} \n	"
				end
				print(Prefix3..Prefix.. " = {}\n	"..Prefix.. ".Time = ".. tostring(v.Time).."\n	"..Prefix.. ".Length = ".. tostring(v.Length).."\n	"..Prefix.. ".EasingStyle = ".. tostring(v.EasingStyle).."\n	"..Prefix.. ".EasingDirection = ".. tostring(v.EasingDirection).. "\n	"..Prefix.. ".Transform = ".. v.Transform.. "\n	"..Prefix.. ".Weight = ".. tostring(v.Weight))
			end	
	
			for i,v in pairs(LeftUpperLegFrames) do	
				local Prefix = "LeftUpperLegs[".. tostring(i).. "]"	
				local Prefix2 = string.sub(Prefix,1,string.len(Prefix)-3)
				local Prefix3 = "	"
				if i == 1 then
					Prefix3 = "	local "..Prefix2.. " = {} \n	"
				end
				print(Prefix3..Prefix.. " = {}\n	"..Prefix.. ".Time = ".. tostring(v.Time).."\n	"..Prefix.. ".Length = ".. tostring(v.Length).."\n	"..Prefix.. ".EasingStyle = ".. tostring(v.EasingStyle).."\n	"..Prefix.. ".EasingDirection = ".. tostring(v.EasingDirection).. "\n	"..Prefix.. ".Transform = ".. v.Transform.. "\n	"..Prefix.. ".Weight = ".. tostring(v.Weight))
			end	
	
			print("\n	return LeftLowerArms,RightHands,RightUpperArms,LeftUpperArms,UpperTorsos,LeftHands,LeftFoots,RightFoots,RightLowerLegs,RightUpperLegs,Heads,LowerTorsos,LeftLowerLegs,RightLowerArms,LeftUpperLegs")	
			print("end \n")	
	
			--Parsing for each
			print("function ".. Sequence.Name .. "Play()")	
			print("	Transforms[LeftLowerArm][2] = true")	
			print("	Transforms[RightHand][2] = true")	
			print("	Transforms[RightUpperArm][2] = true")	
			print("	Transforms[LeftUpperArm][2] = true")	
			print("	Transforms[UpperTorso][2] = true")	
			print("	Transforms[LeftHand][2] = true")	
			print("	Transforms[LeftFoot][2] = true")	
			print("	Transforms[RightFoot][2] = true")	
			print("	Transforms[RightLowerLeg][2] = true")	
			print("	Transforms[RightUpperLeg][2] = true")	
			print("	Transforms[Head][2] = true")	
			print("	Transforms[LowerTorso][2] = true")	
			print("	Transforms[LeftLowerLeg][2] = true")	
			print("	Transforms[RightLowerArm][2] = true")	
			print("	Transforms[LeftUpperLeg][2] = true")	
	
			--Tables for the Actual animation
			print("	local  LeftLowerArms,RightHands,RightUpperArms,LeftUpperArms,UpperTorsos,LeftHands,LeftFoots,RightFoots,RightLowerLegs,RightUpperLegs,Heads,LowerTorsos,LeftLowerLegs,RightLowerArms,LeftUpperLegs = ".. Sequence.Name.."()")	
	
			--LeftLowerArmPlay
			print("	coroutine.wrap(function()")
			print("		local LS = tick()")
			print("		local leftOver = 0")
			print("		for i, v in pairs(LeftLowerArms) do")
			print("			local Targ = Transforms[LeftLowerArm][1]")
			print("			local TG = {}")
			print("			TG.Value = v.Transform")
			print("			local T = TweenService:Create(Targ,TweenInfo.new(v.Length,v.EasingStyle,v.EasingDirection),TG)")
			print("			T:Play()")
			print("			local garbage = (tick() - LS)")
			print("			local waitTime = v.Length - garbage")
			print("			waitTime = waitTime - leftOver")
			print("			waitTime = waitTime")
			print("			if waitTime > 0 then")
			print("				leftOver = wait(waitTime) - waitTime")
			print("			else")
			print("				waitTime = waitTime")
			print("				leftOver = math.abs(waitTime)")
			print("			end")
			print("			--wait")
			print("			LS = tick()")
			print("			T:Cancel()")
			print("			Targ.Value = v.Transform")
			print("		end")
			print("	end)()")	
	
			--RightHandPlay
			print("	coroutine.wrap(function()")
			print("		local LS = tick()")
			print("		local leftOver = 0")
			print("		for i, v in pairs(RightHands) do")
			print("			local Targ = Transforms[RightHand][1]")
			print("			local TG = {}")
			print("			TG.Value = v.Transform")
			print("			local T = TweenService:Create(Targ,TweenInfo.new(v.Length,v.EasingStyle,v.EasingDirection),TG)")
			print("			T:Play()")
			print("			local garbage = (tick() - LS)")
			print("			local waitTime = v.Length - garbage")
			print("			waitTime = waitTime - leftOver")
			print("			waitTime = waitTime")
			print("			if waitTime > 0 then")
			print("				leftOver = wait(waitTime) - waitTime")
			print("			else")
			print("				waitTime = waitTime")
			print("				leftOver = math.abs(waitTime)")
			print("			end")
			print("			--wait")
			print("			LS = tick()")
			print("			T:Cancel()")
			print("			Targ.Value = v.Transform")
			print("		end")
			print("	end)()")	
	
			--RightUpperArmPlay
			print("	coroutine.wrap(function()")
			print("		local LS = tick()")
			print("		local leftOver = 0")
			print("		for i, v in pairs(RightUpperArms) do")
			print("			local Targ = Transforms[RightUpperArm][1]")
			print("			local TG = {}")
			print("			TG.Value = v.Transform")
			print("			local T = TweenService:Create(Targ,TweenInfo.new(v.Length,v.EasingStyle,v.EasingDirection),TG)")
			print("			T:Play()")
			print("			local garbage = (tick() - LS)")
			print("			local waitTime = v.Length - garbage")
			print("			waitTime = waitTime - leftOver")
			print("			waitTime = waitTime")
			print("			if waitTime > 0 then")
			print("				leftOver = wait(waitTime) - waitTime")
			print("			else")
			print("				waitTime = waitTime")
			print("				leftOver = math.abs(waitTime)")
			print("			end")
			print("			--wait")
			print("			LS = tick()")
			print("			T:Cancel()")
			print("			Targ.Value = v.Transform")
			print("		end")
			print("	end)()")	
	
			--LeftUpperArmPlay
			print("	coroutine.wrap(function()")
			print("		local LS = tick()")
			print("		local leftOver = 0")
			print("		for i, v in pairs(LeftUpperArms) do")
			print("			local Targ = Transforms[LeftUpperArm][1]")
			print("			local TG = {}")
			print("			TG.Value = v.Transform")
			print("			local T = TweenService:Create(Targ,TweenInfo.new(v.Length,v.EasingStyle,v.EasingDirection),TG)")
			print("			T:Play()")
			print("			local garbage = (tick() - LS)")
			print("			local waitTime = v.Length - garbage")
			print("			waitTime = waitTime - leftOver")
			print("			waitTime = waitTime")
			print("			if waitTime > 0 then")
			print("				leftOver = wait(waitTime) - waitTime")
			print("			else")
			print("				waitTime = waitTime")
			print("				leftOver = math.abs(waitTime)")
			print("			end")
			print("			--wait")
			print("			LS = tick()")
			print("			T:Cancel()")
			print("			Targ.Value = v.Transform")
			print("		end")
			print("	end)()")	
	
			--UpperTorsoPlay
			print("	coroutine.wrap(function()")
			print("		local LS = tick()")
			print("		local leftOver = 0")
			print("		for i, v in pairs(UpperTorsos) do")
			print("			local Targ = Transforms[UpperTorso][1]")
			print("			local TG = {}")
			print("			TG.Value = v.Transform")
			print("			local T = TweenService:Create(Targ,TweenInfo.new(v.Length,v.EasingStyle,v.EasingDirection),TG)")
			print("			T:Play()")
			print("			local garbage = (tick() - LS)")
			print("			local waitTime = v.Length - garbage")
			print("			waitTime = waitTime - leftOver")
			print("			waitTime = waitTime")
			print("			if waitTime > 0 then")
			print("				leftOver = wait(waitTime) - waitTime")
			print("			else")
			print("				waitTime = waitTime")
			print("				leftOver = math.abs(waitTime)")
			print("			end")
			print("			--wait")
			print("			LS = tick()")
			print("			T:Cancel()")
			print("			Targ.Value = v.Transform")
			print("		end")
			print("	end)()")	
	
			--LeftHandPlay
			print("	coroutine.wrap(function()")
			print("		local LS = tick()")
			print("		local leftOver = 0")
			print("		for i, v in pairs(LeftHands) do")
			print("			local Targ = Transforms[LeftHand][1]")
			print("			local TG = {}")
			print("			TG.Value = v.Transform")
			print("			local T = TweenService:Create(Targ,TweenInfo.new(v.Length,v.EasingStyle,v.EasingDirection),TG)")
			print("			T:Play()")
			print("			local garbage = (tick() - LS)")
			print("			local waitTime = v.Length - garbage")
			print("			waitTime = waitTime - leftOver")
			print("			waitTime = waitTime")
			print("			if waitTime > 0 then")
			print("				leftOver = wait(waitTime) - waitTime")
			print("			else")
			print("				waitTime = waitTime")
			print("				leftOver = math.abs(waitTime)")
			print("			end")
			print("			--wait")
			print("			LS = tick()")
			print("			T:Cancel()")
			print("			Targ.Value = v.Transform")
			print("		end")
			print("	end)()")	
	
			--LeftFootPlay
			print("	coroutine.wrap(function()")
			print("		local LS = tick()")
			print("		local leftOver = 0")
			print("		for i, v in pairs(LeftFoots) do")
			print("			local Targ = Transforms[LeftFoot][1]")
			print("			local TG = {}")
			print("			TG.Value = v.Transform")
			print("			local T = TweenService:Create(Targ,TweenInfo.new(v.Length,v.EasingStyle,v.EasingDirection),TG)")
			print("			T:Play()")
			print("			local garbage = (tick() - LS)")
			print("			local waitTime = v.Length - garbage")
			print("			waitTime = waitTime - leftOver")
			print("			waitTime = waitTime")
			print("			if waitTime > 0 then")
			print("				leftOver = wait(waitTime) - waitTime")
			print("			else")
			print("				waitTime = waitTime")
			print("				leftOver = math.abs(waitTime)")
			print("			end")
			print("			--wait")
			print("			LS = tick()")
			print("			T:Cancel()")
			print("			Targ.Value = v.Transform")
			print("		end")
			print("	end)()")	
	
			--RightFootPlay
			print("	coroutine.wrap(function()")
			print("		local LS = tick()")
			print("		local leftOver = 0")
			print("		for i, v in pairs(RightFoots) do")
			print("			local Targ = Transforms[RightFoot][1]")
			print("			local TG = {}")
			print("			TG.Value = v.Transform")
			print("			local T = TweenService:Create(Targ,TweenInfo.new(v.Length,v.EasingStyle,v.EasingDirection),TG)")
			print("			T:Play()")
			print("			local garbage = (tick() - LS)")
			print("			local waitTime = v.Length - garbage")
			print("			waitTime = waitTime - leftOver")
			print("			waitTime = waitTime")
			print("			if waitTime > 0 then")
			print("				leftOver = wait(waitTime) - waitTime")
			print("			else")
			print("				waitTime = waitTime")
			print("				leftOver = math.abs(waitTime)")
			print("			end")
			print("			--wait")
			print("			LS = tick()")
			print("			T:Cancel()")
			print("			Targ.Value = v.Transform")
			print("		end")
			print("	end)()")	
	
			--RightLowerLegPlay
			print("	coroutine.wrap(function()")
			print("		local LS = tick()")
			print("		local leftOver = 0")
			print("		for i, v in pairs(RightLowerLegs) do")
			print("			local Targ = Transforms[RightLowerLeg][1]")
			print("			local TG = {}")
			print("			TG.Value = v.Transform")
			print("			local T = TweenService:Create(Targ,TweenInfo.new(v.Length,v.EasingStyle,v.EasingDirection),TG)")
			print("			T:Play()")
			print("			local garbage = (tick() - LS)")
			print("			local waitTime = v.Length - garbage")
			print("			waitTime = waitTime - leftOver")
			print("			waitTime = waitTime")
			print("			if waitTime > 0 then")
			print("				leftOver = wait(waitTime) - waitTime")
			print("			else")
			print("				waitTime = waitTime")
			print("				leftOver = math.abs(waitTime)")
			print("			end")
			print("			--wait")
			print("			LS = tick()")
			print("			T:Cancel()")
			print("			Targ.Value = v.Transform")
			print("		end")
			print("	end)()")	
	
			--RightUpperLegPlay
			print("	coroutine.wrap(function()")
			print("		local LS = tick()")
			print("		local leftOver = 0")
			print("		for i, v in pairs(RightUpperLegs) do")
			print("			local Targ = Transforms[RightUpperLeg][1]")
			print("			local TG = {}")
			print("			TG.Value = v.Transform")
			print("			local T = TweenService:Create(Targ,TweenInfo.new(v.Length,v.EasingStyle,v.EasingDirection),TG)")
			print("			T:Play()")
			print("			local garbage = (tick() - LS)")
			print("			local waitTime = v.Length - garbage")
			print("			waitTime = waitTime - leftOver")
			print("			waitTime = waitTime")
			print("			if waitTime > 0 then")
			print("				leftOver = wait(waitTime) - waitTime")
			print("			else")
			print("				waitTime = waitTime")
			print("				leftOver = math.abs(waitTime)")
			print("			end")
			print("			--wait")
			print("			LS = tick()")
			print("			T:Cancel()")
			print("			Targ.Value = v.Transform")
			print("		end")
			print("	end)()")	
	
			--HeadPlay
			print("	coroutine.wrap(function()")
			print("		local LS = tick()")
			print("		local leftOver = 0")
			print("		for i, v in pairs(Heads) do")
			print("			local Targ = Transforms[Head][1]")
			print("			local TG = {}")
			print("			TG.Value = v.Transform")
			print("			local T = TweenService:Create(Targ,TweenInfo.new(v.Length,v.EasingStyle,v.EasingDirection),TG)")
			print("			T:Play()")
			print("			local garbage = (tick() - LS)")
			print("			local waitTime = v.Length - garbage")
			print("			waitTime = waitTime - leftOver")
			print("			waitTime = waitTime")
			print("			if waitTime > 0 then")
			print("				leftOver = wait(waitTime) - waitTime")
			print("			else")
			print("				waitTime = waitTime")
			print("				leftOver = math.abs(waitTime)")
			print("			end")
			print("			--wait")
			print("			LS = tick()")
			print("			T:Cancel()")
			print("			Targ.Value = v.Transform")
			print("		end")
			print("	end)()")	
	
			--LowerTorsoPlay
			print("	coroutine.wrap(function()")
			print("		local LS = tick()")
			print("		local leftOver = 0")
			print("		for i, v in pairs(LowerTorsos) do")
			print("			local Targ = Transforms[LowerTorso][1]")
			print("			local TG = {}")
			print("			TG.Value = v.Transform")
			print("			local T = TweenService:Create(Targ,TweenInfo.new(v.Length,v.EasingStyle,v.EasingDirection),TG)")
			print("			T:Play()")
			print("			local garbage = (tick() - LS)")
			print("			local waitTime = v.Length - garbage")
			print("			waitTime = waitTime - leftOver")
			print("			waitTime = waitTime")
			print("			if waitTime > 0 then")
			print("				leftOver = wait(waitTime) - waitTime")
			print("			else")
			print("				waitTime = waitTime")
			print("				leftOver = math.abs(waitTime)")
			print("			end")
			print("			--wait")
			print("			LS = tick()")
			print("			T:Cancel()")
			print("			Targ.Value = v.Transform")
			print("		end")
			print("	end)()")	
	
			--LeftLowerLegPlay
			print("	coroutine.wrap(function()")
			print("		local LS = tick()")
			print("		local leftOver = 0")
			print("		for i, v in pairs(LeftLowerLegs) do")
			print("			local Targ = Transforms[LeftLowerLeg][1]")
			print("			local TG = {}")
			print("			TG.Value = v.Transform")
			print("			local T = TweenService:Create(Targ,TweenInfo.new(v.Length,v.EasingStyle,v.EasingDirection),TG)")
			print("			T:Play()")
			print("			local garbage = (tick() - LS)")
			print("			local waitTime = v.Length - garbage")
			print("			waitTime = waitTime - leftOver")
			print("			waitTime = waitTime")
			print("			if waitTime > 0 then")
			print("				leftOver = wait(waitTime) - waitTime")
			print("			else")
			print("				waitTime = waitTime")
			print("				leftOver = math.abs(waitTime)")
			print("			end")
			print("			--wait")
			print("			LS = tick()")
			print("			T:Cancel()")
			print("			Targ.Value = v.Transform")
			print("		end")
			print("	end)()")	
	
			--RightLowerArmPlay
			print("	coroutine.wrap(function()")
			print("		local LS = tick()")
			print("		local leftOver = 0")
			print("		for i, v in pairs(RightLowerArms) do")
			print("			local Targ = Transforms[RightLowerArm][1]")
			print("			local TG = {}")
			print("			TG.Value = v.Transform")
			print("			local T = TweenService:Create(Targ,TweenInfo.new(v.Length,v.EasingStyle,v.EasingDirection),TG)")
			print("			T:Play()")
			print("			local garbage = (tick() - LS)")
			print("			local waitTime = v.Length - garbage")
			print("			waitTime = waitTime - leftOver")
			print("			waitTime = waitTime")
			print("			if waitTime > 0 then")
			print("				leftOver = wait(waitTime) - waitTime")
			print("			else")
			print("				waitTime = waitTime")
			print("				leftOver = math.abs(waitTime)")
			print("			end")
			print("			--wait")
			print("			LS = tick()")
			print("			T:Cancel()")
			print("			Targ.Value = v.Transform")
			print("		end")
			print("	end)()")	
	
			--LeftUpperLegPlay
			print("	coroutine.wrap(function()")
			print("		local LS = tick()")
			print("		local leftOver = 0")
			print("		for i, v in pairs(LeftUpperLegs) do")
			print("			local Targ = Transforms[LeftUpperLeg][1]")
			print("			local TG = {}")
			print("			TG.Value = v.Transform")
			print("			local T = TweenService:Create(Targ,TweenInfo.new(v.Length,v.EasingStyle,v.EasingDirection),TG)")
			print("			T:Play()")
			print("			local garbage = (tick() - LS)")
			print("			local waitTime = v.Length - garbage")
			print("			waitTime = waitTime - leftOver")
			print("			waitTime = waitTime")
			print("			if waitTime > 0 then")
			print("				leftOver = wait(waitTime) - waitTime")
			print("			else")
			print("				waitTime = waitTime")
			print("				leftOver = math.abs(waitTime)")
			print("			end")
			print("			--wait")
			print("			LS = tick()")
			print("			T:Cancel()")
			print("			Targ.Value = v.Transform")
			print("		end")
			print("	end)()")	
			print("	wait("..TotalTime..")")	
	
			print("	Transforms[LeftLowerArm][2] = false")	
			print("	Transforms[RightHand][2] = false")	
			print("	Transforms[RightUpperArm][2] = false")	
			print("	Transforms[LeftUpperArm][2] = false")	
			print("	Transforms[UpperTorso][2] = false")	
			print("	Transforms[LeftHand][2] = false")	
			print("	Transforms[LeftFoot][2] = false")	
			print("	Transforms[RightFoot][2] = false")	
			print("	Transforms[RightLowerLeg][2] = false")	
			print("	Transforms[RightUpperLeg][2] = false")	
			print("	Transforms[Head][2] = false")	
			print("	Transforms[LowerTorso][2] = false")	
			print("	Transforms[LeftLowerLeg][2] = false")	
			print("	Transforms[RightLowerArm][2] = false")	
			print("	Transforms[LeftUpperLeg][2] = false")	
			print("end")	
		end
	end
end)