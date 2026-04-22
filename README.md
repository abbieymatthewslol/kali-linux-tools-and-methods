# kali-linux-tools-and-methods

Technical and quick list of Kali Linux tutorials, tools, scripts, and commands.

## Cursor Agent Workflows for Kali Linux (Home Lab)

Use these in **authorized environments only** (your own lab, CTF, or systems you have explicit permission to test). Each workflow includes a ready-to-use prompt for Cursor agents running in Kali Linux home environments. Prompts are formatted in code blocks for quick scanning and one-click copy/paste.

1. **Workflow: Nmap Baseline Discovery**  
   **Copy/Paste Prompt:**
   ```
Create a bash workflow that runs nmap -sV -O against my target list in ~/targets.txt, saves XML and grepable output in ~/engagements/recon, and summarizes top open ports per host.
   ```
2. **Workflow: Fast Host Sweep**  
   **Copy/Paste Prompt:**
   ```
Generate an automated ping sweep using fping for 192.168.1.0/24 from Kali, write live hosts to ~/engagements/recon/live-hosts.txt, and retry failed hosts once.
   ```
3. **Workflow: Service Banner Collection**  
   **Copy/Paste Prompt:**
   ```
Build a script to collect service banners with nmap --script=banner for all hosts in ~/engagements/recon/live-hosts.txt and save a markdown summary by host.
   ```
4. **Workflow: HTTP Tech Fingerprinting**  
   **Copy/Paste Prompt:**
   ```
Automate whatweb and nikto scans for each web service found by nmap, store results in ~/engagements/web/<host>, and flag outdated server versions.
   ```
5. **Workflow: Subdomain Enumeration**  
   **Copy/Paste Prompt:**
   ```
Create a Kali workflow using subfinder and assetfinder for my domain, merge and deduplicate results, then verify alive subdomains with httpx.
   ```
6. **Workflow: DNS Record Audit**  
   **Copy/Paste Prompt:**
   ```
Write a script that queries A, AAAA, MX, TXT, and NS records with dig for each domain in ~/domains.txt and exports a CSV report.
   ```
7. **Workflow: Directory Bruteforce Pipeline**  
   **Copy/Paste Prompt:**
   ```
Automate gobuster dir scans for each discovered web host with a medium wordlist, then parse and rank interesting status codes.
   ```
8. **Workflow: Parameter Discovery**  
   **Copy/Paste Prompt:**
   ```
Generate a workflow using waybackurls and gau to enumerate URL parameters for a target domain and output possible injection points.
   ```
9. **Workflow: SQLi Quick Triage**  
   **Copy/Paste Prompt:**
   ```
Create a safe sqlmap triage script that tests only discovered GET parameters from ~/params.txt with low risk/level and logs potential SQLi indicators.
   ```
10. **Workflow: XSS Reflection Checks**  
    **Copy/Paste Prompt:**
    ```
Build an automated reflected-XSS check workflow with dalfox on URLs in ~/xss-targets.txt and produce a concise finding summary.
    ```
11. **Workflow: TLS Configuration Review**  
    **Copy/Paste Prompt:**
    ```
Run testssl.sh against all HTTPS endpoints from ~/https-hosts.txt and generate a report highlighting weak ciphers and cert issues.
    ```
12. **Workflow: SMB Enumeration**  
    **Copy/Paste Prompt:**
    ```
Generate a Kali workflow that runs smbclient, enum4linux-ng, and nmap smb scripts against SMB hosts and organizes outputs by host.
    ```
13. **Workflow: SSH Hardening Audit**  
    **Copy/Paste Prompt:**
    ```
Create an SSH audit routine that checks ciphers, KEX, and auth methods on hosts in ~/ssh-hosts.txt and flags weak configurations.
    ```
14. **Workflow: FTP Anonymous Access Check**  
    **Copy/Paste Prompt:**
    ```
Automate FTP anonymous login checks and basic directory listing capture for all FTP services discovered in prior scans.
    ```
15. **Workflow: SNMP Enumeration**  
    **Copy/Paste Prompt:**
    ```
Write a script to test common SNMP community strings, run snmpwalk where valid, and sanitize outputs into host-specific files.
    ```
16. **Workflow: RDP Exposure Mapping**  
    **Copy/Paste Prompt:**
    ```
Build a workflow that identifies exposed RDP endpoints with nmap and gathers protocol/security details for each host.
    ```
17. **Workflow: Vulnerability Scan Orchestration**  
    **Copy/Paste Prompt:**
    ```
Create an automated OpenVAS/Nessus launcher script for a home lab target list and track scan status with timestamped logs.
    ```
