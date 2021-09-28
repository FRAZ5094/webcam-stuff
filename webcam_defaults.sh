IFS='
'
for x in `v4l2-ctl -d /dev/video0 --list-ctrls`
do
  default_value=$(echo $x | grep -o 'default=[0-9]*' | cut -d"=" -f 2)
  #echo $default_value

  setting_name=$(echo $x | awk '{print$1}')
  #echo $setting_name

  v4l2-ctl -d /dev/video0 --set-ctrl=$setting_name=$default_value



done

echo "Settings for webcam set to default"
