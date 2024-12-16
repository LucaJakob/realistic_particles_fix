---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml.lua")

for content in nxml.edit_file("data/entities/projectiles/deck/glitter_bomb_shrapnel.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local emitters = content:all_of("SpriteParticleEmitterComponent")

    for i, emitter in pairs(emitters) do
        local sprite = emitter:get("sprite_file")

        if sprite == "data/particles/smoke_cloud_tiny_glitter_1.xml" then
            emitter:set("count_min", "1") -- from unset
            :set("count_max", "1") -- from unset
            :set("lifetime_min", "4.1")
            :set("lifetime_max", "9.8")
            :set("airflow_force", "2.5")
            :set("airflow_time", "1.0")
            :set("airflow_scale", "0.05")
        end
    end
end