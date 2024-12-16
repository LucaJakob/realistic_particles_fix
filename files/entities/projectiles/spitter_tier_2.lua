---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml.lua")

for content in nxml.edit_file("data/entities/projectiles/deck/spitter_tier_2.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local explosion = content:first_of("ProjectileComponent"):first_of("config_explosion")
    if explosion then
        explosion:set("sparks_enabled", "1") -- from "0"
        :set("sparks_count_min", "3") -- from unset
        :set("sparks_count_max", "5") -- from unset
        :set("light_enabled", "1")
        :set("light_fade_time", "0.5")
        :set("spark_material", "spark_green")
    end
    
    local emitter = content:first_of("ParticleEmitterComponent")

    if emitter then
        emitter:set("count_min", "5") -- from "1"
        :set("count_max", "9") -- from "6"
        :set("lifetime_min", "5.6") -- from "0.6"
        :set("lifetime_max", "8.1") -- from "1.1"
        :set("airflow_force", "2.5") -- from unset
        :set("airflow_time", "1.0") -- from unset
        :set("airflow_scale", "0.05") -- from unset
    end
end