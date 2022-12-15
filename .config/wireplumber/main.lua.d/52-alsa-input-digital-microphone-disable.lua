rule = {
  matches = {
    {
      { "node.name", "matches", "alsa_input.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__hw_sofhdadsp_6__source" },
    },
  },
  apply_properties = {
    ["node.disabled"] = true
  },
}

table.insert(alsa_monitor.rules,rule)
