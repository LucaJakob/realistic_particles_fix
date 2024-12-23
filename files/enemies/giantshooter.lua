---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml/nxml.lua")
-- "Suomuhauki"

local emitters = {
    nxml.new_element("ParticleEmitterComponent", {
        -- emitted_material_name = "plasma_fading_green",
        emitted_material_name = "acid",
        render_back = "1",
        fade_based_on_lifetime="1",
        count_min = "1",
        count_max = "3",
        ["offset.y"] = "0",
        ["offset.x"] = "0",
        x_pos_offset_min = "-8",
        x_pos_offset_max = "8",
        y_pos_offset_min = "-12",
        y_pos_offset_max = "3",
        x_vel_min = "0",
        x_vel_max = "0",
        y_vel_min = "0",
        y_vel_max = "50",
        ["gravity.y"] = "100",
        lifetime_min ="10",
        lifetime_max ="15",
        render_on_grid="1",
        emission_interval_min_frames="50",
        emission_interval_max_frames="100",
        emit_cosmetic_particles="1",
        emit_real_particles="0",
        is_emitting="1",
    }),
    nxml.new_element("ParticleEmitterComponent", {
        emitted_material_name = "acid_gas",
        render_back = "1",
        fade_based_on_lifetime="1",
        count_min = "1",
        count_max = "2",
        ["offset.y"] = "0",
        ["offset.x"] = "0",
        x_pos_offset_min = "-8",
        x_pos_offset_max = "8",
        y_pos_offset_min = "-12",
        y_pos_offset_max = "3",
        x_vel_min = "0",
        x_vel_max = "0",
        y_vel_min = "0",
        y_vel_max = "0",
        ["gravity.y"] = "200",
        lifetime_min ="10",
        lifetime_max ="15",
        render_on_grid="1",
        emission_interval_min_frames="80",
        emission_interval_max_frames="170",
        emit_cosmetic_particles="1",
        emit_real_particles="0",
        is_emitting="1",
    })
}

for content in nxml.edit_file("data/entities/animals/giantshooter.xml", ModTextFileGetContent, ModTextFileSetContent) do
    for _, emitter in pairs(emitters) do
        content:add_child(emitter)
    end
end

for content in nxml.edit_file("data/entities/animals/giantshooter_weak.xml", ModTextFileGetContent, ModTextFileSetContent) do
    for _, emitter in pairs(emitters) do
        content:add_child(emitter)
    end
end