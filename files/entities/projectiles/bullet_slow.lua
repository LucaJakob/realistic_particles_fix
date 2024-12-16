---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml.lua")

for content in nxml.edit_file("data/entities/projectiles/deck/bullet_slow.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local explosion = content:first_of("ProjectileComponent"):first_of("config_explosion")
    if explosion then
        explosion:set("sparks_count_min", "17") -- from "7"
        :set("sparks_count_max", "140") -- from "1" (yes, weird)
    end

    local emitter = content:first_of("ParticleEmitterComponent")
    if emitter then
        emitter:set("count_min", "9") -- from "1"
        :set("count_max", "15") -- from "4"
        :set("lifetime_min", "16.6") -- from "0.6"
        :set("lifetime_max", "25.5") -- from "3.5"
        :set("airflow_force", "4.0") -- from "1.0"
    end
end