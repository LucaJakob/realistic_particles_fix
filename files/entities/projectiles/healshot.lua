---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml/nxml.lua")

for content in nxml.edit_file("data/entities/projectiles/healshot.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local emitter = unpack(content:all_of("SpriteParticleEmitterComponent"))

    if emitter then
        emitter:set("lifetime", "6") -- from "0"
        :set("velocity_slowdown", "2") -- from "0"
        :set("count_min", "9") -- from "1"
        :set("count_max", "25") -- from "1"
        :set("lifetime_min", "6.1") -- from unset
        :set("lifetime_max", "12.3") -- from unset
    end
end