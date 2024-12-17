---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml/nxml.lua")

for content in nxml.edit_file("data/entities/props/physics_box_explosive.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local explosion = content:first_of("ExplodeOnDamageComponent"):first_of("config_explosion")
    if explosion then
        explosion:set("explosion_sprite_lifetime", "15") -- from "10"
        :set("sparks_count_min", "250") -- from "10"
        :set("sparks_count_max", "550") -- from "25"
    end
end