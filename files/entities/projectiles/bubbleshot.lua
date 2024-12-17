---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml/nxml.lua")

for content in nxml.edit_file("data/entities/projectiles/deck/bubbleshot.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local explosion = content:first_of("ProjectileComponent"):first_of("config_explosion")
    if explosion then
        explosion:set("particle_effect", "1") -- from "0"
        :set("light_enabled", "1")
        :set("light_fade_time", "0.5")
        :set("material_sparks_count_min", "5") -- from "0"
        :set("material_sparks_count_max", "8") -- from "2"
        -- New additions
        :set("sparks_enabled", "1")
        :set("sparks_count_min", "4")
        :set("sparks_count_max", "8")
        :set("spark_material", "spark_blue")
    end
end