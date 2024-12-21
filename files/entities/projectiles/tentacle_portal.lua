---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml/nxml.lua")

for content in nxml.edit_file("data/entities/projectiles/deck/tentacle_portal.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local emitter = nxml.new_element("ParticleEmitterComponent", {
        render_back = true,
        emitted_material_name = "spark_purple",
        fade_based_on_lifetime="1",
        count_min = "5",
        count_max = "5",
        ["offset.y"] = "0",
        x_pos_offset_min = "-3",
        x_pos_offset_max = "3",
        y_pos_offset_min = "-2",
        y_pos_offset_max = "2",
        x_vel_min = "-60",
        x_vel_max = "60",
        y_vel_min = "-60",
        y_vel_max = "60",
        ["offset.x"] = "0",
        ["gravity.y"] = "0.0",
        lifetime_min ="5",
        lifetime_max ="9",
        render_on_grid="1",
        airflow_force="0.1",
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