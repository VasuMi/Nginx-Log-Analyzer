#!/bin/bash

# Nginx Log Analyzer
# Usage: ./nginx_analyzer.sh <log_file>

LOG_FILE="$1"

if [ -z "$LOG_FILE" ]; then
    echo "Usage: $0 <log_file>"
    exit 1
fi

if [ ! -f "$LOG_FILE" ]; then
    echo "Error: Log file '$LOG_FILE' not found."
    exit 1
fi

echo "======================================"
echo "        NGINX LOG ANALYZER"
echo "======================================"

echo ""
echo "Log file: $LOG_FILE"

echo ""
echo "Total Requests:"
awk 'END {print NR}' "$LOG_FILE"

echo ""
echo "Top 5 IP Addresses:"
awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5

echo ""
echo "Top 5 Requested URLs:"
awk '{print $7}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5

echo ""
echo "HTTP Status Codes:"
awk '{print $9}' "$LOG_FILE" | sort | uniq -c | sort -nr

echo ""
echo "404 Errors:"
awk '$9 == 404 {count++} END {print count+0}' "$LOG_FILE"

echo ""
echo "500 Errors:"
awk '$9 == 500 {count++} END {print count+0}' "$LOG_FILE"

echo ""
echo "HTTP Methods:"
awk '{print $6}' "$LOG_FILE" | tr -d '"' | sort | uniq -c | sort -nr

echo ""
echo "======================================"
echo "         ANALYSIS COMPLETE"
echo "======================================"