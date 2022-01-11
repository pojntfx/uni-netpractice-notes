---
author: [Jakob Waibel, Daniel Hiller, Elia Wüstner, Felix Pojtinger]
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

Uni Network Practice Notes (c) 2021 Jakob Waibel, Daniel Hiller, Elia Wüstner, Felix Pojtinger

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

TODO: Add interpretation

`141.62.66.215` war zum Zeitpunkt der Versuchsdurchführung nicht erreichbar.

![Ergebnis der Abfrage auf `141.62.66.213`](./static/speed-213.png)

![Ergebnis der Abfrage auf `141.62.66.214`](./static/speed-214.png)

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
