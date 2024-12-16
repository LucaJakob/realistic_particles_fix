---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml.lua")

for content in nxml.edit_file("data/entities/projectiles/deck/flamethrower.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local explosion = content:first_of("ProjectileComponent"):first_of("config_explosion")
    if explosion then
        explosion:set("sparks_count_min", "115") -- from "10"
        :set("sparks_count_max", "165") -- from "20"
    end

    local emitters = content:all_of("ParticleEmitterComponent")

    for i, emitter in pairs(emitters) do
        local material = emitter:get("emitted_material_name")
        if material == "spark" then
            emitter:set("count_min", "45") -- from "1"
            :set("count_max", "55") -- from "1"
            :set("lifetime_min", "4.63") -- from "0.63"
            :set("lifetime_max", "5.9") -- from "0.9"
            :set("airflow_force", "2.5") -- from unset
            :set("airflow_time", "1.0") -- from unset
            :set("airflow_scale", "0.05") -- from unset
        elseif material == "fire" then
            emitter:set("count_min", "50") -- from "1"
            :set("count_max", "100") -- from "1"
            :set("lifetime_min", "32.3") -- from "0.3"
            :set("lifetime_max", "40.6") -- from "0.6"
        end
    end
end

for content in nxml.edit_file("data/entities/projectiles/flamethrower.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local explosion = content:first_of("ProjectileComponent"):first_of("config_explosion")
    if explosion then
        explosion:set("sparks_count_min", "60") -- from "10"
        :set("sparks_count_max", "80") -- from "20"
        :set("light_fade_time", "2.8") -- from "0.8"
    end

    local emitters = content:all_of("ParticleEmitterComponent")

    for i, emitter in pairs(emitters) do
        local material = emitter:get("emitted_material_name")
        local is_first_spark = material == "spark" and emitter:get("lifetime_min") == "0.63"

        if material == "smoke" then
            emitter:set("count_min", "6") -- from "2"
            :set("count_max", "8") -- from "3"
        elseif is_first_spark then
            emitter:set("count_min", "11") -- from "1"
            :set("count_max", "15") -- from "1"
            :set("lifetime_max", "6.9") -- from "0.3"
        end
    end
end