---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml/nxml.lua")

for content in nxml.edit_file("data/entities/projectiles/deck/grenade_tier_3.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local explosion = content:first_of("ProjectileComponent"):first_of("config_explosion")
    if explosion then
        explosion:set("sparks_count_min", "60") -- from "30"
        :set("sparks_count_max", "180") -- from "90"
    end

    local smoke_emitter_real, fire_emitter_real, spark_emitter, trail_emitter = unpack(content:all_of("ParticleEmitterComponent"))

    if spark_emitter then
        spark_emitter
        :set("airflow_force", "1.5")
        :set("airflow_time", "0.04")
        :set("airflow_scale", "0.02")
        :set("fade_based_on_lifetime", "0")
        -- :set("count_min", "4")
        -- :set("count_max", "7")
        -- :set("fade_based_on_lifetime", "1")
        :set("gravity.y", "-4")

    end

    if trail_emitter then
        trail_emitter:set("lifetime_min", "3.5")
        :set("lifetime_max", "5.5")
        :set("airflow_force", "0.5")
        :set("trail_gap", "0.2")
        :set("count_min", "1")
        :set("count_max", "2")
        :set("airflow_time", "1.0")
        :set("airflow_scale", "0.1")
    end
end