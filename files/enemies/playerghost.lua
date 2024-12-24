---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml/nxml.lua")
-- "Suomuhauki"

for content in nxml.edit_file("data/entities/animals/apparition/playerghost.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local sprite = nxml.new_element("SpriteParticleEmitterComponent", {
        sprite_file = "data/particles/dust.xml",
        additive = "1",
        delay = "0",
        lifetime = "1",
        ["color.r"] = "0.2",
        ["color.g"] = "0.2",
        ["color.b"] = "0.2",
        ["color.a"] = "1",
        ["color_change.r"] = "0",
        ["color_change.g"] = "0",
        ["color_change.b"] = "0",
        ["color_change.a"] = "-2",
        ["velocity.x"] = "0",
        ["velocity.y"] = "0",
        ["gravity.x"] = "0",
        ["gravity.y"] = "-20",
        velocity_slowdown = "0",
        rotation = "0",
        angular_velocity = "0",
        use_velocity_as_rotation = "0",
        ["scale.x"] = "1",
        ["scale.y"] = "1",
        ["scale_velocity.x"] = "0",
        ["scale_velocity.y"] = "0",
        emission_interval_min_frames = "2",
        emission_interval_max_frames = "4",
        count_min = "1",
        count_max = "1",
        ["randomize_rotation.min"] = "-0.3415",
        ["randomize_rotation.max"] = "0.3415",
        ["randomize_angular_velocity.min"] = "-1.3415",
        ["randomize_angular_velocity.max"] = "1.3415",
        ["randomize_position.min_x"] = "-1",
        ["randomize_position.max_x"] = "1",
        ["randomize_position.min_y"] = "-10",
        ["randomize_position.max_y"] = "2",
        ["randomize_velocity.min_x"] = "-20",
        ["randomize_velocity.max_x"] = "20",
        ["randomize_velocity.min_y"] = "-10",
        ["randomize_velocity.max_y"] = "10",
        is_emitting = "1"
    })

    content:add_child(sprite)
end
