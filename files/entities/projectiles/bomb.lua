---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml/nxml.lua")

for content in nxml.edit_file("data/entities/projectiles/bomb.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local explosion = content:first_of("Base"):first_of("ProjectileComponent"):first_of("config_explosion")
    if explosion then
        explosion:set("sparks_count_min", "600") -- from "12"
        :set("sparks_count_max", "1000") -- from "15"
    end

    local smoke_emitter_real, spark_emitter, sparse_spark_emitter = unpack(content:all_of("ParticleEmitterComponent"))

    if smoke_emitter_real then
        local emitter = smoke_emitter_real:clone()
        emitter:set("count_min", "10") -- from "0"
        :set("count_max", "56") -- from "4"
        content:add_child(emitter)
    end

    if spark_emitter then
        spark_emitter:set("count_max", "11") -- from "2"
        :set("lifetime_min", "0.9") -- from "0.1"
        :set("lifetime_max", "1.6") -- from "0.3"
        :set("is_trail", "1")
        :set("emit_cosmetic_particles", "1")
    end

    if sparse_spark_emitter then
        sparse_spark_emitter:set("count_max", "55") -- from "1"
        :set("create_real_particles", "1") -- from "0"
    end
end