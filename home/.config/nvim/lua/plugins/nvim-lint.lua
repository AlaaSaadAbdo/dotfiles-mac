require("lint").linters_by_ft = {
  sh = { "shellcheck" },
  markdown = { "vale" },
  -- typescriptreact = { "eslint" },
}

-- require("lint").linters.eslint = {
--   cmd = "eslint_d",
--   stdin = false, -- or false if it doesn't support content input via stdin. In that case the filename is automatically added to the arguments.
--   args = { "-f", "unix" }, -- list of arguments. Can contain functions with zero arguments that will be evaluated once the linter is used.
--   stream = "stdout", -- ('stdout' | 'stderr') configure the stream to which the linter outputs the linting result.
--   ignore_exitcode = true, -- set this to true if the linter exits with a code != 0 and that's considered normal.
--   -- parser = your_parse_function
-- }
