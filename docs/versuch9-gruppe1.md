---
author: [Jakob Waibel, Daniel Hiller, Elia Wüstner, Felicitas Pojtinger]
date: "2021-12-07"
subject: "Praktikum Rechnernetze: Protokoll zu Versuch 9 (Netzmanagement und Netzanalyse) von Gruppe 1"
keywords: [Rechnernetze, Protokoll, Versuch, HdM Stuttgart]
subtitle: "Protokoll zu Versuch 9 (Netzmanagement und Netzanalyse) von Gruppe 1"
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

## SNMP

**Erkennen Sie, wer der Verwalter des Gerätes 141.62.66.213, 141.62.66.214 und 141.62.66.215 ist (sysContact)? Starten Sie eine Anfrage an einen Switch, die die Systeminfos abruft.**

`141.62.66.215` war wie auf dem Screenshot zu sehen ist zum Zeitpunkt der Versuchsdurchführung nicht erreichbar.

![Ergebnis der Abfrage (van der Kamp)](./static/snmp-results.png)

**Nutzen Sie den Befehl snmpwalk, um zu ergründen auf welchem Switchport (141.62.66.213, 141.62.66.214 oder 141.62.66.215) wie viel los war. Um welche Einheit handelt es sich? Auf welchem Switchport war bisher offensichtlich kein PC angesteckt?**

TODO: Add interpretation

`141.62.66.215` war zum Zeitpunkt der Versuchsdurchführung nicht erreichbar.

![Ergebnis der Abfrage auf `141.62.66.213`](./static/traffic-213.png)

![Ergebnis der Abfrage auf `141.62.66.214`](./static/traffic-214.png)

**Welche „Geschwindigkeiten“ (10, 100, 1000 Mbit/s) haben die Interfaces derzeit jeweils und warum? Was ist das besondere bei Port 25 auf Switch 141.62.66.215 ? (Hinweis: ifSpeed vs. ifHighSpeed)**

![Ergebnis der Abfrage auf `141.62.66.213`](./static/speed-213.png)

![Ergebnis der Abfrage auf `141.62.66.214`](./static/speed-214.png)

![Ergebnis der `ifspeed` Abfrage auf `141.62.66.215`](./static/snmpwalk-ifspeed-215.png)

![Ergebnis der `ifHighSpeed` Abfrage auf `141.62.66.215`](./static/snmpwalk-ifhighspeed-215.png)

TODO: Add interpretation

**Welche Geräte sind auf welchen Ports (141.62.66.213 oder .214, .215) angeschlossen (Hinseis: ifAlias)?**

TODO: Add interpretation

`141.62.66.215` war zum Zeitpunkt der Versuchsdurchführung nicht erreichbar.

![Ergebnis der Abfrage auf `141.62.66.213`](./static/alias-213.png)

![Ergebnis der Abfrage auf `141.62.66.214`](./static/alias-214.png)

**Gibt es Unterschiede beispielsweise zwischen PCs die angeschaltet sind und solchen, die zwar angeschlossen, aber ausgeschaltet sind (Hinweis: Erkennbar an der Port-Geschwindgkeit) ?**

Alle Geräte bei uns sind angeschlossen und deren Ports werden als 1 Gigabit-Port dargestellt; Alias 25 aber wird als 10 Gigabit-Port dargestellt. Alias 4433 wird als 100 MBit-Port dargestellt.

Nachdem der Rechner `rn04` ausgeschaltet wurde, findet sich für den Switch mit der IP `141.62.66.214` an Port 5 die Geschwindigkeit 10 Mbit:

![Ergebnis der Abfrage auf `141.62.66.214`](./static/slow-port-5.png)

Zu sehen ist also, dass für ausgeschaltene PCs die Port-Geschwindigkeit auf 10 Mbit sinkt.

**Wie sieht ein entsprechender snmpwalk bei ihrem Switch aus (objectID: .1.3.6.1.2.1.1)?**

