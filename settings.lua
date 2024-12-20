--- @diagnostic disable: missing-global-doc, lowercase-global
dofile("data/scripts/lib/mod_settings.lua") -- see this file for documentation on some of the features.

mod_id = "realistic_particles_fix"
local mod_settings_version = 1

-- INITIALIZE CURRENT PROJECTILES
RP_projectiles = {
    {
        id = "arrow",
        ui_name = "Arrow",
        sprite = "data/ui_gfx/gun_actions/arrow.png",
    },
    {
        id = "black_hole",
        ui_name = "Black Hole",
        sprite = "data/ui_gfx/gun_actions/black_hole.png",
    },
    {
        id = "bomb_cart",
        ui_name = "Bomb Cart",
        sprite = "data/ui_gfx/gun_actions/bomb_cart.png",
    },
    {
        id = "bomb",
        ui_name = "Bomb",
        sprite = "data/ui_gfx/gun_actions/bomb.png",
    },
    {
        id = "bouncy_orb",
        ui_name = "Energy Sphere",
        sprite = "data/ui_gfx/gun_actions/bouncy_orb.png",
    },
    {
        id = "bubbleshot",
        ui_name = "Bubble Spark",
        sprite = "data/ui_gfx/gun_actions/bubbleshot.png",
    },
    {
        id = "bullet_heavy",
        ui_name = "Magic Bolt",
        sprite = "data/ui_gfx/gun_actions/heavy_bullet.png",
    },
    {
        id = "bullet_slow",
        ui_name = "Energy Orb",
        sprite = "data/ui_gfx/gun_actions/slow_bullet.png",
    },
    {
        id = "bullet",
        ui_name = "Magic Arrow",
        sprite = "data/ui_gfx/gun_actions/bullet.png",
    },
    {
        id = "chain_bolt",
        ui_name = "Chain Bolt",
        sprite = "data/ui_gfx/gun_actions/chain_bolt.png",
    },
    {
        id = "death_cross_big",
        ui_name = "Giga Death Cross",
        sprite = "data/ui_gfx/gun_actions/death_cross_big.png",
    },
    {
        id = "death_cross",
        ui_name = "Death Cross",
        sprite = "data/ui_gfx/gun_actions/death_cross.png",
    },
    {
        id = "fireball",
        ui_name = "Fireball",
        sprite = "data/ui_gfx/gun_actions/fireball.png",
    },
    {
        id = "firebomb",
        ui_name = "Firebomb",
        sprite = "data/ui_gfx/gun_actions/firebomb.png",
    },
    {
        id = "firework",
        ui_name = "Fireworks",
        sprite = "data/ui_gfx/gun_actions/fireworks.png",
    },
    {
        id = "flamethrower",
        ui_name = "Flamethrower",
        sprite = "data/ui_gfx/gun_actions/flamethrower.png",
    },
    {
        id = "freezing_gaze_beam",
        ui_name = "Freezing Gaze",
        sprite = "data/ui_gfx/gun_actions/freezing_gaze.png",
    },
    {
        id = "glitter_bomb",
        ui_name = "Glitter Bomb",
        sprite = "data/ui_gfx/gun_actions/glitter_bomb.png",
    },
    {
        id = "glowing_bolt",
        ui_name = "Pinpoint of Light",
        sprite = "data/ui_gfx/gun_actions/glowing_bolt.png",
    },
    {
        id = "healshot",
        ui_name = "Healing Bolt",
        sprite = "data/ui_gfx/gun_actions/heal_bullet.png",
    },
    {
        id = "iceball",
        ui_name = "Iceball",
        sprite = "data/ui_gfx/gun_actions/iceball.png",
    },
    {
        id = "lance",
        ui_name = "Glowing Lance",
        sprite = "data/ui_gfx/gun_actions/lance.png",
    },
    {
        id = "laser",
        ui_name = "Concentrated Light",
        sprite = "data/ui_gfx/gun_actions/laser.png",
    },
    {
        id = "light_bullet_air",
        ui_name = "Burst of Air",
        sprite = "data/ui_gfx/gun_actions/air_bullet.png",
    },
    {
        id = "light_bullet",
        ui_name = "Spark Bolt",
        sprite = "data/ui_gfx/gun_actions/light_bullet.png",
    },
    {
        id = "lightning",
        ui_name = "Lightning Bolt",
        sprite = "data/ui_gfx/gun_actions/lightning.png",
    },
    {
        id = "meteor",
        ui_name = "Meteor",
        sprite = "data/ui_gfx/gun_actions/meteor.png",
    },
    {
        id = "pollen",
        ui_name = "Pollen",
        sprite = "data/ui_gfx/gun_actions/pollen.png",
    },
    {
        id = "rocket_tier_2",
        ui_name = "Large Magic Missile",
        sprite = "data/ui_gfx/gun_actions/rocket_tier_2.png",
    },
    {
        id = "rocket",
        ui_name = "Magic Missile",
        sprite = "data/ui_gfx/gun_actions/rocket.png",
    },
    {
        id = "rubber_ball",
        ui_name = "Bouncing Burst",
        sprite = "data/ui_gfx/gun_actions/rubber_ball.png",
    },
    {
        id = "spitter_tier_2",
        ui_name = "Large Spitter Bolt",
        sprite = "data/ui_gfx/gun_actions/spitter_green.png",
    },
    {
        id = "spitter_tier_3",
        ui_name = "Giant Spitter Bolt",
        sprite = "data/ui_gfx/gun_actions/spitter_purple.png",
    },
    {
        id = "spitter",
        ui_name = "Spitter Bolt",
        sprite = "data/ui_gfx/gun_actions/spitter.png",
    },
    {
        id = "spore_pod",
        ui_name = "Spore Pod",
        sprite = "data/ui_gfx/gun_actions/spore_pod.png",
    },
    {
        id = "tnt",
        ui_name = "Dynamite",
        sprite = "data/ui_gfx/gun_actions/dynamite.png",
    },
    {
        id = "lance_holy",
        ui_name = "Holy Lance",
        sprite = "data/ui_gfx/gun_actions/lance_holy.png",
    },
    {
        id = "rocket_tier_3",
        ui_name = "Giant Magic Missile",
        sprite = "data/ui_gfx/gun_actions/rocket_tier_3.png",
    },
    {
        id = "nuke",
        ui_name = "Nuke",
        sprite = "data/ui_gfx/gun_actions/nuke.png",
    },
    {
        id = "bomb_holy",
        ui_name = "Holy Bomb",
        sprite = "data/ui_gfx/gun_actions/bomb_holy.png",
    },
    {
        id = "nuke_giga",
        ui_name = "Giga Nuke",
        sprite = "data/ui_gfx/gun_actions/nuke_giga.png",
    },
    {
        id = "grenade",
        ui_name = "Firebolt",
        sprite = "data/ui_gfx/gun_actions/grenade.png",
    },
    {
        id = "grenade_tier_2",
        ui_name = "Large Firebolt",
        sprite = "data/ui_gfx/gun_actions/grenade_tier_2.png",
    },
    {
        id = "grenade_tier_3",
        ui_name = "Giant Firebolt",
        sprite = "data/ui_gfx/gun_actions/grenade_tier_3.png",
    },
}

