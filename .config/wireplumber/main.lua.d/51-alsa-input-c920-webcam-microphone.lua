rule = {
  matches = {
    {
      { "node.name", "equals", "alsa_input.usb-046d_HD_Pro_Webcam_C920_B4C0942F-02.analog-stereo" },
    },
  },
  apply_properties = {
    ["node.description"] = "C920 Webcam Microphone",
    ["node.nick"] = "C920 Webcam Microphone",
    ["priority.driver"] = 1601,
    ["priority.session"] = 1601,
  },
}

table.insert(alsa_monitor.rules,rule)
