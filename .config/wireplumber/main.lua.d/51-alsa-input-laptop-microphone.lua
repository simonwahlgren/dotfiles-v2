rule = {
  matches = {
    {
      { "node.name", "equals", "alsa_input.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__hw_sofhdadsp__source" },
    },
  },
  apply_properties = {
    ["node.description"] = "Laptop Microphone",
    ["node.nick"] = "Laptop Microphone",
    ["priority.driver"] = 1600,
    ["priority.session"] = 1600,
  },
}

table.insert(alsa_monitor.rules,rule)
