---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml/nxml.lua")

for content in nxml.edit_file("data/entities/projectiles/deck/nuke_giga.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local explosion = content:first_of("ProjectileComponent"):first_of("config_explosion")
    if explosion then
        explosion:set("spark_material", "spark_red_bright")
    end
    
    local spark_trail,
    smoke_real,
    radioactive_real = unpack(content:all_of("ParticleEmitterComponent"))

    -- Green Spark
    if spark_trail then
        spark_trail:set("emitted_material_name", "radioactive_liquid") -- from "0.3"
        :set("lifetime_min", "0.8") -- from "0.5"
        :set("lifetime_max", "3.0") -- from "0.6"
    end
end