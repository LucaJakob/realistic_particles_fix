---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml/nxml.lua")

for content in nxml.edit_file("data/entities/projectiles/deck/firebomb.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local explosion = content:first_of("ProjectileComponent"):first_of("config_explosion")
    if explosion then
        explosion:set("particle_effect", "1") -- from "0"
        :set("sparks_count_min", "25") -- from "4"
        :set("sparks_count_max", "55") -- from "10"
    end

    local emitters = content:all_of("ParticleEmitterComponent")

    for i, emitter in pairs(emitters) do
        local material = emitter:get("emitted_material_name")
        if material == "fire" then
            emitter:set("count_min", "4") -- from "1"
            :set("count_max", "11") -- from "1"
            :set("lifetime_min", "2.1") -- from "0.1"
            :set("lifetime_max", "5.3") -- from "0.3"
            :set("create_real_particles", "0") -- from "1"
            :set("emit_cosmetic_particles", "1") -- from "0"
        end
    end
end