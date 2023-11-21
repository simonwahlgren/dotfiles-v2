require("bufferline").setup{
    highlights = {
        buffer_selected = {
            ctermfg = 33,
            italic = false,
        },
        background = {
            ctermfg = 238,
        },
        indicator_selected = {
            ctermfg = 0,
        }
    },
    options = {
        show_buffer_icons = false,
        show_buffer_close_icons = false,
        show_buffer_default_icon = false,
        show_duplicate_prefix = false,
        show_close_icon = false,
        separator_style = {"", ""},
        truncate_names = false,
    },
}

vim.keymap.set("", "<C-n>", ":BufferLineCycleNext<cr>",
  {silent = true, noremap = false}
)
vim.keymap.set("", "<C-p>", ":BufferLineCyclePrev<cr>",
  {silent = true, noremap = false}
)
