return {
  "terje/simctl.nvim",
  version = "*", -- Use latest release
  ft = { "apns", "json" }, -- Lazy load on these filetypes
  cmd = { "SimctlNotify" }, -- Also lazy load on command
  config = function()
    require("simctl").setup({
      notify = true, -- enable error notifications
      devicePicker = true, -- show the device picker if no deviceId is supplied
      appPicker = true, -- show the app picker if no appId is supplied
      privacyServicePicker = true, -- show the privacy service picker if no service is supplied
      defaultToBootedDevice = true, -- default to booted device if no deviceId is supplied
      openSimulatorApp = true, -- open Simulator.app when booting a device
    })
  end,
  keys = {
    -- Device management
    { "<leader>ib", function() require("simctl.api").boot() end, desc = "iOS: Boot simulator" },
    { "<leader>is", function() require("simctl.api").shutdown() end, desc = "iOS: Shutdown simulator" },
    { "<leader>ie", function() require("simctl.api").erase() end, desc = "iOS: Erase simulator" },
    { "<leader>il", function() require("simctl.api").list() end, desc = "iOS: List simulators" },

    -- App management
    { "<leader>ia", function() require("simctl.api").launch() end, desc = "iOS: Launch app" },
    { "<leader>it", function() require("simctl.api").terminate() end, desc = "iOS: Terminate app" },
    { "<leader>iA", function() require("simctl.api").listapps() end, desc = "iOS: List apps" },
    { "<leader>iu", function() require("simctl.api").uninstall() end, desc = "iOS: Uninstall app" },

    -- UI controls
    { "<leader>id", function() require("simctl.ui").toggleAppearance() end, desc = "iOS: Toggle dark mode" },
    { "<leader>i+", function() require("simctl.ui").increaseContentSize() end, desc = "iOS: Increase text size" },
    { "<leader>i-", function() require("simctl.ui").decreaseContentSize() end, desc = "iOS: Decrease text size" },

    -- Push notifications (for .apns and .json files)
    { "<leader>ip", "<cmd>SimctlNotify<cr>", desc = "iOS: Send push notification", ft = { "json", "apns" } },
  },
}
