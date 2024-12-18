-- Settings utility functions

mod_id = "realistic_particles_fix"

function ToSettingId( any_global )
    return mod_id .. "." .. "particles_" .. any_global.id .. "_off"
end

function Disable( projectile_or_prop )
    ModSettingSet( ToSettingId( projectile_or_prop ), true )
end

function Enable( projectile_or_prop )
    ModSettingRemove( ToSettingId( projectile_or_prop ) )
end

function Toggle( projectile_or_prop )
    if IsDisabledNext( projectile_or_prop ) then
        Enable( projectile_or_prop )
    else
        Disable( projectile_or_prop )
    end
end

function IsDisabledNext( projectile_or_prop )
    local val = ModSettingGet(ToSettingId( projectile_or_prop ))
    if val ~= nil then
		return val
    else
		return false
    end
end

function IsDisabled( projectile_or_prop )
    local val = ModSettingGet( ToSettingId( projectile_or_prop ))
    if val ~= nil then
		return val
    else
		return false
    end
end