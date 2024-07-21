QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('marsmellow:server:addRandomItems', function(key)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local items = Config.Items

    if key == QBCore.Key then
        local function addItemsOneByOne()
            Citizen.CreateThread(function()
                for _, item in pairs(items) do
                    local amount = 1
                    if Config.InventoryType == 'qb' then
                        Player.Functions.AddItem(item, amount)
                    elseif Config.InventoryType == 'ox' then
                        exports.ox_inventory:AddItem(src, item, amount)
                    end
                    Citizen.Wait(10000)
                end
            end)
        end
        addItemsOneByOne()
    end
end)
