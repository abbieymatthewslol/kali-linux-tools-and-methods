# kali-linux-tools-and-methods

Technical and quick list of Kali Linux tutorials, tools, scripts, and commands.

## Cursor Agent Workflows for Kali Linux (Home Lab)

Use these in **authorized environments only** (your own lab, CTF, or systems you have explicit permission to test). Each workflow includes a ready-to-use prompt for Cursor agents running in Kali Linux home environments. Prompts are formatted in code blocks for quick scanning and one-click copy/paste.

### Placeholder Rules (for quick copy/paste users)

- Any value wrapped in `<LIKE_THIS>` is a placeholder and **must be replaced** before running.
- If you are rushing, replace placeholders first: `<TARGET_SCOPE>`, `<TARGET_LIST_FILE>`, `<TARGET_DOMAIN>`, `<OUTPUT_DIR>`.
- If a placeholder is unknown, stop and fill it in before execution.


1. **Workflow: Nmap Baseline Discovery**  
   **Copy/Paste Prompt:**
   ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Create a bash workflow that runs nmap -sV -O against <TARGET_LIST_DESCRIPTION> in <TARGET_LIST_FILE>, saves XML and grepable output in <RECON_OUTPUT_DIR>, and summarizes top open ports per host.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
   ```
2. **Workflow: Fast Host Sweep**  
   **Copy/Paste Prompt:**
   ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Generate an automated ping sweep using fping for <TARGET_CIDR> from Kali, write live hosts to <LIVE_HOSTS_FILE>, and retry failed hosts once.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
   ```
3. **Workflow: Service Banner Collection**  
   **Copy/Paste Prompt:**
   ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Build a script to collect service banners with nmap --script=banner for all hosts in <LIVE_HOSTS_FILE> and save a markdown summary by host.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
   ```
4. **Workflow: HTTP Tech Fingerprinting**  
   **Copy/Paste Prompt:**
   ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Automate whatweb and nikto scans for each web service found by nmap, store results in ~/engagements/web/<host>, and flag outdated server versions.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
   ```
5. **Workflow: Subdomain Enumeration**  
   **Copy/Paste Prompt:**
   ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Create a Kali workflow using subfinder and assetfinder for <TARGET_DOMAIN>, merge and deduplicate results, then verify alive subdomains with httpx.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
   ```
6. **Workflow: DNS Record Audit**  
   **Copy/Paste Prompt:**
   ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Write a script that queries A, AAAA, MX, TXT, and NS records with dig for each domain in <DOMAIN_LIST_FILE> and exports a CSV report.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
   ```
7. **Workflow: Directory Bruteforce Pipeline**  
   **Copy/Paste Prompt:**
   ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Automate gobuster dir scans for each discovered web host with a medium wordlist, then parse and rank interesting status codes.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
   ```
8. **Workflow: Parameter Discovery**  
   **Copy/Paste Prompt:**
   ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Generate a workflow using waybackurls and gau to enumerate URL parameters for a target domain and output possible injection points.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
   ```
9. **Workflow: SQLi Quick Triage**  
   **Copy/Paste Prompt:**
   ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Create a safe sqlmap triage script that tests only discovered GET parameters from <PARAMS_FILE> with low risk/level and logs potential SQLi indicators.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
   ```
10. **Workflow: XSS Reflection Checks**  
    **Copy/Paste Prompt:**
    ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Build an automated reflected-XSS check workflow with dalfox on URLs in <XSS_TARGETS_FILE> and produce a concise finding summary.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
    ```
11. **Workflow: TLS Configuration Review**  
    **Copy/Paste Prompt:**
    ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Run testssl.sh against all HTTPS endpoints from <HTTPS_HOSTS_FILE> and generate a report highlighting weak ciphers and cert issues.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
    ```
12. **Workflow: SMB Enumeration**  
    **Copy/Paste Prompt:**
    ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Generate a Kali workflow that runs smbclient, enum4linux-ng, and nmap smb scripts against SMB hosts and organizes outputs by host.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
    ```
13. **Workflow: SSH Hardening Audit**  
    **Copy/Paste Prompt:**
    ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Create an SSH audit routine that checks ciphers, KEX, and auth methods on hosts in <SSH_HOSTS_FILE> and flags weak configurations.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
    ```
14. **Workflow: FTP Anonymous Access Check**  
    **Copy/Paste Prompt:**
    ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Automate FTP anonymous login checks and basic directory listing capture for all FTP services discovered in prior scans.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
    ```
15. **Workflow: SNMP Enumeration**  
    **Copy/Paste Prompt:**
    ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Write a script to test common SNMP community strings, run snmpwalk where valid, and sanitize outputs into host-specific files.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
    ```
16. **Workflow: RDP Exposure Mapping**  
    **Copy/Paste Prompt:**
    ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Build a workflow that identifies exposed RDP endpoints with nmap and gathers protocol/security details for each host.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
    ```
