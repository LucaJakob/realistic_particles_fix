dofile_once("mods/realistic_particles_fix/settings.lua")

local ns = "mods/" .. mod_id .. "/files/"

for i, item in pairs(RP_projectiles) do
    if not IsDisabled( item ) then
        dofile(ns .. "entities/projectiles/" .. item.id .. ".lua")
    end
end
for i, item in pairs(RP_props) do
    if not IsDisabled( item ) then
        dofile(ns .. "entities/props/" .. item.id .. ".lua")
    end
end