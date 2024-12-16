---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml.lua")

for content in nxml.edit_file("data/entities/projectiles/deck/lightning.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local explosion = content:first_of("LightningComponent"):first_of("config_explosion")
    if explosion then
        explosion:set("sparks_count_min", "20") -- from "1"
        :set("sparks_count_max", "35") -- from "10"
        :set("spark_material","plasma_fading")
    end
end