18. **Workflow: CVE Mapping from Service Versions**  
    **Copy/Paste Prompt:**
    ```
Parse nmap service/version output and map likely CVEs using searchsploit, producing a prioritized remediation list.
    ```
19. **Workflow: Metasploit Workspace Setup**  
    **Copy/Paste Prompt:**
    ```
Generate a script that creates a Metasploit workspace, imports nmap XML results, tags hosts by service type, and exports notes.
    ```
20. **Workflow: Brute-force Safety Guardrails**  
    **Copy/Paste Prompt:**
    ```
Create a controlled hydra workflow with rate limits, lockout safeguards, and explicit authorization checks before execution.
    ```
21. **Workflow: Wordlist Mutation Automation**  
    **Copy/Paste Prompt:**
    ```
Build a custom wordlist generator from project keywords and leaked patterns, then append rule-based mutations for login testing.
    ```
22. **Workflow: Hash Identification and Routing**  
    **Copy/Paste Prompt:**
    ```
Generate a pipeline that identifies hash types with hashid and routes each hash set to appropriate hashcat modes automatically.
    ```
23. **Workflow: GPU Crack Session Manager**  
    **Copy/Paste Prompt:**
    ```
Create a hashcat session manager script that resumes interrupted jobs, tracks progress, and writes cracked outputs to structured folders.
    ```
24. **Workflow: John the Ripper Batch Mode**  
    **Copy/Paste Prompt:**
    ```
Automate john for multiple hash files in ~/hashes, detect format per file, and produce a consolidated cracked credential report.
    ```
25. **Workflow: Wireless Adapter Readiness Check**  
    **Copy/Paste Prompt:**
    ```
Build a pre-flight script for wireless assessments that validates monitor mode capability, driver support, and required Kali packages.
    ```
26. **Workflow: WPA Handshake Capture Process**  
    **Copy/Paste Prompt:**
    ```
Create airodump-ng workflow steps for capturing WPA/WPA2 handshakes in a home lab, including channel lock and capture validation.
    ```
27. **Workflow: PMKID Collection Routine**  
    **Copy/Paste Prompt:**
    ```
Generate a scripted process for hcxdumptool PMKID capture in a legal home setup and convert output to hashcat format automatically.
    ```
28. **Workflow: Bluetooth Surface Discovery**  
    **Copy/Paste Prompt:**
    ```
Automate bluetoothctl and related reconnaissance commands to discover nearby devices and store metadata with timestamps.
    ```
29. **Workflow: Packet Capture Rotation**  
    **Copy/Paste Prompt:**
    ```
Write a tcpdump automation script that rotates pcap files every 5 minutes, compresses old captures, and labels by interface/date.
    ```
30. **Workflow: Wireshark CLI Triage**  
    **Copy/Paste Prompt:**
    ```
Create a tshark-based triage workflow that extracts top talkers, DNS queries, and suspicious HTTP requests from a pcap file.
    ```
31. **Workflow: ARP Spoof Detection Script**  
    **Copy/Paste Prompt:**
    ```
Build a local network monitor that detects ARP table anomalies and alerts when MAC/IP mappings change unexpectedly.
    ```
32. **Workflow: IDS Rule Test Harness**  
    **Copy/Paste Prompt:**
    ```
Generate a Suricata test harness in Kali that replays sample pcaps and reports which IDS rules triggered.
    ```
33. **Workflow: Log Aggregation for Assessments**  
    **Copy/Paste Prompt:**
    ```
Create a script that collects scan logs from ~/engagements/*, normalizes timestamps, and aggregates into one searchable file.
    ```
34. **Workflow: IOC Extraction from Logs**  
    **Copy/Paste Prompt:**
    ```
Build an automated parser that extracts domains, IPs, hashes, and URLs from assessment logs and writes deduplicated IOCs.
    ```
35. **Workflow: Malware Sample Static Triage**  
    **Copy/Paste Prompt:**
    ```
Create a static-analysis workflow using file, strings, exiftool, and sha256sum on samples in ~/malware-samples (no execution).
    ```
36. **Workflow: YARA Scan Pipeline**  
    **Copy/Paste Prompt:**
    ```
Automate recursive YARA scans over ~/malware-samples with custom rules and generate a hit report sorted by rule severity.
    ```
37. **Workflow: PE Metadata Inspection**  
    **Copy/Paste Prompt:**
    ```
Generate a workflow using peframe/rabin2 to extract PE metadata and suspicious imports from Windows binaries.
    ```
38. **Workflow: ELF Binary Quick Review**  
    **Copy/Paste Prompt:**
    ```
Create an ELF triage script using readelf, strings, and objdump to identify risky capabilities and embedded indicators.
    ```
