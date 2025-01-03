---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml/nxml.lua")

for content in nxml.edit_file("data/entities/projectiles/deck/rocket_tier_3.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local explosion = content:first_of("ProjectileComponent"):first_of("config_explosion")
    if explosion then
        explosion:set("sparks_count_min", "40") -- from "20"
        :set("sparks_count_max", "70") -- from "40"
    end
    
    local smoke_real,
        trail1,
        trail2,
        trail3,
        trail4,
        very_sparse1,
        very_sparse1 = unpack(content:all_of("ParticleEmitterComponent"))

    -- Green Spark
    if trail1 then
        trail1:set("lifetime_min", "2.3") -- from "0.3"
        :set("lifetime_max", "5.5") -- from "0.5"
        :set("airflow_force", "1.6") -- from "0.6"
    end

    if trail2 then
        trail2:set("count_min", "15") -- from "1"
        :set("count_max", "60") -- from "8"
        :set("airflow_force", "1.6") -- from "0.6"
    end
end