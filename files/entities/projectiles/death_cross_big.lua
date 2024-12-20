---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml/nxml.lua")

for content in nxml.edit_file("data/entities/projectiles/deck/death_cross_big.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local explosion = content:first_of("ProjectileComponent"):first_of("config_explosion")
    if explosion then
        explosion:set("sparks_count_min", "50") -- from "10"
        :set("sparks_count_max", "100") -- from "20"
    end

    -- both are cosmetic
    local emitters = content:all_of("ParticleEmitterComponent")
    for i, emitter in pairs(emitters) do
        emitter:set("count_min", "25") -- from "5"        
        :set("count_max", "45") -- from "9"        
    end
end