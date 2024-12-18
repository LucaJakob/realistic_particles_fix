---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml/nxml.lua")

for content in nxml.edit_file("data/entities/props/physics_propane_tank.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local explosion = content:first_of("ExplodeOnDamageComponent"):first_of("config_explosion")
    if explosion then
        explosion:set("sparks_count_min", "500") -- from "15"
        :set("sparks_count_max", "1000") -- from "20"
        :set("fade_based_on_lifetime", "1")
    end
end