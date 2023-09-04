require('gitsigns').setup {
  signs = {
    add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
    change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    topdelete = { hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    changedelete = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    untracked = { hl = "GitSignsUntracked", text = "┆", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000, -- Disable if file is longer than this (in lines)
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm = {
    enable = false
  },
  on_attach = function(bufnr) 
    local gs = package.loaded.gitsigns
    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr=true})
    
    map('n', '<leader>b', function() open_commit(gs.current_line_blame.abbrev_sha) end);

    -- Actions
    -- map('n', '<leader>hs', gs.stage_hunk)
    map('n', '<leader>ghr', gs.reset_hunk)
    -- map('v', '<leader>hs', function() gs.stage_hunk {vim.fn.line("."), vim.fn.line("v")} end)
    -- map('v', '<leader>hr', function() gs.reset_hunk {vim.fn.line("."), vim.fn.line("v")} end)
    -- map('n', '<leader>hS', gs.stage_buffer)
    -- map('n', '<leader>hu', gs.undo_stage_hunk)
    -- map('n', '<leader>hR', gs.reset_buffer)
    map('n', '<leader>ghp', gs.preview_hunk)
    -- map('n', '<leader>hb', function() gs.blame_line{full=true} end)
    -- map('n', '<leader>tb', gs.toggle_current_line_blame)
    -- map('n', '<leader>gd', gs.diffthis)
    -- map('n', '<leader>gD', function() gs.diffthis('~') end)
    -- map('n', '<leader>td', gs.toggle_deleted)

    -- Text object
    -- map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}

function open_commit(hash) 
    local current_buffer = vim.fn.expand("%:p:h")
    local repo_url = vim.fn.system("git -C " .. current_buffer .. " config --get remote.origin.url")

    if repo_url:len() == 0 then
        return
    end

    local gh = parse_gh_remote(repo_url)
    if gh == nil then
        print("Error parsing GitHub remote URL")
        vim.g.openingh = false
        return
    end

    parsed_repo_url = string.format("http://%s/%s/%s", gh.host, gh.user_or_org, gh.reponame)

    io.popen(parsed_repo_url .. '/commit/' .. hash)
end

-- returns a table with the host, user/org and the reponame given a github remote url
-- nil is returned when the url cannot be parsed
function parse_gh_remote(url)
  -- 3 capture groups for host, org/user and repo. whitespace is trimmed
  -- when cloning with http://, gh redirects to https://, but remote stays http
  local http = { string.find(url, "https?://([^/]*)/([^/]*)/([^%s/]*)") }
  -- ssh url can be of type:
  -- git@some.github.com:user_or_org/reponame.git
  -- ssh://git@some.github.com/user_or_org/reponame.git
  -- .* is used for ssh:// since lua matching doesn't support optional groups, only chars
  local ssh = { string.find(url, ".*git@(.*)[:/]([^/]*)/([^%s/]*)") }

  local matches = http[1] == nil and ssh or http
  if matches[1] == nil then
    return nil
  end

  local _, _, host, user_or_org, reponame = unpack(matches)
  return { host = host, user_or_org = user_or_org, reponame = string.gsub(reponame, ".git", "") }
end
