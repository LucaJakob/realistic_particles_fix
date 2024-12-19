dofile_once("mods/realistic_particles_fix/settings.lua")

for _, category in pairs(RP_categories) do
    for _, item in pairs( category["items"] ) do
        local mod_setting_id = ToSettingId(item)
        if not ModSettingGet(mod_setting_id) then
            dofile_once( category.folder_path .. item.id .. ".lua" )
        end
    end
end
