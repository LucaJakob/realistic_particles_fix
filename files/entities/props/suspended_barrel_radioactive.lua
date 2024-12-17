---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml.lua")

for content in nxml.edit_file("data/entities/props/physics_barrel_radioactive.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local explosion = content:first_of("ExplodeOnDamageComponent"):first_of("config_explosion")
    if explosion then
        explosion:set("explosion_sprite_lifetime", "15") -- from "10"
        :set("sparks_count_min", "1050") -- from "7"
        :set("sparks_count_max", "2050") -- from "20"
        :set("spark_material", "spark_green")
        :set("fade_based_on_lifetime", "1")
    end
end