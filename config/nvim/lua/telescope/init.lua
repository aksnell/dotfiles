local actions = require('telescope.actions')

local options  = {
    prompt_prefix = "> ",
    selection_caret = "> ",
    winblend = 25,
    color_devicons = true,
    vimgrep_arguments = { 'rg', '--smart-case' },
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
}

local mappings = {
    i = {
        ["<esc>"] = actions.close
    },
}

require('telescope').setup{{options, mappings}}
