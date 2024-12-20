---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml/nxml.lua")

for content in nxml.edit_file("data/entities/projectiles/deck/pollen.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local white_spark = unpack(content:all_of("ParticleEmitterComponent"))

    if white_spark then
        white_spark:set("count_min", "1") -- from "1"
        :set("count_max", "3") -- from "1"
        :set("lifetime_min", "6.3") -- from "1.3"
        :set("lifetime_max", "9.5") -- from "3.5"
        :set("airflow_force", "3.1") -- from "1.1"
        :set("airflow_time", "5.901") -- from "0.901"
        :set("airflow_scale", "0.1833") -- from "0.1833"
    end
end