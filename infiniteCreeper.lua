-- Infinite Creeper Gold
-- TES3MP 0.8.1

local CREEPER_REF_ID = "scamp_creeper"
local CREEPER_GOLD = 999999

customEventHooks.registerValidator("OnObjectDialogueChoice",
    function(eventStatus, pid, cellDescription, objects)

        if Players[pid] == nil or not Players[pid]:IsLoggedIn() then
            return
        end

        for uniqueIndex, object in pairs(objects) do

            -- Only affect Creeper
            if object.refId == CREEPER_REF_ID then

                -- Dialogue choice type 3 = Barter
                if object.dialogueChoiceType == 3 then

                    local cell = LoadedCells[cellDescription]

                    if cell ~= nil and cell.data.objectData[uniqueIndex] ~= nil then

                        local objectData = cell.data.objectData[uniqueIndex]

                        -- Set Creeper's gold
                        objectData.goldPool = CREEPER_GOLD

                        -- Prevent normal restock timing from interfering
                        objectData.lastGoldRestockHour = 0
                        objectData.lastGoldRestockDay = 0

                        -- Send the new gold pool to the player
                        tes3mp.ClearObjectList()
                        tes3mp.SetObjectListPid(pid)
                        tes3mp.SetObjectListCell(cellDescription)

                        packetBuilder.AddObjectMiscellaneous(
                            uniqueIndex,
                            objectData
                        )

                        tes3mp.SendObjectMiscellaneous()

                    end
                end
            end
        end
    end
)

return true