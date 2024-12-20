---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml/nxml.lua")

for content in nxml.edit_file("data/entities/projectiles/deck/meteor.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local explosion = content:first_of("ProjectileComponent"):first_of("config_explosion")
    if explosion then
        explosion:set("sparks_count_min", "20") -- from "50"
        :set("sparks_count_max", "60") -- from "100"
    end

    local smoke_real,
    fire_real1,
    fire_real2,
    spark,
    fire_cosmetic = unpack(content:all_of("ParticleEmitterComponent"))

    if spark then
        spark:set("lifetime_min", "5.2") -- from "0.2"
        :set("lifetime_max", "9.4") -- from "0.4"
        :set("fade_based_on_lifetime", "1")
    end
end