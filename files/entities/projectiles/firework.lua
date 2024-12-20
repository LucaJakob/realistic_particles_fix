---@type nxml
local nxml = dofile_once("mods/realistic_particles_fix/lib/nxml/nxml.lua")

-- BLUE
for content in nxml.edit_file("data/entities/projectiles/deck/fireworks/firework_blue.xml", ModTextFileGetContent, ModTextFileSetContent) do
    local explosion = content:first_of("ProjectileComponent"):first_of("config_explosion")
    if explosion then
        explosion:set("sparks_count_min", "25") -- from "7"
        :set("sparks_count_max", "45") -- from "20"
    end
    
    local smoke_emitter_real,
    trail_emitter1,
    trail_emitter2,
    trail_emitter3,
    sparse_emitter = unpack(content:all_of("ParticleEmitterComponent"))

    if smoke_emitter_real then
        local emitter = smoke_emitter_real:clone()
        emitter:set("create_real_particles", "0")
        :set("emit_real_particles", "0")
        :set("emit_cosmetic_particles", "1")
        :set("count_min", "10") -- from "5"
        :set("count_max", "20") -- from "5"
        content:add_child(emitter)
    end

    if trail_emitter1 then
        trail_emitter1:set("count_min", "28") -- from "1"
        :set("count_max", "48") -- from "8"
        :set("lifetime_min", "2.3") -- from "0.3"
        :set("lifetime_max", "5.5") -- from "0.5"
        :set("airflow_force", "2.6") -- from "0.6"
    end

    if trail_emitter2 then
        trail_emitter2:set("count_min", "28") -- from "1"
        :set("count_max", "48") -- from "8"
        :set("lifetime_min", "4.3") -- from "0.3"
        :set("lifetime_max", "6.5") -- from "0.5"
        :set("airflow_force", "2.6") -- from "0.6"
    end

    if trail_emitter3 then
        trail_emitter3:set("count_min", "28") -- from "1"
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
    
    local smoke_emitter_real,
    trail_emitter1,
    trail_emitter2,
    trail_emitter3,
    sparse_emitter = unpack(content:all_of("ParticleEmitterComponent"))

    if smoke_emitter_real then
        local emitter = smoke_emitter_real:clone()
        emitter:set("create_real_particles", "0")
        :set("emit_real_particles", "0")
        :set("emit_cosmetic_particles", "1")
        :set("count_min", "25") -- from "5"
        :set("count_max", "40") -- from "5"
        content:add_child(emitter)
    end

    if trail_emitter1 then
        trail_emitter1:set("count_min", "28") -- from "1"
        :set("count_max", "48") -- from "8"
        :set("lifetime_min", "4.3") -- from "0.3"
        :set("lifetime_max", "5.5") -- from "0.5"
        :set("airflow_force", "3.6") -- from "0.6"
    end

    if trail_emitter2 then
        trail_emitter2:set("count_min", "28") -- from "1"
        :set("count_max", "48") -- from "8"
        :set("lifetime_min", "6.3") -- from "0.3"
        :set("lifetime_max", "8.5") -- from "0.5"
        :set("airflow_force", "3.6") -- from "0.6"
    end

    if trail_emitter3 then
        trail_emitter3:set("count_min", "28") -- from "1"
        :set("count_max", "48") -- from "8"
        :set("lifetime_min", "4.3") -- from "0.3"
        :set("lifetime_max", "8.5") -- from "0.5"
        :set("airflow_force", "3.6") -- from "0.6"
    end

    if sparse_emitter then
        sparse_emitter:set("count_min", "28") -- from "1"
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
    
    local smoke_emitter_real,
    trail_emitter1,
    trail_emitter2,
    trail_emitter3,
    sparse_emitter = unpack(content:all_of("ParticleEmitterComponent"))

    if smoke_emitter_real then
        local emitter = smoke_emitter_real:clone()
        emitter:set("create_real_particles", "0")
        :set("emit_real_particles", "0")
        :set("emit_cosmetic_particles", "1")
        :set("count_min", "20") -- from "5"
        :set("count_max", "23") -- from "5"
        content:add_child(emitter)
    end

    if trail_emitter1 then
        trail_emitter1:set("count_min", "28") -- from "1"
        :set("count_max", "48") -- from "8"
        :set("lifetime_min", "4.3") -- from "0.3"
        :set("lifetime_max", "6.5") -- from "0.5"
        :set("airflow_force", "3.6") -- from "0.6"
    end

    if trail_emitter2 then
        trail_emitter2:set("count_min", "28") -- from "1"
        :set("count_max", "48") -- from "8"
        :set("lifetime_min", "4.3") -- from "0.3"
        :set("lifetime_max", "6.5") -- from "0.5"
        :set("airflow_force", "3.6") -- from "0.6"
    end

    if trail_emitter3 then
        trail_emitter3:set("count_min", "18") -- from "1"
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
    
    local smoke_emitter_real,
    trail_emitter1,
    trail_emitter2,
    trail_emitter3,
    sparse_emitter = unpack(content:all_of("ParticleEmitterComponent"))

    if smoke_emitter_real then
        local emitter = smoke_emitter_real:clone()
        emitter:set("create_real_particles", "0")
        :set("emit_real_particles", "0")
        :set("emit_cosmetic_particles", "1")
        :set("count_min", "13") -- from "5"
        :set("count_max", "23") -- from "5"
        content:add_child(emitter)
    end

    if trail_emitter1 then
        trail_emitter1:set("count_min", "28") -- from "1"
        :set("count_max", "48") -- from "8"
        :set("lifetime_min", "4.3") -- from "0.3"
        :set("lifetime_max", "6.5") -- from "0.5"
        :set("airflow_force", "3.6") -- from "0.6"
    end

    if trail_emitter2 then
        trail_emitter2:set("count_min", "28") -- from "1"
        :set("count_max", "48") -- from "8"
        :set("lifetime_min", "4.3") -- from "0.3"
        :set("lifetime_max", "6.5") -- from "0.5"
        :set("airflow_force", "3.6") -- from "0.6"
    end

    if trail_emitter3 then
        trail_emitter3:set("count_min", "28") -- from "1"
        :set("count_max", "48") -- from "8"
        :set("lifetime_min", "3.3") -- from "0.3"
        :set("lifetime_max", "6.5") -- from "0.5"
        :set("airflow_force", "3.6") -- from "0.6"
    end

    if sparse_emitter then
        sparse_emitter:set("count_min", "7") -- from "1"
        :set("count_max", "11") -- from "1"
        :set("lifetime_min", "2.4") -- from "1.4"
        :set("lifetime_max", "4.5") -- from "1.5"
        :set("airflow_force", "3.5") -- from "0.5"
    end
end