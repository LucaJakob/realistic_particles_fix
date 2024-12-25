---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml/nxml.lua")
-- "Suomuhauki"
for content in nxml.edit_file("data/entities/projectiles/mine_scavenger.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local explosion = content:first_of("ExplosionComponent"):first_of("config_explosion")

    if explosion then
        explosion:set("sparks_count_min", "50")
        :set("sparks_count_max", "100")
        :set("spark_material", "spark_red")
    end
end
