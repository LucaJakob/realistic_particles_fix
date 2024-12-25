---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml/nxml.lua")

for content in nxml.edit_file("data/entities/projectiles/fireball_ghostly.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local explosion = content:first_of("ProjectileComponent"):first_of("config_explosion")
    if explosion then
        explosion:set("sparks_count_min", "80") -- from "50"
        :set("sparks_count_max", "250") -- from "100"
    end

    local smoke_real, trail, fire_real = unpack(content:all_of("ParticleEmitterComponent"))

    if trail then
        trail:set("count_min", "3") -- from "1"
        :set("count_max", "6") -- from "3"
        :set("lifetime_min", "1.3") -- from "0.3"
        :set("lifetime_max", "3.6") -- from "0.6"
        :set("airflow_force", "2.5") -- from unset
        :set("airflow_time", "1.0") -- from unset
        :set("airflow_scale", "0.05") -- from unset
    end
end
