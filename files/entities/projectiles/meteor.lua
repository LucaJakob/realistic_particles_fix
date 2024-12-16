---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml.lua")

for content in nxml.edit_file("data/entities/projectiles/deck/meteor.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local explosion = content:first_of("ProjectileComponent"):first_of("config_explosion")
    if explosion then
        explosion:set("sparks_count_min", "20") -- from "50"
        :set("sparks_count_max", "60") -- from "100"
    end

    local emitters = content:all_of("ParticleEmitterComponent")

    for i, emitter in pairs(emitters) do
        local material = emitter:get("emitted_material_name")
        if material == "spark" then
            emitter:set("lifetime_min", "5.2") -- from "0.2"
            :set("lifetime_max", "9.4") -- from "0.4"
            :set("fade_based_on_lifetime", "1")
        end
    end
end