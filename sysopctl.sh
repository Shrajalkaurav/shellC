#!/bin/bash

# sysopctl - v0.1.0

VERSION="v0.1.0"

# Function to display help message
function show_help {
    echo "Usage: sysopctl [command] [options]"
    echo ""
    echo "Commands:"
    echo "  service list           List all active services"
    echo "  service start <name>   Start a specific service"
    echo "  service stop <name>    Stop a specific service"
    echo "  system load            Show system load averages"
    echo "  disk usage             Show disk usage statistics"
    echo "  process monitor        Monitor real-time system processes"
    echo "  logs analyze           Analyze system logs"
    echo "  backup <path>          Backup system files to the specified path"
    echo ""
    echo "Options:"
    echo "  --help                 Show this help message"
    echo "  --version              Show command version"
}

# Function to show version information
function show_version {
    echo "sysopctl version $VERSION"
}

# Function to list running services
function list_services {
    systemctl list-units --type=service
}

# Function to start a service
function start_service {
    service_name="$1"
    if [ -z "$service_name" ]; then
        echo "Error: Service name is required."
        exit 1
    fi
    systemctl start "$service_name" && echo "Service '$service_name' started."
}

# Function to stop a service
function stop_service {
    service_name="$1"
    if [ -z "$service_name" ]; then
        echo "Error: Service name is required."
        exit 1
    fi
    systemctl stop "$service_name" && echo "Service '$service_name' stopped."
}

# Function to show system load
function system_load {
    uptime
}

# Function to show disk usage
function disk_usage {
    df -h
}

# Function to monitor processes
function process_monitor {
    top
}

# Function to analyze system logs
function analyze_logs {
    journalctl -p 3 -xb
}

# Function to backup system files
function backup_files {
    backup_path="$1"
    if [ -z "$backup_path" ]; then
        echo "Error: Backup path is required."
        exit 1
    fi
    rsync -av --progress / "$backup_path" && echo "Backup to '$backup_path' completed."
}

# Main script logic
case "$1" in
    --help)
        show_help
        ;;
    --version)
        show_version
        ;;
    service)
        case "$2" in
            list)
                list_services
                ;;
            start)
                start_service "$3"
                ;;
            stop)
                stop_service "$3"
                ;;
            *)
                echo "Unknown service option. Use 'sysopctl --help' for usage."
                ;;
        esac
        ;;
    system)
        if [ "$2" == "load" ]; then
            system_load
        else
            echo "Unknown system option. Use 'sysopctl --help' for usage."
        fi
        ;;
    disk)
        if [ "$2" == "usage" ]; then
            disk_usage
        else
            echo "Unknown disk option. Use 'sysopctl --help' for usage."
        fi
        ;;
    process)
        if [ "$2" == "monitor" ]; then
            process_monitor
        else
            echo "Unknown process option. Use 'sysopctl --help' for usage."
        fi
        ;;
    logs)
        if [ "$2" == "analyze" ]; then
            analyze_logs
        else
            echo "Unknown logs option. Use 'sysopctl --help' for usage."
        fi
        ;;
    backup)
        backup_files "$2"
        ;;
    *)
        echo "Unknown command. Use 'sysopctl --help' for usage."
        ;;
esac
