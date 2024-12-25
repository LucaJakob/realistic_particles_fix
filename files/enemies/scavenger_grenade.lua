---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml/nxml.lua")
-- "Suomuhauki"

for content in nxml.edit_file("data/entities/projectiles/clusterbomb.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local explosion = content:first_of("ProjectileComponent"):first_of("config_explosion")

    if explosion then
        explosion:set("sparks_count_min", "100")
        :set("sparks_count_max", "200")
        :set("spark_material", "spark_red")
    end
end

for content in nxml.edit_file("data/entities/projectiles/grenade_scavenger.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local explosion = content:first_of("ProjectileComponent"):first_of("config_explosion")

    if explosion then
        explosion:set("sparks_count_min", "50")
        :set("sparks_count_max", "100")
    end

    local emitter = nxml.new_element("ParticleEmitterComponent", {
        emitted_material_name = "fire",
        fade_based_on_lifetime="1",
        count_min = "3",
        count_max = "5",
        ["offset.y"] = "0",
        ["offset.x"] = "0",
        x_pos_offset_min = "0",
        x_pos_offset_max = "0",
        y_pos_offset_min = "-1",
        y_pos_offset_max = "1",
        x_vel_min = "0",
        x_vel_max = "0",
        y_vel_min = "5",
        y_vel_max = "5",
        ["gravity.y"] = "-50",
        lifetime_min ="0.2",
        lifetime_max ="0.5",
        airflow_force = "10.5",
        airflow_time = "0.5",
        airflow_scale = "0.05",
        render_on_grid="1",
        emission_interval_min_frames="2",
        emission_interval_max_frames="4",
        emit_cosmetic_particles="1",
        emit_real_particles="0",
        is_emitting="1",
        is_trail = "1",
        trail_gap = "0.5",
        velocity_always_away_from_center = "1"
    })

    content:add_child(emitter)
end
