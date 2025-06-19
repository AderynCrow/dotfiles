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
-- You can configure your bookmarks by lua language
local bookmarks = {}

local path_sep = package.config:sub(1, 1)
local home_path = ya.target_family() == "windows" and os.getenv("USERPROFILE") or os.getenv("HOME")
if ya.target_family() == "windows" then
  table.insert(bookmarks, {
    tag = "Scoop Local",
    
    path = (os.getenv("SCOOP") or home_path .. "\\scoop") .. "\\",
    key = "p"
  })
  table.insert(bookmarks, {
    tag = "Scoop Global",
    path = (os.getenv("SCOOP_GLOBAL") or "C:\\ProgramData\\scoop") .. "\\",
    key = "P"
  })
end
table.insert(bookmarks, {
  tag = "Desktop",
  path = home_path .. path_sep .. "Desktop" .. path_sep,
  key = "d"
})

require("yamb"):setup {
  -- Optional, the path ending with path seperator represents folder.
  bookmarks = bookmarks,
  -- Optional, recieve notification everytime you jump.
  jump_notify = true,
  -- Optional, the cli of fzf.
  cli = "fzf",
  -- Optional, a string used for randomly generating keys, where the preceding characters have higher priority.
  keys = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",
  -- Optional, the path of bookmarks
  path = (ya.target_family() == "windows" and os.getenv("APPDATA") .. "\\yazi\\config\\bookmark") or
        (os.getenv("HOME") .. "/.config/yazi/bookmark"),
}
