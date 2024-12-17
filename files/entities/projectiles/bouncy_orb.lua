---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml/nxml.lua")

for content in nxml.edit_file("data/entities/projectiles/deck/bouncy_orb.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local emitters = content:all_of("ParticleEmitterComponent")

    if emitters[1] then
        emitters[1]:set("count_min", "11")  -- from "1"
        :set("count_max", "20")      -- from "4"
        :set("lifetime_min", "1.4")  -- from "0.4"
        :set("lifetime_max", "3.8")  -- from "0.8"
        :set("airflow_force", "3.9") -- from "3.0"
    end
    if emitters[2] then
        emitters[2]:set("count_min", "15")  -- from "1"
        :set("count_max", "20")      -- from "4"
        :set("lifetime_min", "2.1")  -- from "0.1"
        :set("lifetime_max", "5.4")  -- from "0.4"
        :set("airflow_force", "2.5") -- from "1.0"
        :set("airflow_time", "1.0")  -- from "0.001"
    end

    if emitters[4] then
        emitters[4]:set("count_min", "15")   -- from "1"
        :set("count_max", "20")       -- from "2"
        :set("lifetime_min", "2.6")   -- from "0.6"
        :set("lifetime_max", "5.8")   -- from "0.8"
        :set("airflow_force", "2.5")  -- from "1.5"
        :set("airflow_scale", "1.05") -- from "0.05"
    end
end