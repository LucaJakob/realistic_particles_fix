---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml/nxml.lua")

local fungi = {
    {
        variant = "",
        range_x = "15",
        offset_y = "-10",
        particle_multiplier = 2,
    },
    {
        variant = "_small",
        range_x = "10",
        offset_y = "0",
        particle_multiplier = 1.0,
    },
    {
        variant = "_big",
        range_x = "15",
        offset_y = "-15",
        particle_multiplier = 3,
    },
    {
        variant = "_hugeish",
        range_x = "20",
        offset_y = "-10",
        particle_multiplier = 5,
    },
    {
        variant = "_huge",
        range_x = "20",
        offset_y = "-10",
        particle_multiplier = 5
    },
}

for _, fungus in pairs(fungi) do
    local emitter_props = {
        render_back = true,
        emitted_material_name = "bluefungi_static",
        count_min = fungus["particle_multiplier"],
        count_max = fungus["particle_multiplier"],
        ["offset.y"] = fungus["offset_y"],
        x_pos_offset_min = -1 * fungus["range_x"],
        x_pos_offset_max = fungus["range_x"],
        y_pos_offset_min = "0",
        y_pos_offset_max = "20",
        x_vel_min = "-20",
        x_vel_max = "20",
        y_vel_min = "-10",
        y_vel_max = "0",
        ["offset.x"] = "0",
        ["gravity.y"] = "-20.0",
        lifetime_min ="5",
        lifetime_max ="8",
        render_on_grid="1",
        fade_based_on_lifetime="0",
        airflow_force="0.5",
        airflow_time="0.5",
        airflow_scale="0.1",
        emission_interval_min_frames="10",
        emission_interval_max_frames="30",
        emit_cosmetic_particles="1",
        emit_real_particles="0",
        is_emitting="1",
    }
    local sparks = tostring(fungus["particle_multiplier"] * 200)

    -- Blue fungi
    for content in nxml.edit_file("data/entities/props/physics_fungus".. fungus["variant"] ..".xml", ModTextFileGetContent, ModTextFileSetContent) do
        emitter_props["emitted_material_name"] = "bluefungi_static"

        local explosion = content:first_of("ExplodeOnDamageComponent"):first_of("config_explosion")
        if explosion then
            explosion:set("sparks_count_min", sparks) -- from "35"
            :set("sparks_count_max", sparks) -- from "50"
            :set("fade_based_on_lifetime", "1")
            :set("spark_material", "fungus_loose")
        end

        content:add_child(
            nxml.new_element("ParticleEmitterComponent", emitter_props)
        )
    end

    -- Acid fungi
    for content in nxml.edit_file("data/entities/props/physics_fungus_acid".. fungus["variant"] ..".xml", ModTextFileGetContent, ModTextFileSetContent) do
        emitter_props["emitted_material_name"] = "radioactive_liquid"

        local explosion = content:first_of("ExplodeOnDamageComponent"):first_of("config_explosion")
        if explosion then
            explosion:set("sparks_count_min", sparks) -- from "35"
            :set("sparks_count_max", sparks) -- from "50"
            :set("fade_based_on_lifetime", "1")
            :set("spark_material", "radioactive_liquid")
        end

        content:add_child(
            nxml.new_element("ParticleEmitterComponent", emitter_props)
        )
    end
end