-- INITIALIZE CURRENT PROPS
RP_props = {
    {
        id = "physics_barrel_oil",
        ui_name = "Oil Barrel",
        sprite = "data/props_gfx/barrel_unstable.png",
        scope = MOD_SETTING_SCOPE_NEW_GAME,
    },
    {
        id = "physics_barrel_radioactive",
        ui_name = "Toxic Barrel",
        sprite = "data/props_gfx/barrel_radioactive.png",
        scope = MOD_SETTING_SCOPE_NEW_GAME,
    },
    {
        id = "physics_box_explosive",
        ui_name = "Explosive Box",
        sprite = "data/props_gfx/tnt.png",
        scope = MOD_SETTING_SCOPE_NEW_GAME,
    },
    {
        id = "physics_propane_tank",
        ui_name = "Propane Tank",
        sprite = "data/props_gfx/propane_tank.png",
        scope = MOD_SETTING_SCOPE_NEW_GAME,
    },
    {
        id = "physics_crate",
        ui_name = "Explosive Crate",
        sprite = "data/props_gfx/crate.png",
        scope = MOD_SETTING_SCOPE_NEW_GAME,
    },
    {
        id = "physics_fungus",
        ui_name = "Fungus",
        sprite = "data/props_gfx/physics_fungus_cap_03.png",
        scope = MOD_SETTING_SCOPE_NEW_GAME,
    },
    {
        id = "physics_seamine",
        ui_name = "Seamine",
        sprite = "data/props_gfx/seamine.png",
        scope = MOD_SETTING_SCOPE_NEW_GAME,
    },
    {
        id = "physics_pressure_tank",
        ui_name = "Acid Barrel",
        sprite = "data/props_gfx/pressure_tank.png",
        scope = MOD_SETTING_SCOPE_NEW_GAME,
    },
}

