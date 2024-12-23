---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml/nxml.lua")

for content in nxml.edit_file("data/entities/projectiles/flamethrower.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local explosion = content:first_of("ProjectileComponent"):first_of("config_explosion")
    if explosion then
        explosion:set("light_fade_time", "2.8") -- from "0.8"
    end

    local smoke_emitter_real,
    spark_trail_emitter1,
    spark_trail_emitter2 = unpack(content:all_of("ParticleEmitterComponent"))

    if spark_trail_emitter1 then
        spark_trail_emitter1:set("count_min", "5") -- from "1"
        :set("count_max", "8") -- from "1"
        :set("lifetime_min", "1.63") -- from "0.63"
        :set("lifetime_max", "2.9") -- from "0.9"
        :set("airflow_force", "2.5") -- from unset
        :set("airflow_time", "1.0") -- from unset
        :set("airflow_scale", "0.05") -- from unset
    end

    if spark_trail_emitter2 then
        spark_trail_emitter2:set("count_min", "5") -- from "1"
        :set("count_max", "10") -- from "1"
        :set("lifetime_min", "3.3") -- from "0.3"
        :set("lifetime_max", "5.6") -- from "0.6"
    end
end
