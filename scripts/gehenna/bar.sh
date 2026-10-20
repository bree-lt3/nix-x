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
  else
    VOLPERCENT="${VOLTRIM//.}%"
  fi
fi

# Date
DATETIME=$(date +"%D %T")

echo [CON: $WIFINAME] [VOL: $VOLPERCENT] [$DATETIME]
