local JointList = {
	[1] = {["Name"] = "RightUpperArm",["Acronym"] = "RUA", ["Limb"] = "RightUpperArm"},
	[2] = {["Name"] = "LeftUpperArm",["Acronym"] = "LUA", ["Limb"] = "LeftUpperArm"},
	[3] = {["Name"] = "LowerTorso",["Acronym"] = "LT", ["Limb"] = "LowerTorso"},
	[4] = {["Name"] = "UpperTorso",["Acronym"] = "UT", ["Limb"] = "UpperTorso"},
	[5] = {["Name"] = "RightLowerLeg",["Acronym"] = "RLL", ["Limb"] = "RightLowerLeg"},
	[6] = {["Name"] = "LeftLowerLeg",["Acronym"] = "LLL", ["Limb"] = "LeftLowerLeg"},
	[7] = {["Name"] = "RightHand",["Acronym"] = "RH", ["Limb"] = "RightHand"},
	[8] = {["Name"] = "LeftHand",["Acronym"] = "LH", ["Limb"] = "LeftHand"},
	[9] = {["Name"] = "RightFoot",["Acronym"] = "RF", ["Limb"] = "RightFoot"},
	[10] = {["Name"] = "RightUpperLeg",["Acronym"] = "RUL", ["Limb"] = "RightUpperLeg"},
	[11] = {["Name"] = "LeftUpperLeg",["Acronym"] = "LUL", ["Limb"] = "LeftUpperLeg"},
	[12] = {["Name"] = "RightLowerArm",["Acronym"] = "RLA", ["Limb"] = "RightLowerArm"},
	[13] = {["Name"] = "LeftLowerArm",["Acronym"] = "LLA", ["Limb"] = "LeftLowerArm"},
	[14] = {["Name"] = "Head",["Acronym"] = "H", ["Limb"] = "Head"},
	[15] = {["Name"] = "LeftFoot",["Acronym"] = "LF", ["Limb"] = "LeftFoot"}
}

--
print([[-------------------------------------------------------------]])

