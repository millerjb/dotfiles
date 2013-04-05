LOCATION="$1"
touch ~/.location/.current
echo "export LOCATION=$LOCATION" > ~/.location/.current
