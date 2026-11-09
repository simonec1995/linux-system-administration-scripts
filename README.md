# Linux System Administration & Firewall Monitoring

Questo repository raccoglie uno script Bash e la documentazione relativa a un'esercitazione pratica di **amministrazione di sistema Linux**, incentrata sulla gestione della sicurezza locale (utenti e permessi) e sul monitoraggio dell'infrastruttura di rete.

## 🛠 Competenze e Funzionalità Implementate

* **Gestione Utenti e Gruppi:** Creazione di gruppi di lavoro specifici (`amministrazione`) e profilazione degli utenti per garantire il principio del minimo privilegio.
* **Controllo degli Accessi (DAC):** Configurazione di cartelle protette tramite permessi POSIX avanzati (`chmod 770` e gestione della ownership `root:amministrazione`), con test di verifica dei permessi di scrittura e isolamento utenti.
* **Automation & Monitoring (Bash Scripting):** Sviluppo di uno script per il controllo dello stato di salute del sistema e la verifica della raggiungibilità di un firewall (`pfSense`).

## 📜 Lo Script di Monitoraggio (`controllo.sh`)

Lo script esegue tre operazioni principali:
1. Stampa la data e l'ora correnti dell'analisi.
2. Controlla lo spazio disponibile sul File System di radice (`/`).
3. Effettua un test ICMP verso il gateway/firewall di rete (es. `192.168.50.1`), restituendo un output chiaro sullo stato della connessione (`Firewall OK` / `Firewall ERRORE`).

```bash
#!/bin/bash
date
df -h /
if ping -c 1 -W 2 192.168.50.1 > /dev/null; then 
    echo "Firewall OK"
else 
    echo "Firewall ERRORE"
fi
