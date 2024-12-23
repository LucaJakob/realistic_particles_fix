---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml/nxml.lua")
-- "Suomuhauki"

for content in nxml.edit_file("data/entities/projectiles/acidshot.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local explosion = content:first_of("ProjectileComponent"):first_of("config_explosion")

    if explosion then
        explosion:set("sparks_enabled", "1") -- wrongly set to "0 "
        :set("sparks_count_min", "30")
        :set("sparks_count_max", "50")
        :set("spark_material", "radioactive_liquid")
    end
    
    local emitter = nxml.new_element("ParticleEmitterComponent", {
        -- emitted_material_name = "grass_darker",
        emitted_material_name = "radioactive_gas",
        fade_based_on_lifetime="1",
        count_min = "3",
        count_max = "5",
        ["offset.y"] = "0",
        ["offset.x"] = "-5",
        x_pos_offset_min = "-3",
        x_pos_offset_max = "3",
        y_pos_offset_min = "-3",
        y_pos_offset_max = "3",
        x_vel_min = "0",
        x_vel_max = "0",
        y_vel_min = "5",
        y_vel_max = "5",
        ["gravity.y"] = "-0.5",
        lifetime_min ="0.5",
        lifetime_max ="1",
        airflow_force = "0.5",
        airflow_time = "0.5",
        airflow_scale = "0.05",
        render_on_grid="1",
        emission_interval_min_frames="2",
        emission_interval_max_frames="4",
        emit_cosmetic_particles="1",
        emit_real_particles="0",
        is_emitting="1",
        is_trail = "0",
        trail_gap = "1.0",
        velocity_always_away_from_center = "1"
    })

    content:add_child(emitter)
end