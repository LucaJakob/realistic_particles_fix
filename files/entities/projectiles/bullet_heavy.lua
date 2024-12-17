---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml/nxml.lua")

for content in nxml.edit_file("data/entities/projectiles/deck/bullet_heavy.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local explosion = content:first_of("ProjectileComponent"):first_of("config_explosion")
    if explosion then
        explosion:set("sparks_count_min", "4") -- from "3"
        :set("sparks_count_max", "11") -- from "1" (yes, weird)
        :set("material_sparks_count_min", "2") -- from "3"
        :set("material_sparks_count_min", "8") -- from "0"
    end

    local emitters = content:all_of("ParticleEmitterComponent")
    for i, el in pairs(emitters) do
       if el:get("emitted_material_name") == "spark_green" then
            el:set("count_min", "4") -- from "1"
            :set("count_max", "9") -- from "4"
            :set("lifetime_min", "1.2") -- from "0.2"
            :set("lifetime_max", "3.6") -- from "0.6"
            :set("airflow_force", "3.5") -- from "1.5"
            :set("airflow_time", "1.4") -- from "0.401"
            :set("airflow_scale", "2") -- from "0.05"
       end
    end
end