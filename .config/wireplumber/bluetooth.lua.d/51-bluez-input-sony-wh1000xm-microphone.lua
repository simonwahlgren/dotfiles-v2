rule = {
  matches = {
    {
      { "node.name", "equals", "bluez_input.88_C9_E8_41_42_42.0" },
    },
  },
  apply_properties = {
    ["node.description"] = "Sony WH-1000XM5 Microphone",
    ["node.nick"] = "Sony WH-1000XM5 Microphone",
    ["priority.driver"] = 1602,
    ["priority.session"] = 1602,
  },
}

table.insert(bluez_monitor.rules, rule)
