---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml/nxml.lua")

for content in nxml.edit_file("data/entities/projectiles/bomb_holy_giga.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local explosion = content:first_of("Base"):first_of("ProjectileComponent"):first_of("config_explosion")
    if explosion then
        explosion:set("spark_material", "gold")
        :set("sparks_count_min", "3500") -- from "1500"
        :set("sparks_count_max", "4000") -- from "1600"
    end

    local smoke_emitter_real, spark_emitter, sparse_spark_emitter = unpack(content:all_of("ParticleEmitterComponent"))

    if spark_emitter then
        spark_emitter:set("emitted_material_name", "spark_yellow")
        :set("x_vel_min", "-50")
        :set("x_vel_max", "50")
        :set("y_vel_min", "-50")
        :set("y_vel_max", "50")
        :set("lifetime_min", "1.0")
        :set("lifetime_max", "3.3")
        :set("is_trail", "1")
        :set("trail_gap", "0.1")
    end
end