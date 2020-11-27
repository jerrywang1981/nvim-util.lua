local vim = vim

local organize_imports = function(timeout_ms)
  timeout_ms = timeout_ms or 1000
  local context = { source = { organizeImports = true } }
  vim.validate { context = { context, 't', true } }
  local params = vim.lsp.util.make_range_params()
  params.context = context
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
  if not result or vim.tbl_isempty(result) then return end
  _, result = next(result)
  result = result.result
  _, result = next(result)
  result = result.edit
  vim.lsp.util.apply_workspace_edit(result)
end

local organize_imports_format = function(timeout_ms)
  organize_imports(timeout_ms)
  vim.lsp.buf.formatting_sync(nil, timeout_ms or 1000)
end

return {
  organize_imports = organize_imports,
  organize_imports_format = organize_imports_format,
}
