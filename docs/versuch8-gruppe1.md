---
author: [Jakob Waibel, Daniel Hiller, Elia Wüstner, Felicitas Pojtinger]
date: "2021-12-07"
subject: "Praktikum Rechnernetze: Protokoll zu Versuch 8 (Switching im LAN) von Gruppe 1"
keywords: [Rechnernetze, Protokoll, Versuch, HdM Stuttgart]
subtitle: "Protokoll zu Versuch 8 (Switching im LAN) von Gruppe 1"
lang: "de"
---

# Praktikum Rechnernetze

## Einführung

### Mitwirken

Diese Materialien basieren auf [Professor Kiefers "Praktikum Rechnernetze"-Vorlesung der HdM Stuttgart](https://www.hdm-stuttgart.de/vorlesung_detail?vorlid=j212254).

**Sie haben einen Fehler gefunden oder haben einen Verbesserungsvorschlag?** Bitte eröffnen Sie ein Issue auf GitHub ([github.com/pojntfx/uni-netpractice-notes](https://github.com/pojntfx/uni-netpractice-notes)):

![QR-Code zum Quelltext auf GitHub](./static/qr.png){ width=150px }

Wenn ihnen die Materialien gefallen, würden wir uns über einen GitHub-Stern sehr freuen.

### Lizenz

Dieses Dokument und der enthaltene Quelltext ist freie Kultur bzw. freie Software.

![Badge der AGPL-3.0-Lizenz](https://www.gnu.org/graphics/agplv3-155x51.png){ width=128px }

Uni Network Practice Notes (c) 2021 Jakob Waibel, Daniel Hiller, Elia Wüstner, Felicitas Pojtinger

SPDX-License-Identifier: AGPL-3.0

\newpage

## Allgemeines

**Mal ganz dumm gefragt: Wieso haben manche Switches als Layer-2-Koppelelement eigentlich eine IP-Adresse?**

Ein switch benötigt keine IP-Adresse um frames zu benachbarten Geräten zu senden. Wenn ein Switch allerdings Remote-Access über e.g. telnet oder ssh benötigt, ist eine IP-Adresse notwendig. Diese IP kann allerdings nur einem virtuellen Interface zugewiesen werden.

**Ist ein Switch der eine IP-Adresse hat, automatisch ein Layer-3-Switch**

Wie aus der vorherigen Aufgabe hervorgeht, ist ein Switch mit IP-Adresse nicht automatisch ein Layer 3 Switch. 

**Was ist der Unterschied zwischen einem Layer-3-Switch und einem Router?**

Der Hauptunterschied liegt in der Hardware. Da Switches primär für Intranets ausgelegt sind besitzt ein Layer 3 Switch keine WAN-Ports. Switches sind für lokale Netzwerke und das routen zwischen VLANs gedacht.

## Switch Konfiguration

**Sie bekommen die Switche sozusagen „originalverpackt“. Um die Geräte initial zu konfigurieren, müssen Sie ein serielles Kabel (Console) an den PC anschließen und Putty oder MobaXterm (Console Serial: COMx, Speed: 9600; Console USB: COMx, Speed: 9600) starten**

Im Folgenden ist die PuTTY-Konfiguration zu sehen, welche die Verbindung mit dem Switch ermöglichts hat:

![PuTTy setup](./static/putty-connection.png)

![PuTTy logged in](./static/putty-logged-in.png)

**Zur Sicherheit setzen Sie nach erfolgreicher Verbindung ihren Switch auf Werkszustand zurück. Das geht über die Console mit dem Befehl erase all. (Anm.: Da an dem Switch auch ihr PC mit RDP dranhängt, geht auch die RDP-Verbindung verloren. D.h. Sie müssen sich anschließend neu mit RDP auf ihrem PC anmelden)**

Vor Beginn der Konfiguration setzen wir den Switch auf Werkszustand zurück: 

![Zurücksetzen des Switches](./static/erase-all.png)

Das Zurücksetzen hat ca. 3 Minuten gedauert.

![Nach dem Zurücksetzen des Switches](./static/post-reset.png)

**Vergeben Sie für Ihren Switch die entsprechende IP (siehe Zuordnung unter Ilias).**

Der Switch wurde nach folgender Zuordnung angeschlossen: `switch-71 (141.62.66.71) ist per seriellem Kabel an rn01 angeschlossen`

![Main-Menü](./static/menu-main.png)

![IP-Konfiguration](./static/ip-configuration.png)

![SNMP-Konfiguration](./static/snmp-config.png)

![Einstellen des Passworts auf `versuch`](./static/set-password.png)

![Telnet ist deaktivert](./static/telnet-disabled.png)

![Telnet ist durch Config deaktivert](./static/telnet-disabled-in-config.png)

**Nach der IP-Konfiguration ist ihr Switch auch über einen Web-Browser erreichbar. Neuerdings bietet HP dazu zwei unterschiedliche GUIs an. Schauen Sie sich diese beiden GUIs an und bilden Sie sich ein Urteil.**

![Login in die UI](./static/web-gui-login.png)

![Neue UI](./static/web-gui-new.png)

![Alte UI](./static/web-gui-old.png)

Die neue GUI sieht natürlich sehr schön aus, allerdings fiel uns die Navigation mit Hilfe des alten GUIs leichter, weshalb wir primär dieses verwendeten. 

## Analyse mit Wireshark

**Starten Sie Wireshark und dokumentieren Sie die Protokolle die bereits jetzt Traffic in Zusammenhang mit ihrem Switch erzeugen (abgesehen von ihren eigenen httpAnfragen und die ARP-Anfragen von 141.62.66.236 (=FOG-Cloning Server) oder anderen Servern/Routern (=141.62.66.240, 141.62.66.250….) und natürlich dem RDP). Welchen Wireshark-Filter setzen Sie ein, um möglichst nur noch den Traffic ihres Switches einzufangen?**

Mit dem Filter `!ip.addr && !arp` werden alle Pakete, welche keine IP-Addresse haben, und das ARP-Protokoll ausgeblendet; zurück bleibt nur noch der Traffic des Switches.

![Traffic im Netzwerk des Switch](./static/switch-traffic.png)

**Was ist LLDP? Bringen Sie Ihren Windows-Client dazu, LLDP in Verbindung mit Ihrem Switch zu realisieren (Dafür ist unter Windows noch der LLDP-Dienst z.B. von https://raspi.github.io/projects/winlldpservice/ zu installieren. Unter Linux lässt sich mit apt install lldpd der Dienst ebenfalls nachinstallieren.)**

LLDP steht für `Link Layer Discovery Protocol`. Es ist ein Layer 2 Neighbor-Discovery Protokoll, welches ermöglicht, Geräteinformationen mit benac hbarten Geräten auszutauschen. Es ist üblich LLDP auf allen Koppelgeräten innerhalb eines Netzwerkes zu aktivieren, damit auch bei verschiedenen Herstellern Kommunikation reibungslos verlaufen kann. 

![Start des LLDP-Dienstes](./static/win-lldp-start.png)

![Auslesen eines LLDP-Pakets mittels PowerShell](./static/lldp-powershell-module.png)

![Darstellung eines LLDP-Pakets mittels PowerShell](./static/lldp-inspect.png)

## Konfigurationsdatei

**Laden Sie sich die Switch-Konfiguration auf ihren PC und schauen Sie sich die Datei mit einem Texteditor an.**

Wir haben die Konfigurationsdatei mit Hilfe eines TFTP-Servers auf unser lokales Gerät geladen. 
![Start des TFTP-Servers auf der Workstation](./static/enable-tftp-server.png)

![Gestarter TFTP-Server](./static/started-tftp-server.png)

![Upload der Konfig-Datei auf TFTP-Server](./static/tftp-upload.png)

**Ändern Sie in der heruntergeladenen Config-Datei den Namen des VLAN 1 und spielen Sie diese Datei als Konfiguration zurück auf den Switch.**

Nachdem wir den VLAN-Namen verändert haben, konnten wir die Datei mit Hilfe des TFTP-Servers wieder auf den Switch laden.

![Download der geänderten Konfig-Datei vom TFTP-Server](./static/tftp-download.png)

## Spanning-Tree-Verfahren

**Aktivieren Sie das Spanning-Tree-Protokoll (Versuchen Sie herauszufinden was in ihrem Fall einzustellen ist, MSTP oder RSTP, wo liegen die Unterschiede). Stecken Sie nun eine Schleife (Der Betreuer im Labor erledigt das für sie) zwischen den Switches und versuchen Sie durch Verändern der Parameter, den Ring an einer Stelle zu unterbrechen (Hinweis: spanning-tree <port-list> priority <prioritymultiplier> )**

Nach der Konfiguration des Spanning-Tree-Protokolls konnte man erkennen, wie beim Test des Betreuers Port 5 und 6 vom Spanning-Tree-Protokoll geblockt werden. Dies war in unserem Fall die richtige Handlung, da auf diesen Ports die Schleife angeschlossen war.

![Konfiguration des Spanning-Tree](./static/spanning-tree-config.png)

![UI-Ausgabe der Spanning-Tree-Konfiguration](./static/spanning-tree-ui.png)

![UI-Ausgabe der Ports nach dem Erstellen der Schleife](./static/after-loop.png)

![Ports werden automatisch durch MSTP blockiert](./static/ports-blocked-after-loop.png)

**Welche Funktion hat das Protokoll BPDU (vgl. Anhang, Internet) in Zusammenhang mit Switches? In welchen Abständen sendet es der Switch? Was will er damit erreichen?**

BPDU steht für "Bridge Protocol Data Unit". Dieses Protokoll wird genutzt, um Schleifen in einem Netzwerk festzustellen. Ein BPDU-Paket erhält Informationen zu Ports, Switches, Priorität von Ports und Adressen. Die Pakete werden von der jeweiligen Root-Bridge an alle Switches gesendet. Mit Hilfe dieses Protokolls kann sichergestellt werden, dass Schleifen frühzeitig erkannt werden.

In unserem Fall werden BPDU-Pakete alle 2 Sekunden gesendet. 

![BDPU-Pakete werden alle 2 Sekunden gesendet](./static/bpdu-timeframe.png)

**Dokumentieren und interpretieren Sie die Ziel-MAC-Adresse, an die die BPDU-Pakete gesendet werden.**

Ziel-MAC-Adresse: `01:80:c2:00:00:00`

Dabei handelt es sich um eine Ethernet-Multicast-Adresse. Sie ist eine Well-Known-Adresse und wird beschrieben als "Local LAN Segment, stopping at STP-capable switches".

![Ziel-MAC-Adresse eines BDPU-Pakets](./static/bpdu-dest.png)

**Mit Hilfe von admin-edge-port kann man für einzelne Switchports das Forwarding aktivieren. Diese Option bringt einen Port sofort in den Forwarding-Zustand,unabhängig davon ob evtl. Schleifen vorhanden sind oder nicht. Wo ist diese Funktion sinnvoll einsetzbar? Was ist der Unterschied zu der Option auto-edge-port? Welche Befehle gibt es sonst noch um sich den Status des Spanning-Tree anzusehen (Der Befehl show und seine Optionen helfen weiter)?**

TODO: Add answer

## Port Mirroring und Port Security

**Spiegeln Sie den Datenverkehr eines beliebigen aktiven Ports auf einen anderen Port und dokumentieren Sie die Einstellung. Wann wird in der Praxis „Mirroring“ verwendet? Die entsprechende Funktion finden Sie unter Troubleshooting in der Web-Navigation links**

TODO: Add answer

![Deaktiviertes Port-Mirroring](./static/port-mirroring-disabled.png)

![Einstellung Port-Mirroring von Port 1 auf Port 8](./static/port-mirroring-1-to-8.png)

![Aktiviertes Port-Mirroring](./static/port-mirroring-enabled.png)

**Überprüfen Sie, ob es möglich ist, alle Switch-Ports auf einen einzigen Port zu spiegeln. Wann ist dieses Vorgehen sinnvoll? Wo liegen die Grenzen?**

TODO: Add answer

![Einstellung Port-Mirroring alle Ports auf Port 8](./static/port-mirroring-everything.png)

![Aktiviertes Port-Mirroring alle Ports auf Port 8](./static/port-mirroring-everything-enabled.png)

**Bei einem Switch können Sie aus Sicherheitsgründen den Zugriff auf erlaubte bzw. bekannte MAC-Adressen beschränken. Beispiel: Sie installieren einen Switch in Ihrer Firma und wollen, dass nur ausgewählte PCs (MAC-Adressen) in Ihrem Netzwerk kommunizieren können. Mitarbeiter dürfen keine privaten Geräte anschließen. Vorgehen: Sie konfigurieren die Port-Security für Port 8 und der Betreuer im Labor versucht über diesen Port mit einem Notebook (MAC-Adresse bitte erfragen) einen Ping ins Labor oder ins Internet.**

Beispielhaft wird nur unsere Workstation (MAC-Adresse `4C:52:62:0E:E0:E6`) allowlisted; theoretisch würde hier aber auch keine Addresse zum selben Effekt (keine Verbindung möglich).

Aktiviert wird "Send Trap and Disable", was zur Folge hat:

> A trap is sent to all trap receivers when an unauthorized device is detected, and the unauthorized device is disabled.

![Aktivierte Port-Security auf Port 8 mit allowlisteter Workstation](./static/port-security-enabled.png)

Wie zu erwarten ist, konnte vor einem allowlisten ein angeschlossenes Laptop (MAC-Adresse `28:d2:44:e0:d9:28`) nicht das Internet erreichen; wird dieser allerdings allowlisted, so kann dieses bzw. andere Hosts im Labor erreicht werden:

![Aktivierte Port-Security auf Port 8 mit allowlistetem Laptop](./static/port-security-allowlisted-laptop.png)

## VLANs

**Erstellen sie auf dem Switch zwei weitere VLANs mit unterschiedlicher Priorität. Es befindet sich immer ein sogenanntes Default-VLAN auf einem Switch, welches meistens die ID 1 besitzt. Legen Sie ein VLAN 2 und ein VLAN 3 an und konfigurieren Sie auf Switch-Port 5 und 6 des Switches jeweils die drei VLANs als getagged. Was bedeutet in diesem Zusammenhang tagged und untagged?**

TODO: Add answer

![VLAN 1](./static/vlan-1.png)

![VLAN 2](./static/vlan-2.png)

![VLAN 3](./static/vlan-3.png)

**Es sollen über diese 2 Switch-Ports 3 VLANs bedient werden. Im weiteren setzen Sie für diese VLANs unterschiedlichen Prioritäten (Stichwort: qos)**

![VLAN-Config](./static/vlan-config.png)

Diese Konfiguration spiegelt sich auch im Web-Interface wieder:

![VLAN-Config in der UI](./static/vlan-config-ui.png)

**Die VLAN-Priorisierung auf dem SmartClass Tester entspricht der VLAN-Konfiguration auf dem Switch. Was sollte ihrer Meinung mit den drei Streams passieren?**

TODO: Add answer

**Der Betreuer teilt Ihnen die Ergebnisse der Messung zur Dokumentation mit**

Gemessen wurden wie erwarted folgende Werte, welche zusammen eine Datenrate von ~99.6 Mbit/s darstellen:

| Stream | Datenrate  |
| ------ | ---------- |
| 1      | 53 Mbit/s  |
| 2      | 41 Mbit/s  |
| 3      | 5.6 Mbit/s |

Das Lastmessgerät zeigt Folgendes:

![Lastmessgerät zu Stream 1](./static/qos-stream-1.jpg)

![Lastmessgerät zu Stream 2](./static/qos-stream-2.jpg)

![Lastmessgerät zu Stream 3](./static/qos-stream-3.jpg)

Die UI zeigt hier auch den Traffic an:

![VLAN-Traffic in der UI](./static/vlan-traffic.png)

## Sichern der Konfiguration

**Sichern Sie Ihre Konfiguration mit: `write memory` bevor sie den Switch ausschalten und notieren Sie sich Ihre Switch-Nummer, im nächsten Versuch „Netzwerkmanagement“ werden Sie „Ihren“ Switch wieder brauchen.**

![Speichern der Konfiguration](./static/write-memory.png)
