# Nginx Log Analyzer

A simple Bash tool that analyzes Nginx access logs from the command line.

## Why we need this actually?

Simply the question can also be like: Why we need to analyze nginx logs by explicit tools?
So, the answer is: 
-Because Nginx itself generates logs, but it doesn't automatically give you useful analysis.
-Nginx records raw events, That's useful, but if you have 100,000 lines, manually reading them is impractical.
-What our tool does-> Our Bash script converts that raw data into information.

## Features

- Counts total requests
- Finds top 5 IP addresses
- Finds top 5 requested URLs
- Displays HTTP status code counts
- Counts 404 errors
- Counts 500 errors
- Displays HTTP methods used

## Usage

Make the script executable:

```bash
chmod +x nginx_analyzer.sh


Project link: https://roadmap.sh/projects/nginx-log-analyser