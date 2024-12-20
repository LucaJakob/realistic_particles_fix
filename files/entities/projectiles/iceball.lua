---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml/nxml.lua")

for content in nxml.edit_file("data/entities/projectiles/deck/iceball.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local explosion = content:first_of("ProjectileComponent"):first_of("config_explosion")
    if explosion then
        explosion:set("airflow_force", "2.5") -- from unset
        :set("airflow_time", "2.0") -- from unset
        :set("airflow_scale", "0.05") -- from unset
    end
    local smoke_real,
    trail,
    real_snow = unpack(content:all_of("ParticleEmitterComponent"))

    if trail then
        trail:set("lifetime_min", "6.3") -- from "0.3"
        :set("lifetime_max", "9.6") -- from "0.6"
        :set("airflow_force", "2.5") -- from unset
        :set("airflow_time", "3.0") -- from unset
        :set("airflow_scale", "0.05") -- from unset
    end
end

