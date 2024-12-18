dofile("data/scripts/lib/mod_settings.lua") -- see this file for documentation on some of the features.

local mod_id = "realistic_particles_fix"
dofile_once("mods/" .. mod_id .. "/files/globals/utils.lua")
dofile_once("mods/" .. mod_id .. "/files/globals/projectiles.lua")
dofile_once("mods/" .. mod_id .. "/files/globals/props.lua")

local mod_settings_version = 1

local projectiles_category = {
    ui_name = "----- Projectiles -----",
    ui_description = "Manage particles related to projectiles",
    _folded = true
}
local props_category = {
    ui_name = "----- Physics Objects -----",
    ui_description = "Manage particles related to physics objects",
    _folded = true
}

function ModSettingsUpdate( init_scope )
    mod_settings_update( mod_id, {}, init_scope)
	-- local old_version = mod_settings_get_version( mod_id ) -- This can be used to migrate some settings between mod versions.
    -- for i, item in ipairs(RP_projectiles) do
    --     -- Default is true, but if user has selected false, it won't be overridden
    --     ModSettingSetNextValue( ToSettingId( item ), false, true )
    -- end
    -- for i, item in ipairs(RP_props) do
    --     -- Default is true, but if user has selected false, it won't be overridden
    --     ModSettingSetNextValue( ToSettingId( item ), true, true )
    -- end

	-- -- set settings to new value if the update scope is correc
    -- for i, item in ipairs(RP_projectiles) do
    --     if MOD_SETTING_SCOPE_RUNTIME_RESTART >= init_scope then
    --         local next_value = ModSettingGetNextValue( ToSettingId( item ) )
    --         if next_value ~= nil then
    --             ModSettingSet( ToSettingId( item ), next_value )
    --         end
    --     end
    -- end
    -- for i, item in ipairs(RP_props) do
    --     if MOD_SETTING_SCOPE_RUNTIME_RESTART >= init_scope then
    --         local next_value = ModSettingGetNextValue( ToSettingId( item ) )
    --         if next_value ~= nil then
    --             ModSettingSet( ToSettingId( item ), next_value )
    --         end
    --     end
    -- end

	-- -- update mod settings version
	-- if type(mod_settings_version) == "number" then
	-- 	ModSettingSet( ToSettingId( { id = "_version" } ), mod_settings_version )
	-- end
end


function ModSettingsGuiCount()
	return #RP_projectiles + #RP_props
end





local function CustomCheckboxGui ( gui, element_id, any_global )
    GuiLayoutBeginHorizontal( gui, 0, 0, false, 2, 2 )

    if (GuiImageButton( gui, element_id, 5, 0, "", any_global.sprite )) then
        Toggle( any_global )
    end

    if IsDisabledNext( any_global ) then
        GuiTooltip( gui, any_global.ui_description, "[ Click to enable ]");
    else
        GuiTooltip( gui, any_global.ui_description, "[ Click to disable ]");
    end

    if IsDisabledNext( any_global ) then
        GuiOptionsAddForNextWidget( gui, GUI_OPTION.DrawSemiTransparent )
        if (GuiButton( gui, element_id, 0, 1, any_global.ui_name )) then
            Toggle( any_global )
        end
    else
        if (GuiButton( gui, element_id, 1.5, 1, any_global.ui_name )) then
            Toggle( any_global )
        end
    end

    if IsDisabledNext( any_global ) then
        GuiTooltip( gui, any_global.ui_description, "[ Click to enable ]" );
    else
        GuiTooltip( gui, any_global.ui_description, "[ Click to disable ]" );
    end

    GuiLayoutEnd( gui )
end

function GuiToggleAllButtons( gui, id_enable_all, id_disable_all, enumerable )
    GuiLayoutBeginHorizontal( gui, 0, 0, false, 15, 10 )

    if (GuiButton( gui, id_enable_all, 0, 0, "Enable All" )) then
        for i, item in pairs( enumerable ) do
            Enable( item )
        end
    end

    if (GuiButton( gui, id_disable_all, 0, 0, "Disable All" )) then
        for i, item in pairs( enumerable )do
            Disable( item )
        end
    end
    GuiLayoutEnd(gui)
end

function ModSettingsGui( gui, in_main_menu )
    
    -- These are global variables, despite the warning
	screen_width, screen_height = GuiGetScreenDimensions(gui)

    local _id = 3386002831 -- == workshop id
    local function id()
        _id = _id + 1
        return _id
    end
    
    local clicked_category_heading = mod_setting_category_button( mod_id, gui, id(), id(), projectiles_category)
    if not projectiles_category._folded then
        GuiAnimateBegin( gui )

        GuiAnimateAlphaFadeIn( gui, 3458923234, 0.1, 0.0, clicked_category_heading )
        
        GuiText( gui, 0, 0, " " )
        GuiToggleAllButtons( gui, id(), id(), RP_projectiles )

        for i, projectile in pairs( RP_projectiles ) do
            CustomCheckboxGui( gui, id(), projectile )
        end

        GuiAnimateEnd( gui )
        GuiLayoutAddVerticalSpacing( gui, 4 )
    end

    clicked_category_heading = mod_setting_category_button( mod_id, gui, id(), id(), props_category)
    if not props_category._folded then
        GuiAnimateBegin( gui )

        GuiAnimateAlphaFadeIn( gui, 3458923234, 0.1, 0.0, clicked_category_heading )
        
        GuiText( gui, 0, 0, " " )
        GuiToggleAllButtons( gui, id(), id(), RP_props )

        for i, prop in pairs( RP_props ) do
            CustomCheckboxGui( gui, id(), prop )
        end

        GuiAnimateEnd( gui )
        GuiLayoutAddVerticalSpacing( gui, 4 )
    end
end
