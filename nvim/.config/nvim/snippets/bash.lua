local ls = require 'luasnip'
local fmt = require("luasnip.extras.fmt").fmt
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

ls.add_snippets("sh", {
  -- -- Shebang snippet
  -- s("shebang", {
  --   t("#!/bin/bash\n\n"),
  --   t("echo \"Script started\"\n\n"),
  --   i(0)
  -- }),

  -- -- Function definition snippet
  -- s("function", {
  --   t("function "), i(1, "name"), t("() {\n"),
  --   t("  "), i(2, "# TODO: Add function body"), t("\n"),
  --   t("}\n\n"),
  --   i(0)
  -- }),

  -- -- For loop snippet
  -- s("for", {
  --   t("for "), i(1, "var"), t(" in "), i(2, "list"), t(";\n"),
  --   t("do\n  "), i(3, "# TODO: Add loop body"), t("\n"),
  --   t("done\n\n"),
  --   i(0)
  -- }),

  -- -- If statement snippet
  -- s("if", {
  --   t("if [ "), i(1, "condition"), t(" ]; then\n"),
  --   t("  "), i(2, "# TODO: Add if body"), t("\n"),
  --   t("fi\n\n"),
  --   i(0)
  -- }),

  -- curl request
  s("get", fmt([[
    curl -s -i -X GET "{}" \
    #-u name:password 
  ]], {
    i(1, "url")
  })),

  s("post", fmt([[
    curl -s -i -X POST "{}" \
      -H "Content-Type: application/json" \
      #-H "Content-Type: multipart/form-data" \
      -d '{}' \
      #-u name:password 
      #-F field:value
  ]], {
    i(1, "url"),
    i(2, "data")
  }))
})

