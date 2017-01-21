declare -ir STEP_VALUE=25
declare -r BRIGHTNESS_FILE="/sys/class/backlight/intel_backlight/brightness"

inc_backlight(){
  local -r current_backlight="$(cat "${BRIGHTNESS_FILE}")"
  echo "$((${current_backlight} + ${STEP_VALUE}))" | sudo /usr/bin/tee "${BRIGHTNESS_FILE}"
}

dec_backlight(){
  local -r current_backlight="$(cat "${BRIGHTNESS_FILE}")"
  echo "$((${current_backlight} - ${STEP_VALUE}))" | sudo /usr/bin/tee "${BRIGHTNESS_FILE}"
}

current_backlight(){
  cat "${BRIGHTNESS_FILE}"
}
