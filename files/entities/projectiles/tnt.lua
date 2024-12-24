---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml/nxml.lua")

for content in nxml.edit_file("data/entities/projectiles/deck/tnt.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local explosion = content:first_of("Base"):first_of("ProjectileComponent"):first_of("config_explosion")

    if explosion then
        explosion:set("sparks_enabled", "1")
        :set("sparks_count_min", "100")
        :set("sparks_count_max", "200")
    end
    
    local smoke_real, spark, sparse_spark = unpack(content:all_of("ParticleEmitterComponent"))

    -- Smoke
    if spark then
        spark:set("count_min", "4") -- from "0"
        :set("count_max", "8") -- from "4"
        :set("lifetime_min", "1.5") -- from "0.1"
        :set("lifetime_max", "2.5") -- from "0.3"
        :set("airflow_force", "2.5") -- from unset
        :set("airflow_time", "1.0") -- from unset
        :set("airflow_scale", "0.05") -- from unset
        :set("gravity.y", "-100")
    end
end