dofile("data/scripts/lib/mod_settings.lua") -- see this file for documentation on some of the features.

local mod_id = "realistic_particles_fix"
local mod_settings_version = 1
local mod_settings =
{
	{
		category_id = "projectile_bools",
		ui_name = "Particle Changes",
		ui_description = "Enable or disable projectile visuals. Requires a restart to apply.",
        foldable = true,
        _folded = true,
		settings = {
			{
				id = "particles.arrow",
				ui_name = "Arrow",
			},
            {
				id = "particles.black_hole",
				ui_name = "Black Hole",
			},
            {
                id = "particles.bomb_cart",
                ui_name = "Bomb Cart"
            },
            {
                id = "particles.bomb",
                ui_name = "Bomb"
            },
            {
                id = "particles.bouncy_orb",
                ui_name = "Energy Sphere"
            },
            {
                id = "particles.bubbleshot",
                ui_name = "Bubble Spark"
            },
            {
                id = "particles.bullet_heavy",
                ui_name = "Magic Bolt"
            },
            {
                id = "particles.bullet_slow",
                ui_name = "Energy Orb"
            },
            {
                id = "particles.bullet",
                ui_name = "Magic Arrow"
            },
            {
                id = "particles.chain_bolt",
                ui_name = "Chain Bolt"
            },
            {
                id = "particles.death_cross_big",
                ui_name = "Giga Death Cross"
            },
            {
                id = "particles.death_cross",
                ui_name = "Death Cross"
            },
            {
                id = "particles.fireball",
                ui_name = "Fireball"
            },
            {
                id = "particles.firebomb",
                ui_name = "Firebomb"
            },
            {
                id = "particles.firework",
                ui_name = "Fireworks"
            },
            {
                id = "particles.flamethrower",
                ui_name = "Flamethrower"
            },
            {
                id = "particles.freezing_gaze_beam",
                ui_name = "Freezing Gaze"
            },
            {
                id = "particles.glitter_bomb",
                ui_name = "Glitter Bomb"
            },
            {
                id = "particles.glowing_bolt",
                ui_name = "Pinpoint of Light"
            },
            {
                id = "particles.healshot",
                ui_name = "Healing Bolt"
            },
            {
                id = "particles.iceball",
                ui_name = "Iceball"
            },
            {
                id = "particles.lance",
                ui_name = "Glowing Lance"
            },
            {
                id = "particles.laser",
                ui_name = "Concentrated Light"
            },
            {
                id = "particles.light_bullet_air",
                ui_name = "Burst of Air"
            },
            {
                id = "particles.light_bullet",
                ui_name = "Spark Bolt"
            },
            {
                id = "particles.lightning",
                ui_name = "Lightning Bolt"
            },
            {
                id = "particles.meteor",
                ui_name = "Meteor"
            },
            {
                id = "particles.pollen",
                ui_name = "Pollen"
            },
            {
                id = "particles.rocket_tier_2",
                ui_name = "Large Magic Missile"
            },
            {
                id = "particles.rocket",
                ui_name = "Magic Missile"
            },
            {
                id = "particles.rubber_ball",
                ui_name = "Bouncing Burst"
            },
            {
                id = "particles.spitter_tier_2",
                ui_name = "Large Spitter Bolt"
            },
            {
                id = "particles.spitter_tier_3",
                ui_name = "Giant Spitter Bolt"
            },
            {
                id = "particles.spitter",
                ui_name = "Spitter Bolt"
            },
            {
                id = "particles.spore_pod",
                ui_name = "Spore Pod"
            },
            {
                id = "particles.tnt",
                ui_name = "Dynamite"
            }
		},
	},
    {
		category_id = "props_bools",
		ui_name = "Props Changes",
		ui_description = "Enable or disable specific prop visuals. Requires a restart to apply.",
        foldable = true,
        _folded = true,
		settings = {
            {
				id = "particles.physics_barrel_oil",
				ui_name = "Oil Barrel",
			},
            {
				id = "particles.physics_barrel_radioactive",
				ui_name = "Toxic Barrel",
			},
            {
				id = "particles.physics_box_explosive",
				ui_name = "Explosive Box",
			},
            {
				id = "particles.suspended_tank_radioactive",
				ui_name = "Toxic Barrel (Suspended)",
			},
        }
    }
}

-- particles
for i, setting in pairs(mod_settings[1]["settings"]) do
    setting["ui_description"] = "Whether or not to display " .. setting["ui_name"] .. " particles."
    setting["value_default"] = true
    setting["scope"] = MOD_SETTING_SCOPE_RUNTIME_RESTART
end
-- props
for i, setting in pairs(mod_settings[2]["settings"]) do
    setting["ui_description"] = "Whether or not to display " .. setting["ui_name"] .. " particles."
    setting["value_default"] = true
    setting["scope"] = MOD_SETTING_SCOPE_RUNTIME_RESTART
end

function ModSettingsUpdate( init_scope )
	local old_version = mod_settings_get_version( mod_id ) -- This can be used to migrate some settings between mod versions.
	mod_settings_update( mod_id, mod_settings, init_scope )
end

function ModSettingsGuiCount()
	return mod_settings_gui_count( mod_id, mod_settings )
end

function ModSettingsGui( gui, in_main_menu )
	mod_settings_gui( mod_id, mod_settings, gui, in_main_menu )
end