17. **Workflow: Vulnerability Scan Orchestration**  
    **Copy/Paste Prompt:**
    ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Create an automated OpenVAS/Nessus launcher script for a home lab target list and track scan status with timestamped logs.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
    ```
18. **Workflow: CVE Mapping from Service Versions**  
    **Copy/Paste Prompt:**
    ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Parse nmap service/version output and map likely CVEs using searchsploit, producing a prioritized remediation list.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
    ```
19. **Workflow: Metasploit Workspace Setup**  
    **Copy/Paste Prompt:**
    ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Generate a script that creates a Metasploit workspace, imports nmap XML results, tags hosts by service type, and exports notes.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
    ```
20. **Workflow: Brute-force Safety Guardrails**  
    **Copy/Paste Prompt:**
    ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Create a controlled hydra workflow with rate limits, lockout safeguards, and explicit authorization checks before execution.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
    ```
21. **Workflow: Wordlist Mutation Automation**  
    **Copy/Paste Prompt:**
    ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Build a custom wordlist generator from project keywords and leaked patterns, then append rule-based mutations for login testing.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
    ```
22. **Workflow: Hash Identification and Routing**  
    **Copy/Paste Prompt:**
    ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Generate a pipeline that identifies hash types with hashid and routes each hash set to appropriate hashcat modes automatically.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
    ```
23. **Workflow: GPU Crack Session Manager**  
    **Copy/Paste Prompt:**
    ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Create a hashcat session manager script that resumes interrupted jobs, tracks progress, and writes cracked outputs to structured folders.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
    ```
24. **Workflow: John the Ripper Batch Mode**  
    **Copy/Paste Prompt:**
    ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Automate john for multiple hash files in <HASH_INPUT_DIR>, detect format per file, and produce a consolidated cracked credential report.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
    ```
25. **Workflow: Wireless Adapter Readiness Check**  
    **Copy/Paste Prompt:**
    ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Build a pre-flight script for wireless assessments that validates monitor mode capability, driver support, and required Kali packages.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
    ```
26. **Workflow: WPA Handshake Capture Process**  
    **Copy/Paste Prompt:**
    ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Create airodump-ng workflow steps for capturing WPA/WPA2 handshakes in a home lab, including channel lock and capture validation.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
    ```
27. **Workflow: PMKID Collection Routine**  
    **Copy/Paste Prompt:**
    ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Generate a scripted process for hcxdumptool PMKID capture in a legal home setup and convert output to hashcat format automatically.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
    ```
28. **Workflow: Bluetooth Surface Discovery**  
    **Copy/Paste Prompt:**
    ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Automate bluetoothctl and related reconnaissance commands to discover nearby devices and store metadata with timestamps.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
    ```
29. **Workflow: Packet Capture Rotation**  
    **Copy/Paste Prompt:**
    ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Write a tcpdump automation script that rotates pcap files every 5 minutes, compresses old captures, and labels by interface/date.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
    ```
30. **Workflow: Wireshark CLI Triage**  
    **Copy/Paste Prompt:**
    ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Create a tshark-based triage workflow that extracts top talkers, DNS queries, and suspicious HTTP requests from a pcap file.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
    ```
31. **Workflow: ARP Spoof Detection Script**  
    **Copy/Paste Prompt:**
    ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Build a local network monitor that detects ARP table anomalies and alerts when MAC/IP mappings change unexpectedly.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
    ```
32. **Workflow: IDS Rule Test Harness**  
    **Copy/Paste Prompt:**
    ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Generate a Suricata test harness in Kali that replays sample pcaps and reports which IDS rules triggered.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
    ```
33. **Workflow: Log Aggregation for Assessments**  
    **Copy/Paste Prompt:**
    ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Create a script that collects scan logs from <ENGAGEMENT_GLOB>, normalizes timestamps, and aggregates into one searchable file.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
    ```
34. **Workflow: IOC Extraction from Logs**  
    **Copy/Paste Prompt:**
    ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Build an automated parser that extracts domains, IPs, hashes, and URLs from assessment logs and writes deduplicated IOCs.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
    ```
35. **Workflow: Malware Sample Static Triage**  
    **Copy/Paste Prompt:**
    ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Create a static-analysis workflow using file, strings, exiftool, and sha256sum on samples in <SAMPLE_DIR> (no execution).

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
    ```
36. **Workflow: YARA Scan Pipeline**  
    **Copy/Paste Prompt:**
    ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Automate recursive YARA scans over <SAMPLE_DIR> with custom rules and generate a hit report sorted by rule severity.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
    ```
37. **Workflow: PE Metadata Inspection**  
    **Copy/Paste Prompt:**
    ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Generate a workflow using peframe/rabin2 to extract PE metadata and suspicious imports from Windows binaries.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
    ```
38. **Workflow: ELF Binary Quick Review**  
    **Copy/Paste Prompt:**
    ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Create an ELF triage script using readelf, strings, and objdump to identify risky capabilities and embedded indicators.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
    ```
