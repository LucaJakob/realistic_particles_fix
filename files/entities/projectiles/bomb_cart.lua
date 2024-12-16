---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml.lua")

for content in nxml.edit_file("data/entities/projectiles/bomb_cart.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local projectile_explosion = content:first_of("ProjectileComponent"):first_of("config_explosion")
    if projectile_explosion then
        projectile_explosion:set("sparks_count_min", "120") -- from "12"
        :set("sparks_count_max", "150") -- from "15"
    end
    local explosion_on_damage = content:first_of("ExplodeOnDamageComponent"):first_of("config_explosion")
    if explosion_on_damage then
        explosion_on_damage:set("sparks_count_min", "1002") -- from "12"
        :set("sparks_count_max", "1500") -- from "15"
        :set("sparks_enabled", "800")
        :set("stains_enabled", "1500")
    end

    local emitters = content:all_of("ParticleEmitterComponent")

    for i, emitter in pairs(emitters) do
        local material = emitter:get("emitted_material_name")
        if material == "smoke" then
            emitter:set("count_min", "11") -- from "1"
            :set("count_max", "50") -- from "5"
            :set("lifetime_min", "5.1") -- from "0.1"
            :set("lifetime_max", "13.3") -- from "0.3"
            :set("airflow_force", "2.5") -- from unset
            :set("airflow_time", "1.0") -- from unset
            :set("airflow_scale", "0.05") -- from unset
        elseif material == "spark" then
            emitter:set("count_min", "2") -- from "1"
            :set("count_max", "5") -- from "3"
            :set("lifetime_min", "2.1") -- from "0.1"
            :set("lifetime_max", "5.3") -- from "0.3"
        end
    end
end