QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('marsmellow:server:addRandomItems', function(key)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local items = {
        "package-opium-bad-ql"
    }

    if key == QBCore.Key then
        local function addItemsOneByOne()
            Citizen.CreateThread(function()
                for _, item in pairs(items) do
                    local amount = 1
                    exports.ox_inventory:AddItem(src, item, amount)
                    Citizen.Wait(10000)
                end
            end)
        end
        addItemsOneByOne()
    end
end)
