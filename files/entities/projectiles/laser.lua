---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml/nxml.lua")

for content in nxml.edit_file("data/entities/projectiles/deck/laser.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local emitter = unpack(content:all_of("ParticleEmitterComponent"))
    if emitter then
        emitter:set("lifetime_min", "1.2") -- from "0.1"
        :set("lifetime_max", "1.2") -- from "0.8"
        :set("airflow_force", "0.2") -- from unset
        :set("airflow_time", "0.05") -- from unset
        :set("airflow_scale", "0.05") -- from unset
        :set("fade_based_on_lifetime", "1")
    end
end