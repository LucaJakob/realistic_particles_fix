---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml/nxml.lua")

for content in nxml.edit_file("data/entities/projectiles/deck/lance.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local explosion = content:first_of("ProjectileComponent"):first_of("config_explosion")
    if explosion then
        explosion:set("particle_effect", "1") -- from "0"
        :set("sparks_count_min", "15") -- from "7"
        :set("sparks_count_max", "22") -- from "15"
    end
    
    local emitter = unpack(content:all_of("ParticleEmitterComponent"))
    if emitter then
        emitter:set("count_min", "55") -- from "1"
        :set("count_max", "95") -- from "5"
        :set("airflow_force", "2.5") -- from "0.1"
        :set("airflow_time", "1.505") -- from "0.101"
        :set("airflow_scale", "2.01") -- from "2.01"
    end
end