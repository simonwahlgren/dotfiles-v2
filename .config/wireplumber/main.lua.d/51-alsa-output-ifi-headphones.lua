rule = {
  matches = {
    {
      { "node.name", "equals", "alsa_output.usb-iFi__by_AMR__iFi__by_AMR__HD_USB_Audio_0003-00.analog-stereo" },
    },
  },
  apply_properties = {
    ["node.description"] = "iFi DAC Headphones",
    ["node.nick"] = "iFi DAC Headphones",
    ["priority.driver"] = 1001,
    ["priority.session"] = 1001,
  },
}

table.insert(alsa_monitor.rules,rule)
