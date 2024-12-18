---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml/nxml.lua")

for content in nxml.edit_file("data/entities/projectiles/deck/lance_holy.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local explosion = content:first_of("ProjectileComponent"):first_of("config_explosion")
    if explosion then
        explosion:set("sparks_count_min", "15") -- from "7"
        :set("sparks_count_max", "22") -- from "15"
    end
    
    local trail_emitter, dense_emitter, sparse_emitter, very_sparse_emitter = unpack(content:all_of("ParticleEmitterComponent"))
    -- trail_emitter - self-explanatory
    -- dense_emitter - lance ejects it as it flies, quickly dissipates
    if trail_emitter then
        trail_emitter:set("lifetime_min", "0.3") -- from "0.6"
        :set("lifetime_max", "3.5") -- from "5.8"
    end
    if dense_emitter then
        dense_emitter:set("lifetime_min", "3") -- from "0.2"
        :set("lifetime_max", "5") -- from "0.3"
        :set("airflow_force", "0.5") -- from "10.5"
    end
    -- One looks ugly without the other. Merge both into one statement
    if sparse_emitter and very_sparse_emitter then
        sparse_emitter:set("is_trail", "1") -- from "0"
        :set("trail_gap", "0.6") -- from "8.0"
        :set("lifetime_min", "0.5") -- from "0.6"
        :set("lifetime_max", "1.0") -- from "0.8"
        :set("airflow_force", "0.0") -- from "1.5"
        :set("count_min", "1") -- from "1"
        :set("count_max", "1") -- from "2"
        :set("offset.y", "-2.5") -- from "0"
        :set("offset.x", "-3") -- from "0"
        :set("emission_interval_min_frames", "1") -- from "1"
        :set("emission_interval_max_frames", "1") -- from "10"
        :set("emitted_material_name", "urine") -- from "gold"

        very_sparse_emitter:set("is_trail", "1") -- from "0"
        :set("trail_gap", "0.6") -- from "8.0"
        :set("offset.y", "2.5") -- from "0"
        :set("offset.x", "-3") -- from "0"
        :set("lifetime_min", "0.5") -- from "1.4"
        :set("lifetime_max", "1.0") -- from "1.5"
        :set("airflow_force", "0.0") -- from "0.5"
        :set("count_min", "1") -- from "1"
        :set("count_max", "1") -- from "1"
        :set("emission_interval_min_frames", "1") -- from "10"
        :set("emission_interval_max_frames", "1") -- from "20"
        :set("emitted_material_name", "urine") -- from "gold"
    end
end