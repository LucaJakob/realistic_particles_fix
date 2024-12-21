---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml/nxml.lua")

for content in nxml.edit_file("data/entities/projectiles/deck/grenade_tier_2.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local explosion = content:first_of("ProjectileComponent"):first_of("config_explosion")
    if explosion then
        explosion:set("sparks_count_min", "40") -- from "10"
        :set("sparks_count_max", "120") -- from "30"
    end

    local smoke_emitter_real, fire_emitter_real, spark_emitter, trail_emitter = unpack(content:all_of("ParticleEmitterComponent"))

    if fire_emitter_real then
        local cosmetic_fire = fire_emitter_real:clone()
        cosmetic_fire:set("emit_real_particles", "0")
        :set("create_real_particles", "0")
        :set("emit_cosmetic_particles", "1")
        :set("lifetime_min", "5")
        :set("lifetime_max", "10")
        :set("airflow_force", "3.5")
        :set("airflow_time", "0.5")
        :set("airflow_scale", "0.1")
        :set("fade_based_on_lifetime", "1")
        :set("fade_based_on_lifetime", "1")
        :set("gravity.y", "-5")
        
        content:add_child(cosmetic_fire)
    end

    if trail_emitter then
        trail_emitter:set("lifetime_min", "1.5")
        :set("lifetime_max", "3.5")
        :set("airflow_force", "7.5")
        :set("trail_gap", "0.2")
        :set("count_min", "1")
        :set("count_max", "2")
        :set("airflow_time", "1.0")
        :set("airflow_scale", "0.1")
    end
end