39. **Workflow: Ghidra Project Bootstrap**  
    **Copy/Paste Prompt:**
    ```
Automate creation of a Ghidra project directory structure and import queue for binaries awaiting reverse engineering.
    ```
40. **Workflow: Sandbox VM Snapshot Control**  
    **Copy/Paste Prompt:**
    ```
Write a workflow that snapshots a local VirtualBox test VM before analysis, runs a task list, and reverts after completion.
    ```
41. **Workflow: Container Security Scan**  
    **Copy/Paste Prompt:**
    ```
Create a Kali script to inspect local Docker images with trivy and export findings by image tag.
    ```
42. **Workflow: Web Screenshot Evidence Capture**  
    **Copy/Paste Prompt:**
    ```
Automate aquatone or gowitness screenshots for alive web targets and generate an index HTML for quick review.
    ```
43. **Workflow: API Endpoint Discovery**  
    **Copy/Paste Prompt:**
    ```
Generate an API recon workflow that probes common OpenAPI/Swagger paths and catalogs exposed endpoints and methods.
    ```
44. **Workflow: JWT Security Checks**  
    **Copy/Paste Prompt:**
    ```
Build a script to decode JWTs from test traffic, inspect algorithm usage, and flag weak/unsafe token configurations.
    ```
45. **Workflow: S3 Bucket Exposure Audit**  
    **Copy/Paste Prompt:**
    ```
Create an automated check for publicly accessible S3 buckets related to my domain list and log risky permissions.
    ```
46. **Workflow: Git Leak Detection**  
    **Copy/Paste Prompt:**
    ```
Generate a workflow using trufflehog and gitleaks against local repos to find accidentally committed secrets.
    ```
47. **Workflow: Password Policy Assessment**  
    **Copy/Paste Prompt:**
    ```
Create a script that evaluates observed credential patterns against expected policy rules and reports weak password trends.
    ```
48. **Workflow: Phishing Domain Monitoring**  
    **Copy/Paste Prompt:**
    ```
Build a daily job that searches for typosquatted domains similar to my brand and logs newly seen candidates.
    ```
49. **Workflow: Scheduled Recon with Cron**  
    **Copy/Paste Prompt:**
    ```
Create a cron-managed recon pipeline that runs host discovery nightly and archives differences from previous runs.
    ```
50. **Workflow: Differential Scan Comparison**  
    **Copy/Paste Prompt:**
    ```
Generate a tool that compares new nmap XML results with prior baselines and highlights newly opened/closed ports.
    ```
51. **Workflow: Automated Report Drafting**  
    **Copy/Paste Prompt:**
    ```
Build a markdown report generator that ingests scan outputs and produces sections for scope, findings, risk, and remediation.
    ```
52. **Workflow: Evidence File Integrity**  
    **Copy/Paste Prompt:**
    ```
Create a workflow that calculates and verifies SHA256 checksums for all evidence files in ~/engagements/evidence.
    ```
53. **Workflow: Engagement Folder Bootstrap**  
    **Copy/Paste Prompt:**
    ```
Generate a script to create standardized engagement folders (recon, exploits, loot, notes, report) under ~/engagements/<client>.
    ```
54. **Workflow: tmux Operator Workspace**  
    **Copy/Paste Prompt:**
    ```
Create a tmux bootstrap script for Kali that opens panes for recon, scanning, notes, and logs with useful aliases preloaded.
    ```
55. **Workflow: Proxychains Routing Validation**  
    **Copy/Paste Prompt:**
    ```
Build a test routine that verifies proxychains traffic routing with curl and nmap before launching any scans.
    ```
56. **Workflow: Tor Circuit Health Check**  
    **Copy/Paste Prompt:**
    ```
Generate a script that checks Tor service status, confirms external IP change, and logs circuit test outcomes.
    ```
57. **Workflow: Local Privilege Escalation Enumeration**  
    **Copy/Paste Prompt:**
    ```
Create an automated local enum workflow with linpeas and manual-check reminders for Linux privilege escalation in lab systems.
    ```
58. **Workflow: Persistence Detection Audit**  
    **Copy/Paste Prompt:**
    ```
Build a defensive script that checks cron, systemd, rc files, and shell profiles for suspicious persistence artifacts.
    ```
59. **Workflow: Incident Triage Starter**  
    **Copy/Paste Prompt:**
    ```
Generate a first-response Kali checklist script to gather volatile data, active connections, process trees, and recent auth logs.
    ```
60. **Workflow: Home Lab End-to-End Automation**  
    **Copy/Paste Prompt:**
    ```
Create a master orchestrator that chains recon, service analysis, vuln triage, and report generation for targets in my home lab scope file.
    ```