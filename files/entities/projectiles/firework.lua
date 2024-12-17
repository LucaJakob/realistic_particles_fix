---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml/nxml.lua")

-- BLUE
for content in nxml.edit_file("data/entities/projectiles/deck/fireworks/firework_blue.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local explosion = content:first_of("ProjectileComponent"):first_of("config_explosion")
    if explosion then
        explosion:set("sparks_count_min", "25") -- from "7"
        :set("sparks_count_max", "45") -- from "20"
    end
    
    local emitters = content:all_of("ParticleEmitterComponent")

    -- Smoke
    if emitters[1] then
        emitters[1]:set("count_min", "15") -- from "5"
        :set("count_max", "25") -- from "5"
    end

    -- Plasma fading 1
    if emitters[2] then
        emitters[2]:set("count_min", "28") -- from "1"
        :set("count_max", "48") -- from "8"
        :set("lifetime_min", "2.3") -- from "0.3"
        :set("lifetime_max", "5.5") -- from "0.5"
        :set("airflow_force", "2.6") -- from "0.6"
    end

    -- Plasma fading 2
    if emitters[3] then
        emitters[3]:set("count_min", "28") -- from "1"
        :set("count_max", "48") -- from "8"
        :set("lifetime_min", "4.3") -- from "0.3"
        :set("lifetime_max", "6.5") -- from "0.5"
        :set("airflow_force", "2.6") -- from "0.6"
    end

    -- Plasma fading 2
    if emitters[4] then
        emitters[4]:set("count_min", "28") -- from "1"
        :set("count_max", "48") -- from "8"
        :set("lifetime_min", "4.3") -- from "0.3"
        :set("lifetime_max", "6.5") -- from "0.5"
        :set("airflow_force", "3.6") -- from "0.6"
    end
end

-- GREEN
for content in nxml.edit_file("data/entities/projectiles/deck/fireworks/firework_green.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local explosion = content:first_of("ProjectileComponent"):first_of("config_explosion")
    if explosion then
        explosion:set("sparks_count_min", "34") -- from "7"
        :set("sparks_count_max", "52") -- from "20"
    end
    
    local emitters = content:all_of("ParticleEmitterComponent")

    -- Smoke
    if emitters[1] then
        emitters[1]:set("count_min", "25") -- from "5"
        :set("count_max", "45") -- from "5"
    end

    -- Fading green 1
    if emitters[2] then
        emitters[2]:set("count_min", "28") -- from "1"
        :set("count_max", "48") -- from "8"
        :set("lifetime_min", "4.3") -- from "0.3"
        :set("lifetime_max", "5.5") -- from "0.5"
        :set("airflow_force", "3.6") -- from "0.6"
    end

    -- Fading green 2
    if emitters[3] then
        emitters[3]:set("count_min", "28") -- from "1"
        :set("count_max", "48") -- from "8"
        :set("lifetime_min", "6.3") -- from "0.3"
        :set("lifetime_max", "8.5") -- from "0.5"
        :set("airflow_force", "3.6") -- from "0.6"
    end

    -- Fading green 2
    if emitters[4] then
        emitters[4]:set("count_min", "28") -- from "1"
        :set("count_max", "48") -- from "8"
        :set("lifetime_min", "4.3") -- from "0.3"
        :set("lifetime_max", "8.5") -- from "0.5"
        :set("airflow_force", "3.6") -- from "0.6"
    end

    -- Sparse green
    if emitters[5] then
        emitters[5]:set("count_min", "28") -- from "1"
        :set("count_max", "48") -- from "1"
        :set("lifetime_min", "4.4") -- from "1.4"
        :set("lifetime_max", "8.5") -- from "1.5"
        :set("airflow_force", "3.5") -- from "0.5"
    end
end

-- ORANGE
for content in nxml.edit_file("data/entities/projectiles/deck/fireworks/firework_orange.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local explosion = content:first_of("ProjectileComponent"):first_of("config_explosion")
    if explosion then
        explosion:set("sparks_count_min", "28") -- from "7"
        :set("sparks_count_max", "48") -- from "20"
    end
    
    local emitters = content:all_of("ParticleEmitterComponent")

    -- Smoke
    if emitters[1] then
        emitters[1]:set("count_min", "25") -- from "5"
        :set("count_max", "28") -- from "5"
    end

    -- Spark 1
    if emitters[2] then
        emitters[2]:set("count_min", "28") -- from "1"
        :set("count_max", "48") -- from "8"
        :set("lifetime_min", "4.3") -- from "0.3"
        :set("lifetime_max", "6.5") -- from "0.5"
        :set("airflow_force", "3.6") -- from "0.6"
    end

    -- Spark 2
    if emitters[3] then
        emitters[3]:set("count_min", "28") -- from "1"
        :set("count_max", "48") -- from "8"
        :set("lifetime_min", "4.3") -- from "0.3"
        :set("lifetime_max", "6.5") -- from "0.5"
        :set("airflow_force", "3.6") -- from "0.6"
    end

    -- Sparse spark
    if emitters[4] then
        emitters[4]:set("count_min", "18") -- from "1"
        :set("count_max", "28") -- from "1"
        :set("lifetime_min", "3.4") -- from "1.4"
        :set("lifetime_max", "5.5") -- from "1.5"
        :set("airflow_force", "3.5") -- from "0.5"
    end
end

-- PINK
for content in nxml.edit_file("data/entities/projectiles/deck/fireworks/firework_pink.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local explosion = content:first_of("ProjectileComponent"):first_of("config_explosion")
    if explosion then
        explosion:set("sparks_count_min", "17") -- from "7"
        :set("sparks_count_max", "28") -- from "20"
    end
    
    local emitters = content:all_of("ParticleEmitterComponent")

    -- Smoke
    if emitters[1] then
        emitters[1]:set("count_min", "18") -- from "5"
        :set("count_max", "28") -- from "5"
    end

    -- Fading Pink 1
    if emitters[2] then
        emitters[2]:set("count_min", "28") -- from "1"
        :set("count_max", "48") -- from "8"
        :set("lifetime_min", "4.3") -- from "0.3"
        :set("lifetime_max", "6.5") -- from "0.5"
        :set("airflow_force", "3.6") -- from "0.6"
    end

    -- Fading Pink 2 
    if emitters[3] then
        emitters[3]:set("count_min", "28") -- from "1"
        :set("count_max", "48") -- from "8"
        :set("lifetime_min", "4.3") -- from "0.3"
        :set("lifetime_max", "6.5") -- from "0.5"
        :set("airflow_force", "3.6") -- from "0.6"
    end

    -- Fading Pink 3
    if emitters[4] then
        emitters[4]:set("count_min", "28") -- from "1"
        :set("count_max", "48") -- from "8"
        :set("lifetime_min", "3.3") -- from "0.3"
        :set("lifetime_max", "6.5") -- from "0.5"
        :set("airflow_force", "3.6") -- from "0.6"
    end

    -- Sparse pink
    if emitters[5] then
        emitters[5]:set("count_min", "7") -- from "1"
        :set("count_max", "11") -- from "1"
        :set("lifetime_min", "2.4") -- from "1.4"
        :set("lifetime_max", "4.5") -- from "1.5"
        :set("airflow_force", "3.5") -- from "0.5"
    end
end
