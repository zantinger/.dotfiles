require('cheatsheet').setup({
    telescope_mappings = {
        ['<CR>'] = require('cheatsheet.telescope.actions').select_or_execute,
        ['<A-CR>'] = require('cheatsheet.telescope.actions').select_or_fill_commandline,
    }
})
