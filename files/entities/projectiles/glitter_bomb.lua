---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml/nxml.lua")

for content in nxml.edit_file("data/entities/projectiles/deck/glitter_bomb.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local smoke_emitter_real,
    spark_emitter,
    sparse_spark_emitter = unpack(content:all_of("ParticleEmitterComponent"))

    if spark_emitter then
        spark_emitter:set("count_min", "5") -- from "1"
        :set("count_max", "10") -- from "2"
        :set("lifetime_min", "8") -- from "0.1"
        :set("lifetime_max", "15") -- from "0.3"
        :set("airflow_force", "2.5") -- from unset
        :set("airflow_time", "1.0") -- from unset
        :set("airflow_scale", "0.05") -- from unset
        :set("emitted_material_name", "spark_purple_bright")
    end
end

for content in nxml.edit_file("data/entities/projectiles/deck/glitter_bomb_shrapnel.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local sprite1,
    sprite2 = unpack(content:all_of("SpriteParticleEmitterComponent"))

    if sprite1 then
        sprite1:set("count_min", "1") -- from unset
        :set("count_max", "1") -- from unset
        :set("lifetime_min", "4.1")
        :set("lifetime_max", "9.8")
        :set("airflow_force", "2.5")
        :set("airflow_time", "1.0")
        :set("airflow_scale", "0.05")
    end
end