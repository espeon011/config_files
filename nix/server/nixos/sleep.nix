# Disable the GNOME3/GDM auto-suspend feature that cannot be disabled in GUI!
# If no user is logged in, the machine will power down after 20 minutes.
# Remark: This setting is not enough. See https://www.tecmint.com/disable-suspend-and-hibernation-in-linux/
{...}: {
  systemd.targets.sleep.enable = false;
  systemd.targets.suspend.enable = false;
  systemd.targets.hibernate.enable = false;
  systemd.targets.hybrid-sleep.enable = false;
}
