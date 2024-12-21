---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml/nxml.lua")

for content in nxml.edit_file("data/entities/projectiles/deck/megalaser_beam.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local trail_line, trail_sprinkles = unpack(content:all_of("ParticleEmitterComponent"))
    if trail_line then
        trail_line:set("airflow_force", "0.2")
        :set("airflow_time", "0.4")
        :set("airflow_scale", "0.05")
        :set("lifetime_min", "0.5")
        :set("lifetime_max", "0.6")
    end
    if trail_sprinkles then
        trail_sprinkles:set("lifetime_min", "2.1") -- from "0.1"
        :set("lifetime_max", "5.8") -- from "0.8"
        :set("airflow_force", "1.5") -- from unset
        :set("airflow_time", "0.05") -- from unset
        :set("airflow_scale", "0.05") -- from unset
        :set("fade_based_on_lifetime", "1")
    end
end