![Ergebnis der Abfrage auf `141.62.66.71`](./static/snmpwalk-switch.png)

**Setzen Sie mit snmpset einen Ansprechparter auf ihrem Switch. Überprüfen sie ihre Einstellung!**

Zuerst muss SNMP-Schreibzugriff aktiviert werden:

![Aktivieren von SNMP-Schreibzugriff](./static/enable-snmp-write-access.png)

Im nachfolgenden wird nun der Switch mit der IP `141.62.66.81` verwendet.

![Ergebnis der Abfrage auf `141.62.66.81`](./static/syscontact-og.png)

![Setzen und erneutes Abfragen von `syscontact` auf `141.62.66.81`](./static/syscontact-new.png)

**Verändern Sie mittels snmpset die Namen einzelner Switchports.**

![Abfragen und Setzen des Namens des Switch-Ports 1 auf `141.62.66.81`](./static/port-name-change.png)

**Setzen Sie mit snmpset einen beliebigen Switchport auf disable (Vorsicht: „Schneiden Sie sich nicht den Ast auf dem Sie sitzen ab!“)**

![Deaktivieren eines Switchports auf `141.62.66.81`](./static/disable-switch-port.png)

**Wie ändert man den System-Namen des Switches?**

![Abfragen und Setzen des Namens des Switch-Namens 1 auf `141.62.66.81`](./static/sysname-set.png)

## Prometheus und Grafana

**Fragen Sie mit Prometheus den sysName ihres Switches ab**

![Ergebnis der `sysname`-Abfrage für 141.62.66.81`](./static/prometheus-sysname.png)

**Wie lange läuft Ihr Switch bereits?**

![Ergebnis der `uptime`-Abfrage für 141.62.66.81`](./static/prometheus-uptime.png)

TODO: Add interpretation

**Sind alle Switchports „UP“?**

![Ergebnis der Switchport-Status-Abfrage für 141.62.66.81`](./static/prometheus-ifadmin.png)

TODO: Add interpretation

**Mit welchem Speed laufen ihre Switchports**

![Ergebnis der `ifspeed`-Abfrage für 141.62.66.81`](./static/prometheus-ifspeed.png)

TODO: Add interpretation

**Über wie viele Ethernet-Interfaces verfügt ihr Switch?**

