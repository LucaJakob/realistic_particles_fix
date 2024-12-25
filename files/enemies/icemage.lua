---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml/nxml.lua")

for content in nxml.edit_file("data/entities/projectiles/iceball.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local smoke_real,
    trail,
    real_snow = unpack(content:all_of("ParticleEmitterComponent"))

    if trail then
        trail:set("lifetime_min", "3.3") -- from "0.3"
        :set("lifetime_max", "6.6") -- from "0.6"
        :set("airflow_force", "2.5") -- from unset
        :set("airflow_time", "0.5") -- from unset
        :set("airflow_scale", "0.05") -- from unset
    end
end

for content in nxml.edit_file("data/entities/animals/icemage.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local freeze_indicator = nxml.new_element("ParticleEmitterComponent", {
        emitted_material_name = "tubematerial",
		["gravity.y"]="0.0",
		lifetime_min="0.5",
		lifetime_max="3.0",
		count_min="10",
		count_max="10",
		render_on_grid="1",
		fade_based_on_lifetime="1",
        ["offset.y"] = "0",
        ["offset.x"] = "0",
        x_pos_offset_min = "0",
        x_pos_offset_max = "0",
        y_pos_offset_min = "0",
        y_pos_offset_max = "0",
        ["area_circle_radius.min"]="27",
		["area_circle_radius.max"]="30", -- freeze radius is 30
		emission_interval_min_frames="0",
		emission_interval_max_frames="0",
		emit_cosmetic_particles="1",
		is_emitting="1",
        velocity_always_away_from_center = "-40",
    })
    content:add_child(freeze_indicator)
end
