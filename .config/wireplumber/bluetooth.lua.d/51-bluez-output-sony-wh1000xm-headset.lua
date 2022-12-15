rule = {
  matches = {
    {
      { "node.name", "equals", "bluez_output.88_C9_E8_41_42_42.1" },
    },
  },
  apply_properties = {
    ["node.description"] = "Sony WH-1000XM5 Headset",
    ["node.nick"] = "Sony WH-1000XM5 Headset",
    ["priority.driver"] = 1003,
    ["priority.session"] = 1003,
  },
}

table.insert(bluez_monitor.rules, rule)
