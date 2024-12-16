---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml.lua")

for content in nxml.edit_file("data/entities/projectiles/deck/bullet.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local emitter = content:first_of("ParticleEmitterComponent")
    if emitter then
        emitter:set("count_max", "4") -- from "1"
        :set("lifetime_max", "3.5") -- from "1.5"
        :set("airflow_force", "1.5") -- from "0.5"
        :set("airflow_scale", "0.8833") -- from "0.0833"
    end
end