RP_categories = {
    {
        ui_name = "----- Projectiles -----",
        ui_description = "Manage particles related to projectiles",
        folder_path = "mods/" .. mod_id .. "/files/entities/projectiles/",
        items = RP_projectiles,
        _folded = true,
    },
    {
        ui_name = "----- Physics Objects -----",
        ui_description = "Manage particles related to physics objects",
        folder_path = "mods/" .. mod_id .. "/files/entities/props/",
        items = RP_props,
        _folded = true,
    },
}

for _, category in ipairs(RP_categories) do
    local items = category["items"]
    table.sort(items, function(a, b)
        return a["ui_name"] < b["ui_name"]
    end)
    for _, setting in pairs(items) do
        setting["ui_description"] = "Whether or not to display " .. setting["ui_name"] .. " particles."
        setting["value_default"] = true
        if setting["scope"] == nil then
            setting["scope"] = MOD_SETTING_SCOPE_RUNTIME_RESTART
        end
    end
end

-- INITIALIZE UTILITY FUNCTIONS

function ToSettingId(any_global)
    return mod_id .. "." .. "particles_" .. any_global.id .. "_off"
end

--- INITIALIZE SETTINGS

function ModSettingsUpdate(init_scope)
    -- set settings to new value if the update scope is correct
    for _, category in ipairs(RP_categories) do
        for _, item in ipairs(category["items"]) do
            if MOD_SETTING_SCOPE_RUNTIME_RESTART >= init_scope then
                local next_value = ModSettingGetNextValue(ToSettingId(item))
                if next_value ~= nil then ModSettingSet(ToSettingId(item), next_value) end
            end
        end
    end

    -- update mod settings version
    if type(mod_settings_version) == "number" then ModSettingSet(ToSettingId({ id = "_version", }), mod_settings_version) end
end

function ModSettingsGuiCount()
    local count = 0
    for _, category in ipairs(RP_categories) do
        count = count + #category["items"]
    end
    return count
end

local function GuiOptionIcon( gui, element_id, image_file, hovered, box_height )
    -- Make image responsive to hover
    local x_offset = 5

    local fit_box_scale = 1 / select(2, GuiGetImageDimensions( gui, image_file, 1 )) * box_height
    local unhovered_scale = fit_box_scale * 0.83
    local scale = hovered and fit_box_scale or unhovered_scale

    local img_width, img_height = GuiGetImageDimensions( gui, image_file, scale )

    local img_y_offset = (box_height - img_height) / 2

    local img_x = x_offset - (img_width / 2)
    local img_y = hovered and 0 or img_y_offset

    GuiImage(gui, element_id, img_x, img_y, image_file, 1, scale)
end

