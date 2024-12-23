---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml/nxml.lua")

for content in nxml.edit_file("data/entities/projectiles/deck/flamethrower.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local explosion = content:first_of("ProjectileComponent"):first_of("config_explosion")
    if explosion then
        explosion:set("sparks_count_min", "115") -- from "10"
        :set("sparks_count_max", "165") -- from "20"
    end

    local smoke_emitter_real,
    spark_trail_emitter,
    fire_trail_emitter = unpack(content:all_of("ParticleEmitterComponent"))

    if spark_trail_emitter then
        spark_trail_emitter:set("count_min", "45") -- from "1"
        :set("count_max", "55") -- from "1"
        :set("lifetime_min", "4.63") -- from "0.63"
        :set("lifetime_max", "5.9") -- from "0.9"
        :set("airflow_force", "2.5") -- from unset
        :set("airflow_time", "1.0") -- from unset
        :set("airflow_scale", "0.05") -- from unset
    end

    if fire_trail_emitter then
        fire_trail_emitter:set("count_min", "50") -- from "1"
        :set("count_max", "100") -- from "1"
        :set("lifetime_min", "32.3") -- from "0.3"
        :set("lifetime_max", "40.6") -- from "0.6"
    end
end

