local M = {}

function M.telescope()
  local builtin = require("telescope.builtin")
  return {
    { "<leader>ff", builtin.find_files, desc = "Telescope find files" },
    { "<leader>fg", builtin.live_grep,  desc = "Telescope live grep" },
    { "<leader>fb", builtin.buffers,    desc = "Telescope buffers" },
    { "<leader>fh", builtin.help_tags,  desc = "Telescope help tags" },
  }
end

-- Keymaps para git
function M.vim_fugitive()
  return {
    { "<leader>gs", ":Git status", desc = "Git status" },
    { "<leader>gd", ":Git diff",   desc = "Git diff" },
  }
end

-- Keymaps para treesitter
function M.tree_sitter()
  return {
    ["af"] = "@function.outer",
    ["if"] = "@function.inner",
    ["ac"] = "@conditional.outer",
    ["ic"] = "@conditional.inner",
    ["al"] = "@loop.outer",
    ["il"] = "@loop.inner"
  }
end

function M.oil()
  return {
    ["g?"] = "actions.show_help",                                                                                  -- Show help
    ["<CR>"] = "actions.select",                                                                                   -- Select entry
    ["<C-s>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },     -- Open entry in vertical split
    ["<C-h>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" }, -- Open entry in horizontal split
    ["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },                   -- Open entry in new tab
    ["<C-p>"] = "actions.preview",                                                                                 -- Preview entry
    ["<C-c>"] = "actions.close",                                                                                   -- Close oil.nvim
    ["<C-l>"] = "actions.refresh",                                                                                 -- Refresh oil.nvim
    ["-"] = "actions.parent",                                                                                      -- Go to parent directory
    ["_"] = "actions.open_cwd",                                                                                    -- Open current working directory
    ["`"] = "actions.cd",                                                                                          -- Change directory
    ["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory" },                -- Change directory for the current tab
    ["gs"] = "actions.change_sort",                                                                                -- Change sorting method
    ["gx"] = "actions.open_external",                                                                              -- Open entry with external application
    ["g."] = "actions.toggle_hidden",                                                                              -- Toggle hidden files
    ["g\\"] = "actions.toggle_trash",                                                                              -- Toggle trash
  }
end

function M.snacks_picker()
  return {

    --{ "<leader><space>", function() Snacks.picker.smart() end,                                   desc = "Smart Find Files" },
    { "<leader>fg", function() Snacks.picker.grep() end,                                    desc = "Grep" },
    { "<leader>:",  function() Snacks.picker.command_history() end,                         desc = "Command History" },
    { "<leader>n",  function() Snacks.picker.notifications() end,                           desc = "Notification History" },
    { "<leader>e",  function() Snacks.explorer() end,                                       desc = "File Explorer" },
    { "<leader>fh", function() Snacks.picker.help() end,                                    desc = "Help Pages" },
    -- find
    { "<leader>fb", function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
    { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
    { "<leader>ff", function() Snacks.picker.files() end,                                   desc = "Find Files" },
    --{ "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
    { "<leader>fp", function() Snacks.picker.projects() end,                                desc = "Projects" },
    { "<leader>fr", function() Snacks.picker.recent() end,                                  desc = "Recent" },
    -- git
    --{ "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
    --{ "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
    --{ "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
    --{ "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
    --{ "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Git Stash" },
    --{ "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)" },
    --{ "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log File" },
    -- Grep
    --{ "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
    { "<leader>fB", function() Snacks.picker.grep_buffers() end,                            desc = "Grep Open Buffers" },
    --{ "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>sw", function() Snacks.picker.grep_word() end,                               desc = "Visual selection or word", mode = { "n", "x" } },
    -- search
    --{ '<leader>s"', function() Snacks.picker.registers() end, desc = "Registers" },
    --{ '<leader>s/', function() Snacks.picker.search_history() end, desc = "Search History" },
    --{ "<leader>sa", function() Snacks.picker.autocmds() end, desc = "Autocmds" },
    --{ "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
    { "<leader>sc", function() Snacks.picker.command_history() end,                         desc = "Command History" },
    { "<leader>fC", function() Snacks.picker.commands() end,                                desc = "Commands" },
    { "<leader>sd", function() Snacks.picker.diagnostics() end,                             desc = "Diagnostics" },
    { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end,                      desc = "Buffer Diagnostics" },
    --{ "<leader>sH", function() Snacks.picker.highlights() end, desc = "Highlights" },
    { "<leader>si", function() Snacks.picker.icons() end,                                   desc = "Icons" },
    --{ "<leader>sj", function() Snacks.picker.jumps() end, desc = "Jumps" },
    { "<leader>sk", function() Snacks.picker.keymaps() end,                                 desc = "Keymaps" },
    --{ "<leader>sl", function() Snacks.picker.loclist() end, desc = "Location List" },
    --{ "<leader>sm", function() Snacks.picker.marks() end, desc = "Marks" },
    { "<leader>sm", function() Snacks.picker.man() end,                                     desc = "Man Pages" },
    --{ "<leader>sp", function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec" },
    --{ "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
    { "<leader>sR", function() Snacks.picker.resume() end,                                  desc = "Resume" },
    --{ "<leader>su", function() Snacks.picker.undo() end, desc = "Undo History" },
    { "<leader>cT", function() Snacks.picker.colorschemes() end,                            desc = "Colorschemes" },
    -- LSP
    --{ "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
    --{ "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
    --{ "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
    --{ "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
    --{ "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
    --{ "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
    --{ "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
    { "<leader>.",  function() Snacks.scratch() end,                                        desc = "Toggle Scratch Buffer" },
    { "<leader>S",  function() Snacks.scratch.select() end,                                 desc = "Select Scratch Buffer" },
    --{ "<leader>t", function () Snacks.terminal() end, desc = 'Toggle a terminal', mode = { 'n', 't'}},

--    {
--      "<leader>t",
--      function()
--        for _, win in ipairs(vim.api.nvim_list_wins()) do
--          local buf = vim.api.nvim_win_get_buf(win)
--          if vim.api.nvim_get_option_value("buftype", { buf = buf }) == "terminal" then
--            vim.api.nvim_set_current_win(win)
--            return
--          end
--        end
--        Snacks.terminal()
--      end,
--      desc = 'Toggle a terminal',
--      mode = { 'n', 't' }
--    },
    { "<F5>", function()
      local ft = vim.bo.filetype
      local file = vim.fn.expand("%")
      local fname_noext = vim.fn.expand("%:t:r")

      if ft == "java" then
        local cmd = string.format([[
DIR="/tmp/%s_$(date +%%Y%%m%%d_%%H%%M%%S)";
mkdir -p "$DIR";
javac --enable-preview --release 24 "%s" -d "$DIR" &&
cd "$DIR" &&
java --enable-preview -XX:+ShowCodeDetailsInExceptionMessages %s
        ]], fname_noext, file, fname_noext)

        Snacks.terminal(cmd)
      elseif ft == "c" then
        local cmd = string.format([[
DIR="/tmp/%s_$(date +%%Y%%m%%d_%%H%%M%%S)";
mkdir -p "$DIR";
gcc "%s" -o "$DIR/%s.out" &&
"$DIR/%s.out"
        ]], fname_noext, file, fname_noext, fname_noext)

        Snacks.terminal(cmd)
      elseif ft == "cpp" then
        local cmd = string.format([[
DIR="/tmp/%s_$(date +%%Y%%m%%d_%%H%%M%%S)";
mkdir -p "$DIR";
g++ "%s" -o "$DIR/%s.out" &&
"$DIR/%s.out"
        ]], fname_noext, file, fname_noext, fname_noext)

        Snacks.terminal(cmd)
      elseif ft == "python" then
        Snacks.terminal("python3 " .. vim.fn.shellescape(file))
      elseif ft == "sh" then
        Snacks.terminal("bash " .. vim.fn.shellescape(file))
      else
        vim.notify("No run config for filetype: " .. ft, vim.log.levels.WARN)
      end
    end}
  }
end

return M


