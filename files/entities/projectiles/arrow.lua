---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml.lua")

for content in nxml.edit_file("data/entities/projectiles/deck/arrow.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local particle = content:first_of("ParticleEmitterComponent")
    if particle then
        particle:set("lifetime_min","0.9") -- from "0.3"
            :set("lifetime_max","1.5")     -- from "0.5"
    end
end