print([[
button.Click:connect(function()
	for oppA,Sequence in pairs(game:GetService("Selection"):Get()) do
		if not Sequence:IsA("KeyframeSequence") then
			Error()
		else
			local keyframes = Sequence:GetKeyframes()
			table.sort(keyframes,KeyframeSort)
			local TotalTime = keyframes[#keyframes].Time
			
			--Getting Limb Frames
			local LimbsKeyframes = {}]])
			for i, Joint in pairs(JointList) do
				print("			local "..Joint.Name.."Frames = {}")
			end
			print("")
			print([[
			for i,  v in pairs(keyframes) do]])
			for i, Joint in pairs(JointList) do
				if i ~= 1 then
					print("")
				end
				print([[				local ]].. Joint.Acronym ..[[ = v:FindFirstChild("]].. Joint.Limb ..[[",true)]])
				print(
					[[				if ]].. Joint.Acronym ..[[ then]])
				print([[					local returning = {]].. Joint.Acronym .. [[}]])
				print([[
					if returning[1].Weight > 0 then
						returning.Time = v.Time
						local style = ]].. Joint.Acronym ..[[.EasingStyle.Name
						local direction = nil
						if style == "Cubic" then
							style = "Quad"
						elseif style == "Constant" then
							style = "Quint"
							if ]].. Joint.Acronym ..[[.EasingDirection.Value < 3 then
								direction = Enum.EasingDirection.Out
							end
						end
						assert(loadstring("b = Enum.EasingStyle."..style))()
						returning.EasingStyle = b
						if direction == nil then
							direction = ]].. Joint.Acronym ..[[.EasingDirection.Value
						end
						returning.EasingDirection = direction
						returning.Weight = returning[1].Weight
						returning.Transform = "CFrame.new(".. tostring(]].. Joint.Acronym .. [[.CFrame)..")"]]
				)
				local jF = Joint.Name.."Frames"
				print([[						]].. jF .."[#".. jF .. "+1] = returning")
				print([[					end
				end]])
			end
			print("			end")
			print("")
			
			print("			LimbsKeyframes = {")
			for i, Joint in pairs(JointList) do
				local jF = Joint.Name.."Frames"
				local str = "				".. jF .. ","
				if i == #JointList then
					str = "				".. jF
				end
				print(str)
			end
			print([[			}]])
			print([[

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
			
			print("function ".. Sequence.Name .. "()")]])
			
			for i, Joint in pairs(JointList) do
				local jF = Joint.Name.."Frames"
				print("")
				print([[			for i,v in pairs(]].. jF ..[[) do]])
				print([[				local Prefix = "]].. Joint.Name .. [[s[".. tostring(i).. "]"]])
				print(
					[[				local Prefix2 = string.sub(Prefix,1,string.len(Prefix)-3)
				local Prefix3 = "	"
				if i == 1 then
					Prefix3 = "	local "..Prefix2.. " = {} \n	"
				end
				print(Prefix3..Prefix.. " = {}\n	"..Prefix.. ".Time = ".. tostring(v.Time).."\n	"..Prefix.. ".Length = ".. tostring(v.Length).."\n	"..Prefix.. ".EasingStyle = ".. tostring(v.EasingStyle).."\n	"..Prefix.. ".EasingDirection = ".. tostring(v.EasingDirection).. "\n	"..Prefix.. ".Transform = ".. v.Transform.. "\n	"..Prefix.. ".Weight = ".. tostring(v.Weight))
			end]])
			end
			
			print("")

			local longSTR = [[print("\n	return ]]
			for i, Joint in pairs(JointList) do
				longSTR = longSTR .. Joint.Name .. "s,"
			end
			longSTR = string.sub(longSTR,1,string.len(longSTR)-1)
			longSTR = longSTR..[[")]]
			print("			".. longSTR)
			print([[			print("end \n")]])
			
			print("")
			print([[
			--Parsing for each
			print("function ".. Sequence.Name .. "Play()")]])
			for i, Joint in pairs(JointList) do
				print([[			print("	Transforms[]].. Joint.Name.. [[][2] = true")]])
			end
			longSTR = string.sub(longSTR,17)
			longSTR = string.sub(longSTR,1,string.len(longSTR)-2)
			longSTR = [[	local ]].. longSTR .. [[ = ".. Sequence.Name.."()")]]
			print("")
			print([[
			--Tables for the Actual animation
			print("]].. longSTR)

			for i, Joint in pairs(JointList) do
				print("")
				print([[
			--]].. Joint.Name ..[[Play
			print("	coroutine.wrap(function()")
			print("		local LS = tick()")
			print("		local leftOver = 0")
			print("		for i, v in pairs(]].. Joint.Name ..[[s) do")
			print("			local Targ = Transforms[]].. Joint.Name ..[[][1]")
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
			print("	end)()")]])
			end
			print([[
			print("	wait("..TotalTime..")")]])
			
			print("")
			for i, Joint in pairs(JointList) do
				print([[			print("	Transforms[]].. Joint.Name.. [[][2] = false")]])
			end
			print([[
			print("end")]])
		print([[
		end
	end
end)
]])

local tool1 = true
local tool2 = true
local tool3 = true

if tool1 then

	print("-------------------------------------------------------------\n")

	print([[function CreateTransform(Parent)
	local Trans = Instance.new("CFrameValue",Parent)
	Trans.Name = "Transformation"
	
	return Trans
end]])

	print([[Transforms = {}

	]])
	for i, Joint in pairs(JointList) do
		print("Transforms[".. Joint.Name.. "] = {CreateTransform(".. Joint.Name.. "),false}")
	end

end

if tool2 then

print("-------------------------------------------------------------\n")

print([[game:GetService("RunService").Stepped:connect(function(Time,deltaTime)
	prevDeltaTime = deltaTime]])
for i, Joint in pairs(JointList) do
	print("	if Transforms[".. Joint.Name.. "][2] then")
	print("		"..Joint.Name..".Transform = Transforms[".. Joint.Limb.. "][1].Value")
	print("	end")
end
print("end)")

end

if tool3 then
print("-------------------------------------------------------------\n")

for i, Joint in pairs(JointList) do
	print(Joint.Name.. ' = char:WaitForChild("'.. Joint.Name ..'"):WaitForChild("")')
end

end