local neorg = require("neorg")

neorg.setup({
  load = {
    ["core.defaults"] = {},
    ["core.export"] = {},
    ["core.norg.dirman"] = {
      config = {
        workspaces = {
          notes = "~/notes",
        },
      }
    },
    ["core.gtd.base"] = {
      config = {
        workspace = "notes",
      },
    },
    ["core.norg.concealer"] = {},
    ["core.norg.manoeuvre"] = {},
  }
})
