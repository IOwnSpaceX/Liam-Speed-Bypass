Config = {}

-- Default speed limit (mph)
Config.DefaultSpeedLimit = 135

-- ACE permission name for speed bypass
Config.SpeedBypassAce = "speedbypass"

-- Multiple speed bypass levels (mph)
Config.SpeedBypassLevels = {
    {ace = "speedbypass.owner", limit = 180},
    {ace = "speedbypass.leo", limit = 160},
    {ace = "speedbypass.speedy", limit = 150}
}

----- FROM HERE AND BELOW DOES NOT WORK (THIS WILL BE FIXED AND USED IN A LATER UPDATE) -----
-- Optional duty export (set to false if not using)
--Config.DutyExport = false -- To add a duty export it would look like this: Config.DutyExport = {resource = "leoDuty", function = "getPlayerDuty"}

-- Duty-specific ACE permissions (only used if DutyExport is set)
--Config.DutyAce = {
    --["speedbypass.leo"] = Config.DefaultSpeedLimit -- When LEO is off duty, use this ACE instead
--}