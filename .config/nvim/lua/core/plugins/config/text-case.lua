local textcase = require('textcase')

textcase.setup {}

local telescope_ok, telescope = pcall(require, 'telescope')
local fzf_ok, fzf = pcall(require, 'fzf-lua')

if telescope_ok then
  telescope.load_extension('textcase')

  vim.api.nvim_set_keymap('n', 'cc', ':TextCaseOpenTelescope<CR>', {})
  vim.api.nvim_set_keymap('v', 'cc', ':TextCaseOpenTelescope<CR>', {})
elseif fzf_ok then
  local transformations = {
    ['Convet TO_CONSTANT_CASE'] = 'to_constant_case',
    ['Convet TO UPPER CASE'] = 'to_upper_case',
    ['Convet To Title Case'] = 'to_title_case',
    ['Convet To phrase case'] = 'to_phrase_case',
    ['Convet To-Title-Dash-Case'] = 'to_title_dash_case',
    ['Convet ToPascalCase'] = 'to_pascal_case',
    ['Convet to,comma,case'] = 'to_comma_case',
    ['Convet to-dash-case'] = 'to_dash_case',
    ['Convet to.dot.case'] = 'to_dot_case',
    ['Convet to/path/case'] = 'to_path_case',
    ['Convet toCamelCase'] = 'to_camel_case',
    ['Convet to lower case'] = 'to_lower_case',
    ['Convet to_snake_case'] = 'to_snake_case',
  }

  local function apply_textcase()
    fzf.fzf_exec(function(fzf_cb)
      for transformation, _ in pairs(transformations) do
        fzf_cb(transformation)
      end

      fzf_cb()
    end, {
      prompt = 'Case> ',
      actions = {
        ['default'] = function(selected)
          local transformation = transformations[selected[1]]
          textcase.current_word(transformation)
        end,
      },
    })
  end

  vim.keymap.set('n', 'cc', function() apply_textcase() end, { noremap = true, silent = true })
end
