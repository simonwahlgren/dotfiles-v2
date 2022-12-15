rule = {
  matches = {
    {
      { "node.name", "equals", "alsa_output.usb-Audioengine_Ltd._Audioengine_2__ABCDEFB1180003-00.analog-stereo" },
    },
  },
  apply_properties = {
    ["node.description"] = "Audioengine 2+",
    ["node.nick"] = "Audioengine 2+",
    ["priority.driver"] = 1001,
    ["priority.session"] = 1001,
  },
}

table.insert(alsa_monitor.rules,rule)
