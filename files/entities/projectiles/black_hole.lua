---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml.lua")

for content in nxml.edit_file("data/entities/projectiles/deck/black_hole.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local particle = content:first_of("ParticleEmitterComponent")
    if particle then
        particle:set("count_min","7")    -- from "1"
        :set("count_max","15")       -- from "4"
        :set("lifetime_min", "9.1")  -- from "0.1"
        :set("lifetime_max", "15.5") -- from "1.5"
    end
end