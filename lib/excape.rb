require "English"

class Excape
  COMMANDS = {
    "Logout": "swaymsg exit",
    "Reboot": "systemctl reboot",
    "Reboot Into Windows": "systemctl reboot --boot-loader-entry=auto-windows",
    "Shutdown": "systemctl poweroff",
  }.freeze

  def initialize
    command_list = COMMANDS.keys.join("\n")
    selected = `echo "#{command_list}" | wofi --dmenu --prompt "Select Action"`.strip!
    return unless selected

    selected_command = COMMANDS[selected.to_sym]
    msg = %(You selected "#{selected}." Are you sure?)
    `zenity --question --text '#{msg}'`
    `#{selected_command}` if $CHILD_STATUS.exitstatus.zero?
  end
end
