---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml/nxml.lua")

for content in nxml.edit_file("data/entities/projectiles/deck/tnt.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local emitter = content:first_of("ParticleEmitterComponent")

    -- Smoke
    if emitter then
        emitter:set("count_min", "8") -- from "0"
        :set("count_max", "20") -- from "4"
        :set("lifetime_min", "20") -- from "0.1"
        :set("lifetime_max", "30") -- from "0.3"
        :set("emitted_material_name", "spark")
    end
end