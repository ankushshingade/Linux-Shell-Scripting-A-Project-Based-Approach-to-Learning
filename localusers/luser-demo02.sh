#!/bin/bash

# Display the UID and username of the user executing this script.
# Display if the user is the root user or not.


# Display the UID
echo "Your UID is ${UID}"
echo "Your EUID is ${EUID}"

# Display the username
USER_NAME=$(id -un)
# USER_NAME=`id -un` # This is an older syntax doing same thing as $()
echo "Your username is ${USER_NAME}"


# Display if the user is the root user or not.
if [[ "${UID}" -eq 0 ]]
then
	echo 'You are root'
else
	echo 'You are not root'
fi