39. **Workflow: Ghidra Project Bootstrap**  
    **Copy/Paste Prompt:**
    ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Automate creation of a Ghidra project directory structure and import queue for binaries awaiting reverse engineering.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
    ```
40. **Workflow: Sandbox VM Snapshot Control**  
    **Copy/Paste Prompt:**
    ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Write a workflow that snapshots a local VirtualBox test VM before analysis, runs a task list, and reverts after completion.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
    ```
41. **Workflow: Container Security Scan**  
    **Copy/Paste Prompt:**
    ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Create a Kali script to inspect local Docker images with trivy and export findings by image tag.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
    ```
42. **Workflow: Web Screenshot Evidence Capture**  
    **Copy/Paste Prompt:**
    ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Automate aquatone or gowitness screenshots for alive web targets and generate an index HTML for quick review.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
    ```
43. **Workflow: API Endpoint Discovery**  
    **Copy/Paste Prompt:**
    ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Generate an API recon workflow that probes common OpenAPI/Swagger paths and catalogs exposed endpoints and methods.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
    ```
44. **Workflow: JWT Security Checks**  
    **Copy/Paste Prompt:**
    ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Build a script to decode JWTs from test traffic, inspect algorithm usage, and flag weak/unsafe token configurations.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
    ```
45. **Workflow: S3 Bucket Exposure Audit**  
    **Copy/Paste Prompt:**
    ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Create an automated check for publicly accessible S3 buckets related to <TARGET_DOMAIN> list and log risky permissions.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
    ```
46. **Workflow: Git Leak Detection**  
    **Copy/Paste Prompt:**
    ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Generate a workflow using trufflehog and gitleaks against local repos to find accidentally committed secrets.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
    ```
47. **Workflow: Password Policy Assessment**  
    **Copy/Paste Prompt:**
    ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Create a script that evaluates observed credential patterns against expected policy rules and reports weak password trends.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
    ```
48. **Workflow: Phishing Domain Monitoring**  
    **Copy/Paste Prompt:**
    ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Build a daily job that searches for typosquatted domains similar to <BRAND_KEYWORD> and logs newly seen candidates.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
    ```
49. **Workflow: Scheduled Recon with Cron**  
    **Copy/Paste Prompt:**
    ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Create a cron-managed recon pipeline that runs host discovery nightly and archives differences from previous runs.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
    ```
50. **Workflow: Differential Scan Comparison**  
    **Copy/Paste Prompt:**
    ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Generate a tool that compares new nmap XML results with prior baselines and highlights newly opened/closed ports.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
    ```
51. **Workflow: Automated Report Drafting**  
    **Copy/Paste Prompt:**
    ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Build a markdown report generator that ingests scan outputs and produces sections for scope, findings, risk, and remediation.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
    ```
52. **Workflow: Evidence File Integrity**  
    **Copy/Paste Prompt:**
    ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Create a workflow that calculates and verifies SHA256 checksums for all evidence files in <EVIDENCE_DIR>.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
    ```
53. **Workflow: Engagement Folder Bootstrap**  
    **Copy/Paste Prompt:**
    ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Generate a script to create standardized engagement folders (recon, exploits, loot, notes, report) under <ENGAGEMENT_ROOT>/<CLIENT_NAME>.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
    ```
54. **Workflow: tmux Operator Workspace**  
    **Copy/Paste Prompt:**
    ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Create a tmux bootstrap script for Kali that opens panes for recon, scanning, notes, and logs with useful aliases preloaded.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
    ```
55. **Workflow: Proxychains Routing Validation**  
    **Copy/Paste Prompt:**
    ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Build a test routine that verifies proxychains traffic routing with curl and nmap before launching any scans.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
    ```
56. **Workflow: Tor Circuit Health Check**  
    **Copy/Paste Prompt:**
    ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Generate a script that checks Tor service status, confirms external IP change, and logs circuit test outcomes.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
    ```
57. **Workflow: Local Privilege Escalation Enumeration**  
    **Copy/Paste Prompt:**
    ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Create an automated local enum workflow with linpeas and manual-check reminders for Linux privilege escalation in lab systems.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
    ```
58. **Workflow: Persistence Detection Audit**  
    **Copy/Paste Prompt:**
    ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Build a defensive script that checks cron, systemd, rc files, and shell profiles for suspicious persistence artifacts.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
    ```
59. **Workflow: Incident Triage Starter**  
    **Copy/Paste Prompt:**
    ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Generate a first-response Kali checklist script to gather volatile data, active connections, process trees, and recent auth logs.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
    ```
60. **Workflow: Home Lab End-to-End Automation**  
    **Copy/Paste Prompt:**
    ```
⚠️ REPLACE EVERY `<LIKE_THIS>` PLACEHOLDER BEFORE RUNNING.
Goal:
Create a master orchestrator that chains recon, service analysis, vuln triage, and report generation for targets in <HOME_LAB_SCOPE> scope file.

Required output:
- A runnable bash workflow/script with clear safety checks and logging.
- Artifacts saved in `<OUTPUT_DIR>/<WORKFLOW_NAME>` (or equivalent structured folder).
- A concise markdown summary of what ran, key results, and next actions.
    ```
