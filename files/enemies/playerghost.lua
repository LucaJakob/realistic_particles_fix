---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml/nxml.lua")
-- "Suomuhauki"

for content in nxml.edit_file("data/entities/animals/apparition/playerghost.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local emitter = nxml.new_element("ParticleEmitterComponent", {
        emitted_material_name = "rock_static_purple",
        fade_based_on_lifetime="0",
        count_min = "1",
        count_max = "1",
        ["offset.y"] = "0",
        ["offset.x"] = "0",
        x_pos_offset_min = "1",
        x_pos_offset_max = "1",
        y_pos_offset_min = "-10",
        y_pos_offset_max = "2",
        x_vel_min = "-20",
        x_vel_max = "20",
        y_vel_min = "-20",
        y_vel_max = "20",
        ["gravity.y"] = "0",
        lifetime_min ="0.2",
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
        trail_gap = "0",
        velocity_always_away_from_center = "1"
    })

    content:add_child(emitter)
end