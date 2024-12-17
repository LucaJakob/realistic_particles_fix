---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml/nxml.lua")

for content in nxml.edit_file("data/entities/projectiles/deck/spitter.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local explosion = content:first_of("ProjectileComponent"):first_of("config_explosion")
    if explosion then
        explosion:set("sparks_enabled", "1") -- from "0"
        :set("sparks_count_min", "10") -- from unset
        :set("sparks_count_max", "15") -- from unset
        :set("lifetime_min", "1.0")
        :set("lifetime_max", "3.0")
        :set("light_enabled", "1")
        :set("light_fade_time", "0.5")
        :set("spark_material", "spark_purple_bright")
    end
end