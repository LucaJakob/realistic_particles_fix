---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml/nxml.lua")

for content in nxml.edit_file("data/entities/projectiles/deck/glitter_bomb.xml", ModTextFileGetContent, ModTextFileSetContent) do
    -- local explosion = content:first_of("ProjectileComponent"):first_of("config_explosion")
    -- if explosion then
    --     explosion:set("sparks_count_min", "115") -- from "10"
    --     :set("sparks_count_max", "165") -- from "20"
    -- end

    local emitters = content:all_of("ParticleEmitterComponent")

    for i, emitter in pairs(emitters) do
        local material = emitter:get("emitted_material_name")
        local is_dense_spark = material == "spark" and emitter:get("trail_gap") ~= "0.8"
        if is_dense_spark then
            emitter:set("count_min", "5") -- from "1"
            :set("count_max", "10") -- from "2"
            :set("lifetime_min", "8") -- from "0.1"
            :set("lifetime_max", "15") -- from "0.3"
            :set("airflow_force", "2.5") -- from unset
            :set("airflow_time", "1.0") -- from unset
            :set("airflow_scale", "0.05") -- from unset
            :set("emitted_material_name", "spark_purple_bright")
        end
    end
end