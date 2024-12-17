---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml/nxml.lua")

for content in nxml.edit_file("data/entities/projectiles/deck/spore_pod.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local emitter = content:first_of("ParticleEmitterComponent")

    if emitter then
        emitter:set("count_min", "4") -- from "0"
        :set("count_max", "10") -- from "1"
        :set("lifetime_min", "3.1") -- from "0.1"
        :set("lifetime_max", "5.3") -- from "0.3"
    end
end