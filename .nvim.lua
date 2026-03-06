-- NOTE: このプロジェクトでは Copilot を無効化（学習目的のため自力で解く）
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local ok, copilot = pcall(require, "copilot.command")
    if ok then
      copilot.disable()
    end
  end,
})
