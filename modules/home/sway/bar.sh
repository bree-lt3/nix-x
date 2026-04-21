# TODO: show WIFI connection if connected, show disconnected if no connection

# Volume
VOLUME=$(wpctl get-volume @DEFAULT_SINK@)
VOLTRIM=${VOLUME#V*[[:space:]]}
VOLPERCENT=""

if [[ $VOLTRIM == "0"* ]]; then
  VOLPERCENT="${VOLTRIM#0.}%"
elif [[ $VOLTRIM == "1"* ]]; then
  VOLPERCENT="${VOLTRIM//.}%"
fi

# Battery
BATPERCENT="$(cat /sys/class/power_supply/BAT0/capacity)%"
BATSTATUS=$(cat /sys/class/power_supply/BAT0/status)
BATFORMAT=""

if [[ $BATSTATUS == "Charging" || $BATSTATUS == "Full" ]]; then 
  BATFORMAT="+"
fi

# Date
DATETIME=$(date +"%D %T")

echo [VOL: $VOLPERCENT] [BAT: $BATFORMAT$BATPERCENT] $DATETIME
