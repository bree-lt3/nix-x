# TODO: show WIFI connection if connected, show disconnected if no connection

# TODO: format volume to show percentage
VOLUME=$(wpctl get-volume @DEFAULT_SINK@)

# Battery
BATPERCENT=$(cat /sys/class/power_supply/BAT0/capacity)
BATSTATUS=$(cat /sys/class/power_supply/BAT0/status)
BATFORMAT=""

if [ $BATSTATUS == "Charging" ]; then 
  BATFORMAT="+"
elif [ $BATSTATUS == "Discharging" ]; then
  BATFORMAT="-"
fi

# Date
DATETIME=$(date +"%D %T")

echo [$VOLUME] [BAT: $BATFORMAT$BATPERCENT%] $DATETIME
