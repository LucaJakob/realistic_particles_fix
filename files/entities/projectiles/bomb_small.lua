---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml/nxml.lua")

for content in nxml.edit_file("data/entities/projectiles/bomb_small.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local explosion = content:first_of("Base"):first_of("ProjectileComponent"):first_of("config_explosion")
    if explosion then
        explosion:set("sparks_count_min", "15") -- from "12"
        :set("sparks_count_max", "35") -- from "15"
    end

    local emitters = content:all_of("ParticleEmitterComponent")

    for i, emitter in pairs(emitters) do
        local material = emitter:get("emitted_material_name")
        if material == "spark" then
            emitter:set("lifetime_min", "3.1") -- from "0.1"
            :set("lifetime_max", "4.3") -- from "0.3"
        end
    end
end