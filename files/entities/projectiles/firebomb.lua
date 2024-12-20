---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml/nxml.lua")

for content in nxml.edit_file("data/entities/projectiles/deck/firebomb.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local explosion = content:first_of("ProjectileComponent"):first_of("config_explosion")
    if explosion then
        explosion:set("particle_effect", "1") -- from "0"
        :set("sparks_count_min", "25") -- from "4"
        :set("sparks_count_max", "55") -- from "10"
    end

    local fire_emitter_real = unpack(content:all_of("ParticleEmitterComponent"))

    if fire_emitter_real then
        local emitter = fire_emitter_real:clone()

        emitter:set("create_real_particles", "0") -- from "1"
        :set("create_real_particles", "0")
        :set("emit_cosmetic_particles", "1") -- from "0"
        :set("count_min", "2") -- from "1"
        :set("count_max", "7") -- from "1"
        :set("lifetime_min", "2.1") -- from "0.1"
        :set("lifetime_max", "5.3") -- from "0.3"
        :set("gravity.y", "0.3")
        :set("x_vel_min", "0")
        :set("x_vel_max", "0")
        :set("airflow_force", "2.5")
        :set("airflow_time", "0.5")
        :set("airflow_scale", "0.1")
        :set("fade_based_on_lifetime", "1")

        content:add_child(emitter)
    end
end