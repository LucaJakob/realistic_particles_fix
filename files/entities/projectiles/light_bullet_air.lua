---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml/nxml.lua")

for content in nxml.edit_file("data/entities/projectiles/deck/light_bullet_air.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local explosion = content:first_of("ProjectileComponent"):first_of("config_explosion")
    if explosion then
        explosion:set("sparks_enabled", "1")
        -- :set("sparks_count_min", "5")
        -- :set("explosion_radius", "2")
        :set("sparks_count_max", "20")
        :set("material_sparks_enabled", "1") -- from "0"
        :set("material_sparks_max", "2") -- from "0"
    end
    
    local emitters = content:all_of("ParticleEmitterComponent")

    if emitters[1] then
        emitters[1]:set("count_min", "3") -- from "3"
        :set("count_max", "4") -- from "4"
        :set("lifetime_min", "2.2") -- from "0.2"
        :set("lifetime_max", "4.2") -- from "1.2"
        :set("airflow_force", "3.5") -- from "1.5"
    end

    if emitters[2] then
        emitters[2]:set("count_min", "5") -- from "1"
        :set("count_max", "10") -- from "2"
        :set("lifetime_min", "2.2") -- from "1.2"
        :set("lifetime_max", "4.2") -- from "3.2"
        :set("airflow_force", "3.5") -- from "0.5"
    end
end