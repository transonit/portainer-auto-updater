#!/bin/bash

# Define script path
SCRIPT_PATH="/root/autoupdate_portainer.sh"

# Create the script
cat <<EOF > $SCRIPT_PATH
#!/bin/bash
/usr/bin/docker stop portainer
/usr/bin/docker rm portainer
/usr/bin/docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:lts
EOF

# Grant execute permission
chmod +x $SCRIPT_PATH

# Check if cronjob already exists
CRON_JOB="20 4 * * 0 /bin/bash $SCRIPT_PATH"

# Add cronjob if it doesn't exist
(crontab -l 2>/dev/null | grep -Fq "$CRON_JOB") || (crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab -

echo "✅ Script and cronjob have been successfully set up!"
