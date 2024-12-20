---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml/nxml.lua")

for content in nxml.edit_file("data/entities/projectiles/deck/chain_bolt.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local emitter = content:first_of("ParticleEmitterComponent")
    if emitter then
        emitter:set("trail_gap", "1.5") -- from "0.5"
        :set("lifetime_min", "4.1") -- from "0.1"
        :set("lifetime_max", "9.8") -- from "0.8"
    end
end