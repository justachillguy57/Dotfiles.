local function os_logo()
  local format = vim.bo.fileformat
  if format == 'unix' then
    return ''  -- Linux logo
  elseif format == 'dos' then
    return ''  -- Windows logo
  elseif format == 'mac' then
    return ''  -- Mac logo
  end
end

require 'lualine' .setup {
  options = {
    icons_enabled = true,
    theme = 'tokyonight-night', -- You can change the theme as per your choice
    component_separators = { left = '', right = '' }, -- Chevron-like component separators
    section_separators = { left = '', right = '' },   -- Chevron-like section separators
  },
  sections = {
    lualine_a = { 'mode' }, -- $mode
    lualine_b = { { 'filename', path = 1 }, 'branch' }, -- $file >> $git_branch
    lualine_c = {}, -- Left empty for spacing
    lualine_x = { 'encoding', os_logo, 'filetype' }, -- $charset << $os_logo << $filetype_logo
    lualine_y = {}, -- Optional blank section for spacing
    lualine_z = {}, -- Optional blank section for spacing
  },
}

