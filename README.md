# sysopctl - v0.1.0

`sysopctl` is a lightweight Bash script for system administration tasks, offering functionalities such as service management, system monitoring, log analysis, and backups.

## How It Works

This script is a command-line tool designed to simplify common system operations. It interacts with system services using `systemctl`, displays system load with `uptime`, checks disk usage via `df`, monitors processes with `top`, and handles system backups using `rsync`. Each command provides a specific utility that can be run directly from the terminal.

### Key Components:

- **Service Management**: Manage system services (start, stop, list active services).
- **System Monitoring**: View system load averages, disk usage statistics, and monitor active processes.
- **Log Analysis**: Analyze critical system logs.
- **Backup Utility**: Backup system files to a specified directory.

## How to Run

1. **Clone or Download the Script**  
   Download the `sysopctl` Bash script to your local machine.

2. **Make the Script Executable**  
   Before running the script, ensure it has executable permissions:
   ```bash
   chmod +x sysopctl.sh

 