local function CustomCheckboxGui(gui, element_id, any_global)
    local image_file = any_global.sprite or "data/ui_gfx/gun_actions/unidentified.png"
    local text_len, text_height = GuiGetTextDimensions(gui, any_global.ui_name)

    local mod_setting_id = ToSettingId(any_global)
    local disabled = ModSettingGet(mod_setting_id)
    local disabled_next = ModSettingGetNextValue(mod_setting_id)

    GuiOptionsAdd(gui, GUI_OPTION.Layout_NextSameLine)
    GuiText(gui, 0, 0, "")
    local _, _, _, x, y = GuiGetPreviousWidgetInfo(gui)

    local nine_piece_height = 16
    --- Hover box and tooltip
    GuiOptionsAddForNextWidget(gui, GUI_OPTION.ForceFocusable)
    GuiImageNinePiece(gui, element_id, x, y, text_len + 27, nine_piece_height, 0)

    local text_x = 25
    local text_y = math.ceil((nine_piece_height - text_height) / 2)

    local clicked, _, hovered = GuiGetPreviousWidgetInfo(gui)

    local tooltip_text = disabled_next and "[ Click to enable ]" or "[ Click to disable ]"
    if disabled ~= disabled_next then
        local notify_text = GameTextGetTranslatedOrNot("$menu_modsettings_changes_restart")
        if any_global["scope"] == MOD_SETTING_SCOPE_NEW_GAME then
            notify_text = GameTextGetTranslatedOrNot("$menu_modsettings_changes_worldgen")
        end

        tooltip_text = tooltip_text .. "\n" .. notify_text
    end

    GuiTooltip(gui, any_global.ui_description, tooltip_text)
    GuiOptionIcon( gui, element_id, image_file, hovered, nine_piece_height )
    --- Text
    if disabled_next then
        GuiColorSetForNextWidget(gui, 0.6, 0.6, 0.6, 1)
    elseif hovered then
        GuiColorSetForNextWidget(gui, 1, 1, 0.7, 1)
    end
    GuiText(gui, text_x, text_y, any_global.ui_name)

    GuiOptionsRemove(gui, GUI_OPTION.Layout_NextSameLine)
    GuiText(gui, 0, 5, " ")

    if clicked then
        ModSettingSetNextValue(mod_setting_id, not disabled_next, false)
    end
end

function GuiToggleAllButtons(gui, id_enable_all, id_disable_all, enumerable)
    GuiLayoutBeginHorizontal(gui, 0, 0, false, 15, 10)

    if GuiButton(gui, id_enable_all, 0, 0, "Enable All") then
        for _, item in ipairs(enumerable) do
            local mod_setting_id = ToSettingId(item)
            ModSettingSetNextValue(mod_setting_id, false, false)
        end
    end

    if GuiButton(gui, id_disable_all, 0, 0, "Disable All") then
        for _, item in ipairs(enumerable) do
            local mod_setting_id = ToSettingId(item)
            ModSettingSetNextValue(mod_setting_id, true, false)
        end
    end
    GuiLayoutEnd(gui)
end

function ModSettingsGui(gui, in_main_menu)
    -- These are global variables, despite the warning
    screen_width, screen_height = GuiGetScreenDimensions(gui)

    local _id = 3386002831 -- == workshop id
    local function id()
        _id = _id + 1
        return _id
    end

    for i, category in ipairs(RP_categories) do
        local clicked_category_heading = mod_setting_category_button(mod_id, gui, id(), id(), category)
        if not category._folded then
            local items = category["items"]
            GuiAnimateBegin(gui)

            GuiAnimateAlphaFadeIn(gui, id(), 0.1, 0.0, clicked_category_heading)

            GuiText(gui, 0, 0, " ")
            GuiToggleAllButtons(gui, id(), id(), items)

            for _, spell in ipairs(items) do
                CustomCheckboxGui(gui, id(), spell)
            end

            GuiAnimateEnd(gui)
            GuiLayoutAddVerticalSpacing(gui, 4)
        end
    end
end
