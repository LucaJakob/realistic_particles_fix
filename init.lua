dofile_once("mods/realistic_particles_fix/settings.lua")

local ns = "mods/" .. mod_id .. "/files/"

for _, category in ipairs(RP_categories) do
    for _, item in ipairs(category) do
        local mod_setting_id = ToSettingId(item)
        if not ModSettingGet(mod_setting_id) then
            dofile_once(ns .. "entities/projectiles/" .. item.id .. ".lua")
        end
    end
end
