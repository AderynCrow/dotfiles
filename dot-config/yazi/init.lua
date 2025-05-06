require("full-border"):setup()

function human_readable_time(timestamp)
    -- Current time and date components
    local now = os.time()
    local now_date = os.date("*t", now)
    local date = os.date("*t", timestamp)

    -- Calculate the difference in days
    local diff_seconds = os.difftime(now, timestamp)
    local diff_days = math.floor(diff_seconds / (24 * 60 * 60))

    if diff_days >= 365 then
        -- Return "day month year" format (e.g., "15 Dec 2020")
        return os.date("%d %b %Y", timestamp)
    elseif diff_days >= 7 then
        -- Return "day month" format (e.g., "15 Dec")
        return os.date("%d %b", timestamp)
    elseif diff_days >= 1 then
        -- Return abbreviated day name (e.g., "Mon")
        return os.date("%a", timestamp)
    else
        -- Return "hours:minutes" format (e.g., "14:30")
        return os.date("%H:%M", timestamp)
    end
end

function Linemode:custom()
	if self._file.cha.is_dir then
		return ui.Line("")
	end
  -- local mimetype = self_file.mimetype
  --local size = self._file:size()
  --size = size and ya.readable_size(size) or ""
  local time = math.floor(self._file.cha.mtime or 0)
  return ui.Line(string.format("%s", human_readable_time(time)))
  -- return ui.Line(string.format("%s %s", size, mimetype))
end

Header:children_add(function()
	if ya.target_family() ~= "unix" then
		return ""
	end
	return ui.Span(ya.user_name() .. "@" .. ya.host_name() .. ":"):fg("blue")
end, 500, Header.LEFT)
