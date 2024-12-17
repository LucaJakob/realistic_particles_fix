---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml/nxml.lua")

for content in nxml.edit_file("data/entities/projectiles/deck/rubber_ball.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local emitter = content:first_of("ParticleEmitterComponent")

    if emitter then
        emitter:set("count_min", "4") -- from "1"
        :set("count_max", "10") -- from "1"
        :set("lifetime_min", "0.2") -- from "0.5"
        :set("lifetime_max", "1.5") -- from "1.0"
        :set("airflow_force", "9.0") -- from "1.0"
        :set("airflow_time", "0.401") -- from "0.401"
        :set("airflow_scale", "1.25") -- from "0.25"
    end
end