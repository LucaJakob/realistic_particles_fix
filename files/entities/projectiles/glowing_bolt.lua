---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml/nxml.lua")

for content in nxml.edit_file("data/entities/projectiles/deck/glowing_bolt.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local explosion = content:first_of("ProjectileComponent"):first_of("config_explosion")
    if explosion then
        explosion:set("airflow_force", "2.5") -- from unset
        :set("airflow_time", "2.0") -- from unset
        :set("airflow_scale", "0.05") -- from unset
    end
    local emitters = content:all_of("ParticleEmitterComponent")

    for i, emitter in pairs(emitters) do
        emitter:set("airflow_force", "1.5") -- from unset
        :set("airflow_time", "0.1") -- from unset
        :set("airflow_scale", "0.05") -- from unset
        :set("count_max", "25") -- from "1"
        :set("lifetime_min", "2.1") -- from unset
        :set("lifetime_max", "6.3") -- from unset
        :set("fade_based_on_lifetime", "1") -- from unset
    end
end