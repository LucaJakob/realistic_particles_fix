---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml/nxml.lua")

for content in nxml.edit_file("data/entities/projectiles/deck/light_bullet.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local explosion = content:first_of("ProjectileComponent"):first_of("config_explosion")
    if explosion then
        explosion:set("sparks_count_min", "2")
        :set("sparks_count_max", "3")
        :set("sparks_enabled", "1")
        :set("sparks_count_max", "20")
        :set("material_sparks_enabled", "1") -- from "0"
        :set("material_sparks_min", "2") -- from "0"
        :set("material_sparks_max", "3") -- from "0"
        :set("light_enabled", "1") -- from "0"
        :set("spark_material", "plasma_fading_pink")
    end
    
    local emitters = content:all_of("ParticleEmitterComponent")

    -- Dense emitter
    if emitters[1] then
        emitters[1]:set("count_min", "1") -- from "1"
        :set("count_max", "2") -- from "4"
        :set("lifetime_min", "1") -- from "0.1"
        :set("lifetime_max", "2") -- from "0.2"
        :set("airflow_force", "2.5") -- from "10.5"
        :set("airflow_time", "1.0") -- from "1.401"
        :set("airflow_scale", "0.05") -- from "0.05"
        -- :set("emission_interval_min_frames", "0")
    end

    if emitters[2] then
        emitters[2]:set("count_min", "5") -- from "1"
        :set("count_max", "10") -- from "2"
        :set("lifetime_min", "2.2") -- from "1.2"
        :set("lifetime_max", "4.2") -- from "3.2"
        :set("airflow_force", "3.5") -- from "0.5"
    end
end