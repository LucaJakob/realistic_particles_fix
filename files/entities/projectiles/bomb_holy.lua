---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml/nxml.lua")

for content in nxml.edit_file("data/entities/projectiles/bomb_holy.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local explosion = content:first_of("Base"):first_of("ProjectileComponent"):first_of("config_explosion")
    if explosion then
        explosion:set("spark_material", "gold")
        :set("sparks_count_min", "2500")
        :set("sparks_count_max", "2600")
    end

    local smoke_emitter, spark_emitter, sparse_spark_emitter = unpack(content:all_of("ParticleEmitterComponent"))

    if spark_emitter then
        spark_emitter:set("emitted_material_name", "spark_yellow")
    end
end