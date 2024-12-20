---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml/nxml.lua")

for content in nxml.edit_file("data/entities/projectiles/deck/fireball.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local explosion = content:first_of("ProjectileComponent"):first_of("config_explosion")
    if explosion then
        explosion:set("sparks_count_min", "100") -- from "50"
        :set("sparks_count_max", "300") -- from "100"
        :set("create_real_particles", "1")
        -- :set("load_this_entity", "data/entities/particles/particle_explosion/main_contained.xml") -- from main_gunpowder_small.xml
    end

    local smoke_emitter_real, spark_emitter, fire_emitter_real = unpack(content:all_of("ParticleEmitterComponent"))

    if smoke_emitter_real then
        local emitter = smoke_emitter_real:clone()
        emitter:set("create_real_particles", "0")
        :set("emit_real_particles", "0")
        :set("emit_cosmetic_particles", "1")
        :set("airflow_force", "1.5") -- from unset
        :set("airflow_time", "1.0") -- from unset
        :set("airflow_scale", "0.05") -- from unset
        content:add_child(emitter)
    end
    if spark_emitter then
        spark_emitter:set("count_min", "8") -- from "1"
        :set("count_max", "13") -- from "3"
        :set("lifetime_min", "6.3") -- from "0.3"
        :set("lifetime_max", "15.6") -- from "0.6"
        :set("airflow_force", "2.5") -- from unset
        :set("airflow_time", "1.0") -- from unset
        :set("airflow_scale", "0.05") -- from unset
    end
end