![Ergebnis der `ifindex`-Abfrage für 141.62.66.81`](./static/prometheus-ifindex.png)

TODO: Add interpretation

**Legen Sie sich zunächst ein eigenes Dashboard (entsprechend ihrem Switch-Namen) an, damit Sie niemandem in die Quere kommen.**

![Erstellen der Datenquelle für Prometheus](./static/grafana-add-data-source.png)

**Stellen Sie Ingress und Egress eines Switchports mit einem sinnvollen Graphen dar**

![Query in Prometheus (`irate(ifInOctets{instance="141.62.66.81", ifIndex="1"}[1m])`)](./static/prometheus-irate.png)

![Graph in Grafana](./static/grafana-finished-graph.png)

![Eingestellte Metrics in Grafana](./static/grafana-query-edit.png)

## Munin

**Wie platziert man sämtliche Nodes/Switche in der Web-Ansicht unter einer neuen Gruppe „Labor“ ? (Hinweis: Die gewählt Gruppenbezeichnung ist jedem Node voranzustellen.) Sprechen Sie sich innerhalb der Gruppe beim Editieren der /etc/munin/munin.conf ab, Sie arbeiten an EINER Datei!**

```shell
$ ssh-copy-id root@141.62.66.91
$ ssh root@141.62.66.91
# 83 ist im Versuch nicht erreichbar gewesen
for node in 81 82 84 85; do
munin-node-configure --shell --snmp 141.62.66.${node} --snmpcommunity public | bash
tee /etc/munin/munin-conf.d/141.62.66.${node}.conf <<EOT
[Labor;141.62.66.${node}]
    address 127.0.0.1
    use_node_name no
EOT
done
# systemctl restart munin-node
# munin-check
```

![Output der Web-GUI (Switch 216 in der Gruppe "Switches" war zuvor schon konfiguriert)](./static/munin-output.png)

**Vergleichen Sie die beiden Tools Prometheus/grafana und munin. Welche Vor und Nachteile sehen sie jeweils?**

TODO: Add answer

## LibreNMS

**Richten Sie ihren Windows-Client für den SNMP-Dienst her und fügen ihn als Device in LibreNMS hinzu. Konfigurieren Sie sinnvolle Einträge für „sysContact“ und „Location“. Wie interpretieren Sie die Anzahl und die Bezeichnungen der Ethernet-Ports für Ihre Windows-Maschine?**

![Aktivierung von SNMP auf Windows](./static/windows-enable-snmp.png)

![Aktivierung von Remotezugriff bei SNMP auf Windows](./static/snmp-enable-remote-access.png)

![Setzen der SNMP-Einstellungen auf Windows](./static/snmp-windows-contact.png)

```shell
$ snmpwalk -v 2c -c public 141.62.66.1
SNMPv2-MIB::sysDescr.0 = STRING: Hardware: Intel64 Family 6 Model 158 Stepping 9 AT/AT COMPATIBLE - Software: Windows Version 6.3 (Build 19043 Multiprocessor Free)
SNMPv2-MIB::sysObjectID.0 = OID: SNMPv2-SMI::enterprises.311.1.1.3.1.1
DISMAN-EVENT-MIB::sysUpTimeInstance = Timeticks: (103835) 0:17:18.35
SNMPv2-MIB::sysContact.0 = STRING: Gruppe 1
SNMPv2-MIB::sysName.0 = STRING: rn01
SNMPv2-MIB::sysLocation.0 = STRING: Labor
SNMPv2-MIB::sysServices.0 = INTEGER: 77
```

![Hinzufügen des Windows-Hosts in LibreNMS](./static/librenms-add-device.png)

![Abfrage der Netzwerkinterfaces des Windows-Host über `snmpwalk`](./static/snmpwalk-windows.png)

![Abfrage der Netzwerkinterfaces des Windows-Host über LibreNMS](./static/librenms-ports.png)

TODO: Add interpretation of network interface names

**Welche Erkenntnisse ziehen Sie aus den Angaben zu STP und Neighbours bzgl. Ihres HP 2530-Switch, nachdem Sie ihn hinzugefügt haben?**

```shell
$ snmpwalk -v 2c -c public 141.62.66.81
SNMPv2-MIB::sysDescr.0 = STRING: HP J9777A 2530-8G Switch, revision YA.16.06.0006, ROM YA.15.20 (/ws/swbuildm/rel_washington_qaoff/code/build/lakes(swbuildm_rel_washington_qaoff_rel_washington)) (Formerly ProCurve)
SNMPv2-MIB::sysObjectID.0 = OID: SNMPv2-SMI::enterprises.11.2.3.7.11.141
DISMAN-EVENT-MIB::sysUpTimeInstance = Timeticks: (9263269) 1 day, 1:43:52.69
SNMPv2-MIB::sysContact.0 = STRING: uwu
SNMPv2-MIB::sysName.0 = STRING: uwu-switch
SNMPv2-MIB::sysLocation.0 = STRING:
SNMPv2-MIB::sysServices.0 = INTEGER: 74
```

![Hinzufügen des Switch in LibreNMS](./static/librenms-add-switch.png)

![Graph zu Neigbours in LibreNMS](./static/librenms-graph.png)

![STP-Basics LibreNMS](./static/librenms-stp-basic.png)

![Ports zu STP LibreNMS](./static/librenms-stp-ports.png)

TODO: Add interpretation on STP and neigbors

**Fügen Sie den Switch 141.62.66.215 zu LibreNMS hinzu. Kontrollieren Sie den Port 25 (A1) auf Switch 141.62.66.215. Wie ist die Angabe des „Speed“ im Vergleich zur Feststellung aus Aufgabe 1 c?**

```shell
$ snmpwalk -v 2c -c public 141.62.66.215
SNMPv2-MIB::sysDescr.0 = STRING: HP J9726A 2920-24G Switch, revision WB.16.10.0015, ROM WB.16.03 (/ws/swbuildm/rel_ajanta_arenal_qaoff/code/build/anm(swbuildm_rel_ajanta_arenal_qaoff_rel_ajanta_arenal)) (Formerly ProCurve)
SNMPv2-MIB::sysObjectID.0 = OID: SNMPv2-SMI::enterprises.11.2.3.7.11.152
DISMAN-EVENT-MIB::sysUpTimeInstance = Timeticks: (1790824277) 207 days, 6:30:42.77
SNMPv2-MIB::sysContact.0 = STRING: van der Kamp
SNMPv2-MIB::sysName.0 = STRING: 215-HP-2920-24G-R141
SNMPv2-MIB::sysLocation.0 = STRING: R141
SNMPv2-MIB::sysServices.0 = INTEGER: 74
```

![Hinzufügen des Switch in LibreNMS](./static/librenms-add-second-switch.png)

![Speed an Port A1](./static/librenms-215-speed.png)

TODO: Add interpretation (10 Gigabit)

**Fügen Sie Device 141.62.66.241 hinzu. Wozu dient das Device?**

```shell
$ snmpwalk -v 2c -c public 141.62.66.241
SNMPv2-MIB::sysDescr.0 = STRING: ws_brs
SNMPv2-MIB::sysObjectID.0 = OID: SNMPv2-SMI::enterprises.40595
DISMAN-EVENT-MIB::sysUpTimeInstance = Timeticks: (189474772) 21 days, 22:19:07.72
SNMPv2-MIB::sysContact.0 = STRING: RNLab Admin
SNMPv2-MIB::sysName.0 = STRING: BrennenstuhlPDU
SNMPv2-MIB::sysLocation.0 = STRING: R142A
SNMPv2-MIB::sysServices.0 = INTEGER: 72
IF-MIB::ifNumber.0 = INTEGER: 1
IF-MIB::ifIndex.1 = INTEGER: 1
IF-MIB::ifDescr.1 = STRING: ti
IF-MIB::ifType.1 = INTEGER: ethernetCsmacd(6)
IF-MIB::ifMtu.1 = INTEGER: 1500
IF-MIB::ifSpeed.1 = Gauge32: 1000000
IF-MIB::ifPhysAddress.1 = STRING: 20:4c:6d:0:32:b
IF-MIB::ifAdminStatus.1 = INTEGER: up(1)
IF-MIB::ifOperStatus.1 = INTEGER: up(1)
IF-MIB::ifLastChange.1 = Timeticks: (0) 0:00:00.00
IF-MIB::ifInOctets.1 = Counter32: 0
IF-MIB::ifInUcastPkts.1 = Counter32: 0
IF-MIB::ifInNUcastPkts.1 = Counter32: 0
IF-MIB::ifInDiscards.1 = Counter32: 0
IF-MIB::ifInErrors.1 = Counter32: 0
IF-MIB::ifInUnknownProtos.1 = Counter32: 24726828
IF-MIB::ifOutOctets.1 = Counter32: 0
IF-MIB::ifOutUcastPkts.1 = Counter32: 0
IF-MIB::ifOutNUcastPkts.1 = Counter32: 0
IF-MIB::ifOutDiscards.1 = Counter32: 0
IF-MIB::ifOutErrors.1 = Counter32: 0
IF-MIB::ifOutQLen.1 = Gauge32: 0
IF-MIB::ifSpecific.1 = OID: SNMPv2-SMI::zeroDotZero
```

![Hinzufügen des Geräts in LibreNMS](./static/librenms-add-241.png)

![Device info in LibreNMS](./static/librenms-status-241.png)

TODO: Add interpretation (socket strip)
