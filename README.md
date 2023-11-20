**scripts OMEGALUL**

- Assign permissions to user in folder: setfacl -m u:username:rwx location
- Disable "Deamons using outdated libraries" on Ubuntu: /etc/needrestart/needrestart.conf | ($nrconf{restart} = 'i'; -> $nrconf{restart} = 'a';)
