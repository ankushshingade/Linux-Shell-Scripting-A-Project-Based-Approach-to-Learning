#!/bin/bash

# Check script execution is done by root/superuser.
if [[ $(id -u) -ne 0 ]] ; then
	echo "Script is not executed by Root."
	exit 1
fi

# Get new user details (Username, real name, initial password).
read -p 'Enter username: ' USER_NAME
read -p 'Enter real name: ' COMMENT
read -p 'Enter password: ' PASSWORD

# Create new user on system using above details.

useradd -c "${COMMENT}" -m ${USER_NAME} # -c ${COMMENT}  # Add user; with username and comment.

# Check if account is created or not.
# We should not proceed if account creation is not done.
if [[ "${?}" -ne 0 ]]
then
	echo "The account could not be created."
	exit 1
fi

# Set password for new account
echo "${PASSWORD}" | passwd --stdin ${USER_NAME}  # Assign password to USER_NAME.

# Check if password assignment successful or not.
if [[ "${?}" -ne 0 ]]
then 
	echo "Password not assigned."
	exit 1
fi
 
passwd -e ${USER_NAME} # Force password change on first login.

# Display username, password and host where account is created.

echo
echo "username:"
echo "${USER_NAME}"
echo
echo "password:"
echo "${PASSWORD}"
echo
echo "Host:"
echo "${HOSTNAME}"

exit 0
