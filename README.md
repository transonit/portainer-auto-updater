# Auto-Update Portainer Script

This script automates the process of stopping, removing, and restarting Portainer every Sunday at 4:20 AM using a cron job.

## 📌 Features

- Automatically creates the script `autoupdate_portainer.sh`
- Grants execution permission to the script
- Adds a cron job to run the script every Sunday at 4:20 AM
- Ensures the cron job is only added once

## 📂 Installation & Usage

1. **Download the script**

   ```bash
   wget https://raw.githubusercontent.com/transonit/portainer-auto-updater/main/setup_autoupdate.sh
   ```

2. **Give execution permission**

   ```bash
   chmod +x setup_autoupdate.sh
   ```

3. **Run the script with sudo**

   ```bash
   sudo ./setup_autoupdate.sh
   ```

4. **Verify the cron job**

   ```bash
   sudo crontab -l
   ```

   You should see this entry:

   ```
   20 4 * * 0 /bin/bash /root/autoupdate_portainer.sh
   ```

## 🔄 How It Works

- The script creates `/root/autoupdate_portainer.sh` with commands to restart Portainer.
- It makes the script executable.
- It adds a cron job for root to run the script every Sunday at 4:20 AM.
- If the cron job already exists, it won’t be added again.

## 🛠️ Uninstall

To remove the cron job and script:

```bash
sudo crontab -e
```

Delete the line containing `/root/autoupdate_portainer.sh`, then save and exit.

To delete the script:

```bash
sudo rm /root/autoupdate_portainer.sh
```

## 📜 License

This script is open-source. Feel free to modify and use it as needed!

---

**Author:** YOUR\_NAME

