---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml/nxml.lua")

for content in nxml.edit_file("data/entities/props/physics_crate.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local explosion = content:first_of("ExplodeOnDamageComponent"):first_of("config_explosion")
    if explosion then
        explosion:set("sparks_count_min", "1050") -- from "35"
        :set("sparks_count_max", "2050") -- from "50"
    end
end