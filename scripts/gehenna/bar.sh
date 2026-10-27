# Connection Status
CON=$(nmcli -g NAME,TYPE connection show --active | grep ethernet)
if [[ -z $CON ]]; then
  CONSTATUS="DOWN"
else
  CONSTATUS="UP"
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

echo [CON: $CONSTATUS] [VOL: $VOLPERCENT] [$DATETIME]
