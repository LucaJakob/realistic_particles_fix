---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml/nxml.lua")
-- "Suomuhauki"

for content in nxml.edit_file("data/entities/projectiles/bossdragon_ray.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local breath_trail = unpack(content:all_of("ParticleEmitterComponent"))
    if breath_trail then
        breath_trail:set("emitted_material_name", "lava")
        :set("offset.x", "10")
    end
end

for content in nxml.edit_file("data/entities/projectiles/bossdragon.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local sparks = unpack(content:all_of("ParticleEmitterComponent"))
    if sparks then
        sparks:set("lifetime_min", "5")
        :set("lifetime_max", "13")
        :set("count_min", "1")
        :set("count_max", "2")
        :set("airflow_force", "5.5")
        :set("airflow_time", "0.5")
        :set("airflow_scale", "0.1")
        :set("x_vel_min", "100")
        :set("x_vel_max", "400")
        :set("y_vel_min", "-40")
        :set("y_vel_max", "40")
        :set("emitted_material_name", "fire")
    end
end

for content in nxml.edit_file("data/entities/projectiles/orb_green_boss_dragon.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local explosion = content:first_of("ProjectileComponent"):first_of("config_explosion")
    if explosion then
        explosion:set("sparks_enabled", "1")
        :set("sparks_count_min", "2")
        :set("sparks_count_max", "5")
        :set("spark_material", "radioactive_liquid")
    end

    local emitter = nxml.new_element("ParticleEmitterComponent", {
        emitted_material_name = "plasma_fading_green",
        fade_based_on_lifetime="1",
        count_min = "0",
        count_max = "1",
        ["offset.y"] = "0",
        ["offset.x"] = "0",
        x_pos_offset_min = "0",
        x_pos_offset_max = "0",
        y_pos_offset_min = "0",
        y_pos_offset_max = "0",
        x_vel_min = "-20",
        x_vel_max = "20",
        y_vel_min = "-20",
        y_vel_max = "20",
        ["gravity.y"] = "0",
        lifetime_min ="0.5",
        lifetime_max ="1",
        render_on_grid="1",
        emission_interval_min_frames="1",
        emission_interval_max_frames="1",
        emit_cosmetic_particles="1",
        emit_real_particles="0",
        is_emitting="1",
        is_trail = "0",
        velocity_always_away_from_center = "1"
    })

    content:add_child(emitter)
end
