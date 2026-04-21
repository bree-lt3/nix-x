# WIFI
WIFI=$(nmcli -g NAME,TYPE connection show --active | grep 802-11-wireless)
if [[ -z $WIFI ]]; then
  WIFINAME="none"
else
  WIFINAME="${WIFI%%:*}"
fi

# Volume
VOLUME=$(wpctl get-volume @DEFAULT_SINK@)
VOLTRIM=${VOLUME#V*[[:space:]]}
VOLPERCENT=""

if [[ $VOLTRIM == *"MUTED"* ]]; then
  VOLPERCENT="muted"
else
  if [[ $VOLTRIM == "0"* ]]; then
    VOLPERCENT="${VOLTRIM#0.}%"
  elif [[ $VOLTRIM == "1"* ]]; then
    VOLPERCENT="${VOLTRIM//.}%"
  fi
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

echo [CON: $WIFINAME] [VOL: $VOLPERCENT] [BAT: $BATFORMAT$BATPERCENT] $DATETIME
