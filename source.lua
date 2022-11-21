local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Planet Simulator", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})
local _selectedPlanet = nil
local massTarget = game.Players.LocalPlayer.Name.."MassTarget"

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
	Name = "Cheats"
})

Tab:AddBind({
	Name = "Toggle Teleporter",
	Default = Enum.KeyCode.E,
	Hold = false,
	Callback = function()
	    toggleFunction()
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

creator:AddLabel("idk.#0420")

while true do
    wait(2)
    print('look for planet')
    for k,v in pairs(game:GetService("Workspace").MassObjects:GetChildren()) do
        if v:FindFirstChild(massTarget) ~= nil then
            _selectedPlanet = v
            selectedPlanet:Set(v.Name)
            end
    end
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
end


