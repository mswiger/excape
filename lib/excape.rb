class Excape
  COMMANDS = {
    "Logout": "swaymsg exit",
    "Reboot": "systemctl restart",
    "Reboot Into Windows": "systemctl reboot --boot-loader-entry=auto-windows",
    "Shutdown": "systemctl poweroff",
  }.freeze

  def initialize
    command_list = COMMANDS.keys.join("\n")
    selected = `echo "#{command_list}" | wofi --dmenu --prompt "Select Action"`.strip!
    return unless selected

    selected_command = COMMANDS[selected.to_sym]
    msg = "You selected \"#{selected}.\" Are you sure?"
    button = "Yes, I am sure"
    `swaynag -t warning -m '#{msg}' -b '#{button}' '#{selected_command}'`
  end
end
