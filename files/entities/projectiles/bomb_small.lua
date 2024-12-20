---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml/nxml.lua")

for content in nxml.edit_file("data/entities/projectiles/bomb_small.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local explosion = content:first_of("Base"):first_of("ProjectileComponent"):first_of("config_explosion")
    if explosion then
        explosion:set("sparks_count_min", "15") -- from "12"
        :set("sparks_count_max", "35") -- from "15"
    end

    local smoke_emitter_real, spark_emitter, sparse_spark_emitter = unpack(content:all_of("ParticleEmitterComponent"))

    if spark_emitter then
        spark_emitter:set("lifetime_min", "3.1") -- from "0.1"
        :set("lifetime_max", "4.3") -- from "0.3"
    end
end