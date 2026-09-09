local world = require('openmw.world')
local types = require('openmw.types')

local function update(dt)
    for _, actor in ipairs(world.activeActors) do
        if actor.recordId == 'scamp_creeper' then
            if types.Actor.getBarterGold(actor) < 1000000000 then
                types.Actor.setBarterGold(actor, 1000000000)
            end
        end
    end
end

return {
    engineHandlers = {
        onUpdate = update,
    },
}