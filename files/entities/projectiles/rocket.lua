---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml.lua")

for content in nxml.edit_file("data/entities/projectiles/deck/rocket.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local explosion = content:first_of("ProjectileComponent"):first_of("config_explosion")
    if explosion then
        explosion:set("sparks_count_min", "40") -- from "20"
        :set("sparks_count_max", "70") -- from "7"
        :set("airflow_force", "5.6") -- from unset
        :set("airflow_time", "0.1") -- from unset
        :set("airflow_scale", "0.03") -- from unset
    end
    
    local emitters = content:all_of("ParticleEmitterComponent")

    -- Smoke
    if emitters[1] then
        emitters[1]:set("count_min", "40") -- from "5"
        :set("count_max", "70") -- from "5"
        :set("lifetime_min", "7.1") -- from "0.1"
        :set("lifetime_max", "9.3") -- from "0.3"
    end

    -- Spark
    if emitters[2] then
        emitters[2]:set("lifetime_min", "14.3") -- from "0.3"
        :set("lifetime_max", "15.5") -- from "0.5"
        :set("airflow_force", "5.6") -- from "0.6"
    end

    if emitters[3] then
        emitters[3]:set("airflow_force", "5.6") -- from "0.6"
    end
end