---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml/nxml.lua")

for content in nxml.edit_file("data/entities/projectiles/deck/tnt.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local smoke_real, spark, sparse_spark = unpack(content:all_of("ParticleEmitterComponent"))

    -- Smoke
    if spark then
        spark:set("count_min", "8") -- from "0"
        :set("count_max", "20") -- from "4"
        :set("lifetime_min", "20") -- from "0.1"
        :set("lifetime_max", "30") -- from "0.3"
    end
end