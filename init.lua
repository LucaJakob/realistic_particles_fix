local ns = "mods/realistic_particles_fix/files/"

local projectiles = {
    "arrow",
    "black_hole",
    "bomb_cart",
    "bomb_small",
    "bomb",
    "bouncy_orb",
    "bubbleshot",
    "bullet_heavy",
    "bullet_slow",
    "bullet",
    "chain_bolt",
    "death_cross_big",
    "death_cross",
    "fireball",
    "firebomb",
    "firework",
    "flamethrower",
    "freezing_gaze_beam",
    "glitter_bomb",
    "glowing_bolt",
    "healshot",
    "iceball",
    "lance",
    "laser",
    "light_bullet_air",
    "light_bullet",
    "lightning",
    "meteor",
    "pollen",
    "rocket_tier_2",
    "rocket",
    "rubber_ball",
    "spitter_tier_2",
    "spitter_tier_3",
    "spitter",
    "spore_pod",
    "tnt"
}

local props = {
    "physics_barrel_oil",
    "physics_barrel_radioactive",
    "physics_box_explosive",
    "suspended_tank_radioactive",
    "physics_propane_tank"
}

for i, name in pairs(projectiles) do
    local enabled = ModSettingGet("realistic_particles_fix.particles." .. name)
    if enabled == true then
        dofile(ns .. "entities/projectiles/" .. name .. ".lua")
    end
end
for i, name in pairs(props) do
    local enabled = ModSettingGet("realistic_particles_fix.particles." .. name)
    if enabled == true then
        dofile(ns .. "entities/props/" .. name .. ".lua")
    end
end