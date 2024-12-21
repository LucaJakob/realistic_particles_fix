---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml/nxml.lua")

for content in nxml.edit_file("data/entities/projectiles/deck/mine.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local explosion = content:first_of("ExplosionComponent"):first_of("config_explosion")

    if explosion then
        explosion:set("sparks_count_min", "40") -- from "10"
        :set("sparks_count_max", "80") -- from "30"
        -- :set("spark_material", "ice_blood_static")
        :set("spark_material", "copper_molten")
        -- :set("spark_material", "ice_blood_static")
    end

    local secondary_explosion = content:first_of("ProjectileComponent"):first_of("config_explosion")

    if secondary_explosion then
        secondary_explosion:set("sparks_count_min", "80")
        :set("sparks_count_max", "250")
        :set("spark_material", "spark_red_bright")
    end
    
    local emitter = nxml.new_element("ParticleEmitterComponent", {
        render_back = true,
        emitted_material_name = "spark_red_bright",
        fade_based_on_lifetime="1",
        count_min = "0",
        count_max = "1",
        ["offset.y"] = "-3",
        x_pos_offset_min = "-3",
        x_pos_offset_max = "3",
        y_pos_offset_min = "-2",
        y_pos_offset_max = "2",
        x_vel_min = "-10",
        x_vel_max = "10",
        y_vel_min = "-10",
        y_vel_max = "10",
        ["offset.x"] = "0",
        ["gravity.y"] = "-5",
        lifetime_min ="8",
        lifetime_max ="15",
        render_on_grid="1",
        airflow_force="0.5",
        airflow_time="0.2",
        airflow_scale="0.1",
        emission_interval_min_frames="6",
        emission_interval_max_frames="12",
        emit_cosmetic_particles="1",
        emit_real_particles="0",
        is_emitting="1",
        velocity_always_away_from_center = "1"
    })

    content:add_child(emitter)
end