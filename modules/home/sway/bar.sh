# TODO: show WIFI connection if connected, show disconnected if no connection

# TODO: format volume to show percentage
VOLUME=$(wpctl get-volume @DEFAULT_SINK@)

# TODO: format battery show +/- for charging/dihcharging
BATPERCENT=$(cat /sys/class/power_supply/BAT0/capacity)
BATSTATUS=$(cat /sys/class/power_supply/BAT0/status)

DATETIME=$(date +"%D %T")

echo [$VOLUME] [$BATPERCENT% $BATSTATUS] $DATETIME
