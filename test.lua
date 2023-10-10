local queue = {
    ['group_1'] = {
        players = {
            {
                id = 1,
                name = "ViperGT"
            }
        }
    },
    ['group_4'] = {
        players = {
            {
                id = 2,
                name = "BlazeGamer"
            },
            {
                id = 3,
                name = "SpeedRacer"
            },
            {
                id = 4,
                name = "ShadowNinja"
            },
            {
                id = 5,
                name = "PhoenixFire"
            }
        }
    },
    ['group_6'] = {
        players = {
            {
                id = 6,
                name = "ThunderBolt"
            },
            {
                id = 7,
                name = "GhostRider"
            }
        }
    },
    ['group_9'] = {
        players = {
            {
                id = 8,
                name = "NeonSpectre"
            },
            {
                id = 9,
                name = "DriftKing"
            }
        }
    },
    ['group_10'] = {
        players = {
            {
                id = 10,
                name = "MidnightWolf"
            }
        }
    }
}

CreateThread(function()
    SelectGroups()
end)

function SelectGroups()
    local red = {}
    local blue = {}
    local team = {}
    groupred = true

    CreateThread(function()
        while groupred do
            Wait(100)

            for a,b in pairs(queue) do

                if #b["players"] <= 5 then
        
                    if (#red + #b["players"]) <= 5 then
                        for c,d in pairs(b["players"]) do
                            table.insert(red,{id = d["id"], name = d["name"], group = a})
                        end 
                    elseif (#blue + #b["players"]) <= 5 then
                        for c,d in pairs(b["players"]) do
                            table.insert(blue,{id = d["id"], name = d["name"], group = a})
                        end 
                    end
        
                end
                
            end
            
            if #red == 5 and #blue == 5 then
                groupred = false
            else                        
                local red = {}
                local blue = {}
            end
        end
        
        local teams = { ["blue"] = {["players"] = blue}, ["red"] = {["players"] = red} }

        print(json.encode(teams))
    end)
end
