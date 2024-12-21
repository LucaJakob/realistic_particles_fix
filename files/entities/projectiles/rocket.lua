---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml/nxml.lua")

for content in nxml.edit_file("data/entities/projectiles/deck/rocket.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local explosion = content:first_of("ProjectileComponent"):first_of("config_explosion")
    if explosion then
        explosion:set("sparks_count_min", "40") -- from "20"
        :set("sparks_count_max", "70") -- from "7"
        :set("airflow_force", "5.6") -- from unset
        :set("airflow_time", "0.1") -- from unset
        :set("airflow_scale", "0.03") -- from unset
    end
    
    local smoke_real,
    spark_trail1,
    spark_trail2,
    spark_trail3,
    sparse_spark = unpack(content:all_of("ParticleEmitterComponent"))

    if spark_trail1 then
        spark_trail1:set("lifetime_min", "14.3") -- from "0.3"
        :set("lifetime_max", "15.5") -- from "0.5"
        :set("airflow_force", "5.6") -- from "0.6"
    end

    if spark_trail2 then
        spark_trail2:set("airflow_force", "5.6") -- from "0.6"
    end
end