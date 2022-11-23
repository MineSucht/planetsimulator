local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Planet Simulator", HidePremium = false, SaveConfig = false, ConfigFolder = "planetsimulator"})
local _selectedPlanet = nil
local massTarget = game.Players.LocalPlayer.Name.."MassTarget"
local popups = false
local rebirth = false
local rebirthType = "Brown Dwarf"
local Tab = Window:MakeTab({
	Name = "Cheats",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
toggleFunction = function()
    if _selectedPlanet == nil then
	        OrionLib:MakeNotification({
        	Name = "Teleporter",
        	Content = "No Planet Selected!",
        	Image = "rbxassetid://4483345998",
        	Time = 2
            })
	     return   
	    end
		toggle = not toggle
		if toggle then
		    OrionLib:MakeNotification({
        	Name = "Teleporter",
        	Content = "Activated!",
        	Image = "rbxassetid://4483345998",
        	Time = 2
            })
        else
            OrionLib:MakeNotification({
        	Name = "Teleporter",
        	Content = "Deactivated!",
        	Image = "rbxassetid://4483345998",
        	Time = 2
            })
		end
end

local Section = Tab:AddSection({
	Name = "Selected Planet"
})

local selectedPlanet = Section:AddLabel("No Selected Planet!")

local Section = Tab:AddSection({
	Name = "Functions"
})

Section:AddBind({
	Name = "Toggle Teleporter",
	Default = Enum.KeyCode.E,
	Hold = false,
	Callback = function()
	    toggleFunction()
	end
})


Section:AddToggle({
	Name = "Toggle Auto Popups",
	Default = false,
	Callback = function()
		popups = not popups
	end
})

local rebirth = Tab:AddSection({
	Name = "Rebirth"
})

rebirth:AddDropdown({
	Name = "Select Rebirth Planet",
	Default = "Brown Dwarf",
	Options = {"Brown Dwarf","Red Dwarf","Blue Dwarf","Protostar","Star","Red Giant","Blue Giant",
	"Red Supergiant","Blue Supergiant","Red Hypergiant","Blue Hypergiant","White Dwarf",
	"Nebula","Solar System","Neutron Star","Pulsar","Black Hole","Supermassive Black Hole",
	"Small Galaxy","Galaxy","Giant Galaxy","Supergiant Galaxy","Universe","Multiverse","Infinity"
	},
	Callback = function(Value)
		rebirthType = Value
	end    
})
rebirth:AddToggle({
	Name = "Toggle Auto Rebirth",
	Default = false,
	Callback = function()
		rebirth = not rebirth
	end
})
local Tab2 = Window:MakeTab({
	Name = "Credits",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local creator = Tab2:AddSection({
	Name = "Creator"
})

creator:AddLabel("idk.#0420")

Tab2:AddButton({
	Name = "Quit",
	Callback = function()
	toggle = false
      	OrionLib:Destroy()
  	end    
})

-- INSTANT LOOP
task.spawn(function()
    -- Load up Values
    popups = false
	rebirth = false
	wait(2)
	while wait() do
		-- Auto Popup
		if popups then
			if game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.advancementPopup.Size.X.Offset >= 1 then
				game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.advancementPopup.Visible = false
				game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.advancementPopup.Size = UDim2.new(0,0,0,0)
			end
		end
		-- Search for Planets
		for k,v in pairs(game:GetService("Workspace").MassObjects:GetChildren()) do
			if v:FindFirstChild(massTarget) ~= nil then
				_selectedPlanet = v
				selectedPlanet:Set(v.Name)
				end
		end
	end
end)

-- 2 SECONDS LOOP
task.spawn(function()
	wait(2)
	while wait(2) do
		-- Teleporter 
		if toggle then
			if _selectedPlanet ~= nil then
				if _selectedPlanet:FindFirstChild(massTarget) ~= nil then
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = _selectedPlanet[massTarget].Hitbox.CFrame
					else
					toggle = false
					OrionLib:MakeNotification({
					Name = "Teleporter",
					Content = "No Planet Selected!",
					Image = "rbxassetid://4483345998",
					Time = 2
					})
					end
					else
					toggle = false
					OrionLib:MakeNotification({
					Name = "Teleporter",
					Content = "No Planet Selected!",
					Image = "rbxassetid://4483345998",
					Time = 2
					})
			end
		end
		if rebirth then
			if game.Players.LocalPlayer.leaderstats.Rank.Value == rebirthType then
				game.ReplicatedStorage.SupernovaFunction:InvokeServer()
				OrionLib:MakeNotification({
					Name = "Auto Rebirth",
					Content = "You did a Supernova",
					Image = "rbxassetid://4483345998",
					Time = 2
					})
			end
		end
	end
end)
