---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml.lua")

for content in nxml.edit_file("data/entities/projectiles/deck/death_cross.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local explosion = content:first_of("ProjectileComponent"):first_of("config_explosion")
    if explosion then
        explosion:set("sparks_count_min", "200") -- from "4"
        :set("sparks_count_max", "400") -- from "8"
        :set("emit_real_particles", "0")
        :set("emit_cosmetic_particles", "1")
    end
end