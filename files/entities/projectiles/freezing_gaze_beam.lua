---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml/nxml.lua")

for content in nxml.edit_file("data/entities/projectiles/deck/freezing_gaze_beam.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local spark_emitter = content:first_of("ParticleEmitterComponent")

    if spark_emitter then
        spark_emitter:set("count_min", "2") -- from "1"
        :set("count_max", "4") -- from "2"
        :set("lifetime_min", "9.1") -- from "0.1"
        :set("lifetime_max", "15.8") -- from "0.8"
        :set("airflow_force", "2.5") -- from unset
        :set("airflow_time", "1.0") -- from unset
        :set("airflow_scale", "0.05") -- from unset
    end
end