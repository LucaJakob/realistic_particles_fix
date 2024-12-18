RP_props =  {
    {
        id = "physics_barrel_oil",
        ui_name = "Oil Barrel",
    },
    {
        id = "physics_barrel_radioactive",
        ui_name = "Toxic Barrel",
    },
    {
        id = "physics_box_explosive",
        ui_name = "Explosive Box",
    },
    {
        id = "suspended_tank_radioactive",
        ui_name = "Toxic Barrel (Suspended)",
    },
    {
        id = "physics_propane_tank",
        ui_name = "Propane Tank",
    }
}

table.sort(RP_props, function(a, b) return a["ui_name"] < b["ui_name"] end)
for i, setting in pairs(RP_props) do
    setting["ui_description"] = "Whether or not to display " .. setting["ui_name"] .. " particles."
    setting["value_default"] = true
    setting["scope"] = MOD_SETTING_SCOPE_RUNTIME_RESTART
end