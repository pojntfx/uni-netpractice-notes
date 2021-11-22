---
author: [Jakob Waibel, Daniel Hiller, Elia Wüstner, Felix Pojtinger]
date: "2021-10-19"
subject: "Praktikum Rechnernetze: Protokoll zu Versuch 3 (Router-Betriebssystem Cisco IOS) von Gruppe 1"
keywords: [Rechnernetze, Protokoll, Versuch, HdM Stuttgart]
subtitle: "Protokoll zu Versuch 3 (Router-Betriebssystem Cisco IOS) von Gruppe 1"
lang: "de"
---

# Praktikum Rechnernetze

## Einführung

### Mitwirken

Diese Materialien basieren auf [Professor Kiefers "Praktikum Rechnernetze"-Vorlesung der HdM Stuttgart](https://www.hdm-stuttgart.de/vorlesung_detail?vorlid=5212254).

**Sie haben einen Fehler gefunden oder haben einen Verbesserungsvorschlag?** Bitte eröffnen Sie ein Issue auf GitHub ([github.com/pojntfx/uni-netpractice-notes](https://github.com/pojntfx/uni-netpractice-notes)):

![QR-Code zum Quelltext auf GitHub](./static/qr.png){ width=150px }

Wenn ihnen die Materialien gefallen, würden wir uns über einen GitHub-Stern sehr freuen.

### Lizenz

Dieses Dokument und der enthaltene Quelltext ist freie Kultur bzw. freie Software.

![Badge der AGPL-3.0-Lizenz](https://www.gnu.org/graphics/agplv3-155x51.png){ width=128px }

Uni Network Practice Notes (c) 2021 Jakob Waibel, Daniel Hiller, Elia Wüstner, Felix Pojtinger

SPDX-License-Identifier: AGPL-3.0

\newpage

## Konfiguration

Anders als in der Anleitung beschrieben, haben wir den Versuch mit Ubuntu durchgeführt. Daher im Folgenden eine kleine Anleitung, wie man sich unter Ubuntu mit dem Router verbinden kann.

Zuerst muss man die Anwendung `screen` installieren.

```shell
$ sudo apt install screen
```

Bevor man den Router nun einsteckt, kann man mit Hilfe von `dmesg` feststellen, welche Gerätebezeichnung der Router hat.

```shell
$ sudo dmesg | grep -i tty
```

Steckt man das Gerät nun ein, sollte man eine Meldung sehen, in welchem eine Device-Bezeichnung zu finden ist. In unserem Fall `ttyUSB0`.

Abschließend muss man sich nur noch mit der Cisco-Konsole verbinden. Dies lässt sich mit folgendem Kommando erreichen.

```shell
$ sudo screen /dev/ttyUSB0
```

Nun sollte eine Verbindung zur Cisco-Konsole bestehen.

### Konfiguration des Routers, so dass er mittels ping oder telnet von ihrem Rechner erreichbar ist

Um den Router auf die Default-Werte zurückzusetzen, verwenden wir `write erase`. Zur Sicherheit Laden wir den Router neu mit `reload` neu.

```shell
Router> enable
Router# write erase
```

![Entfernen aller besthenden Konfigurationsdateien](./static/aufgabe1_write_erase_cropped.png)

```shell
Router# reload
```

![Reload des Routers](./static/aufgabe1_write_erase_full_cropped.png)

Erst wechseln wir mit `enable` in den "Privileged Exec-Mode", worüber wir anschließend mit `configure terminal` in "Configuration Exec-Mode" gelangen können.

```shell
Router> enable
Router# configure terminal
```

![Wechsel in den Configure Terminal-Mode](./static/aufgabe1_configure_terminal_cropped.png)

Den Hostname vergeben wir wie folgt `hostname cisco-gruppe1`.

```shell
Router(configure)# hostname cisco-gruppe1
```

![Vergeben eines Hostnamens](./static/aufgabe1_set_hostname_full.png)

Bevor wir nun eine IP-Adresse vergeben können, müssen wir in den Interface-Konfigurations-Modus wechseln. Dies können wir im Config-Exec-Mode mit dem Command `interface GigabitEthernet 0/0` erreichen.

![Vergeben einer IP im Interface GigabitEthernet 0/0](./static/aufgabe1_set_ip_address_cropped.png)

Um für `line con 0` kein Passwort zu vergeben, lassen wir den Passwort-Parameter im Kommando weg. Dies sorgt jedoch dafür, dass der Login verwährt wurde, wie im folgenden Scrreenshot zu sehen ist.

```shell
cisco-gruppe1(configure)# line con 0
```

![Login line con 0](./static/aufgabe1_line_con_0_login.png)

Um für `line vty 0 4` das Passwort zu vergeben und uns einzuloggen, können wir folgende Kommandos verwenden.

```shell
cisco-gruppe1(config)# line vty 0 4
cisco-gruppe1(config-line)# password hdm
cisco-gruppe1(config-line)# login
```

![Passwortvergabe von line vty 0 4](./static/aufgabe1_set_password_short.png)

Die Liste, in welcher alle Interfaces mit IP, etc. aufgelistet wird, kann durch `show ip interface brief` erzeugt werden.

```shell
cisco-gruppe1# show ip interface brief
```

![Einsehen aller Interfaces](./static/aufgabe1_brief_interface.png)

Um die Konfigurationsdatei einzusehen, können wird `show running-config` verwenden.

```shell
cisco-gruppe1# show running-config
```

![Einsehen der Konfigurationsdateien](./static/aufgabe1_show_running_config.png)

Die statisch und dynamischen Routen, können wird mit `show ip route` einsehen.

```shell
cisco-gruppe1# show ip route
```

![Einsehen der Routen](./static/aufgabe1_show_ip_route.png)

Informationen zur Version erhalten wir mit `show version`.

```shell
cisco-gruppe1# show version
```

![Einsehen der Versionsinformationen](./static/aufgabe1_show_version_cropped.png)

Nun kann unser Router über `ping` erreicht werden.

## Internet-Verbindung unter Einsatz von NAT

### Konfigurieren Sie ihren Router unter Einsatz von NAT so, dass von einem angeschlossenen PC aus eine Internet verbindung moeglich ist.

Konfiguration `interface GigabitEthernet 0/1`

Interface `GigabitEthernet 0/1` ist in unserer Konfiguration das LAN-Interface

![Konfiguration interface GigabitEthernet 0/1](./static/aufgabe2_configure_interface_01_short.png)

Konfiguration `interface GigabitEthernet 0/0`

Interface `GigabitEthernet 0/0` ist in unserer Konfiguration das WAN-Interface

Anfangs haben wir die falsche IP `141.62.67.2` gesetzt. Diese haben wir im Nachhinein korrigiert.

![Erste, Fehlerbehaftete Konfiguration](./static/aufgabe21.png)

Mit `clear ip nat translation *` können die falschen Konfigurationen rückgängig gemacht werden.

![Konfiguration interface GigabitEthernet 0/0](./static/aufgabe2_configure_ip_nat_correctly_cropped.png)

Nun muss noch sichergestellt werden, dass wirklich alle interfaces den Status `up` besitzen. Andernfalls können diese mit `no shutdown` in der jeweiligen Interface-Konfiguration aktiviert werden.

Interfaces mit `show ip interface brief` anzeigen und deren Status abfragen.

![Interfaces anzeigen](./static/aufgabe2_ping_room_router_show_ip_cropped.png)

Danach kann am Router im `config` mode mit `ip route 0.0.0.0 0.0.0.0 141.62.66.250` die Route zum Router festgelegt werden und die Verbindung zum Internet sollte hergestellt sein.

Bevor der Lokale Computer über unseren Router eine Internetverbindung aufbauen kann, muss auch dieser konfiguriert werden.

Zuerst entfernen wir die alte IP von unserem Netzwerkinterface `enp0s31f6`.

![IP entfernen](./static/aufgabe2_add_inet_flush_cropped.png)

Danach fügen wir unsere neu bestimmte IP-Adresse zum Netzwerk-Interface hinzu.

![Hinzufügen der neuen IP](./static/aufgabe2_add_inet_cropped_route_cropped.png)

Testen der Internetverbindung unseres Lokalen Computers mit einem ping zu `8.8.8.8` (Googles Public DNS-Server). Dafür kann der Command `ping 8.8.8.8` verwendet werden.

![Ping an den Google-DNS-Server](./static/aufgabe2_ping_dns.png)

### Erläutern Sie in der Ausarbeitung die Bedeutung der einzelnen Zeilen der Konfiguration

```shell
interface GigabitEthernet 0/1
ip address 192.168.1.1 255.255.255.0
ip nat inside

interface GigabitEthernet 0/0
ip address 141.6266.161 255.255.255.0
ip nat outside
ip nat pool HDM 141.62.66.161 151.62.66.161 prefix-length 24
ip nat inside source list 8 HDM overload
access-list 8 permit 192.168.1.0 0.0.0.255
```

**`interface GigabitEthernet 0/1`**

In den Interface-Konfigurations-Modus des Interfaces `GigabitEthernet 0/1` wechseln, um dieses zu konfigurieren. Dieses Interface ist in unserem Versuch das LAN-Interface.

**`ip address 192.168.1.1 255.255.255.0`**

Dem Router, in dem momentan konfigurierbaren Interface `GigabitEthernet 0/1` die IP `192.168.1.1` mit der Subnetzmaske `255.255.255.0` zuweisen.

**`ip nat inside`**

Verbindet das interface `GigabitEthernet 0/1` mit dem inneren Netzwerk, welches von NAT betroffen ist.

**`interface GigabitEthernet 0/0`**

Wechselt in den Interface-Konfigurations-Modus des Interfaces `GigabitEthernet 0/0`, um dieses zu konfigurieren. Dieses Interface ist in unserem Versuch das WAN-Interface.

**`ip address 141.62.66.161 255.255.255.0`**

Mit diesem Command wird dem Router, in dem momentan konfigurierbaren Interface `GigabitEthernet 0/0`, die IP-Addresse `141.62.66.161` mit der Subnetzmaske `255.255.255.0` zugewiesen.

**`ip nat outside`**

Verbindet das Interface `GigabitEthernet 0/0` mit dem außenstehenden Netzwerk.

**`ip nat pool HDM 141.62.66.161 141.62.66.161 prefix-length 24`**

Definiert einen NAT-Pool mit der Adress-Range von `141.62.66.161` bis `141.62.66.161`, also genau diese Adresse. Zusätzlich ist noch der Netzwerk-Präfix angegeben, der in unserem Beispiel 24 Bit lang ist.

**`ip nat inside source list 8 HDM overload`**

Verändert die Source-IP der Pakete, die von innen nach aussen geleitet werden.
Üebersetzt die Destination-IP der Pakete, die von außen nach innen geleitet werden.

**`access-list 8 permit 192.168.1.0 0.0.0.255`**

Konfiguriert die Access-Control-List, insoweit, dass Pakete der IP 192.168.1.0 weitergeleitet werden dürfen.

### Dokumentieren Sie die Router-Konfiguration und die Routing-Tabelle des Routers und des PCs

Die Konfiguration lässt sich mit `show running-config` anzeigen.

```shell
cisco-gruppe1# show running-config
Building configuration...

Current configuration : 1483 bytes
!
! Last configuration change atstname cisco-gruppe1
!
boot-start-marker
boot-end-marker
!
!
!
no aaa new-model
!
no ipv6 cef
ip source-route
ip cef
!
!
!                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      !   !    r
multilink bundle-name authenticated
!
 --More--  default removal timeout 0
!
!
license udi pid CISCO1941/K9 sn FTX1636824P
 --More--
          !
!
!
!
!                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              shutdown
!
interface GigabitEthernet61 255.255.255.0
 ip nat outside
 ip virtual-reassembly in
 duplex auto
 speed auto
!                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           speed auto
!
ip forward-protocol nd
!
no ip http server
no ip http secure-server
!
ip nat pool HDM 141.62.66.161 141.62.66.161 prefix-length 24
 --Morermit 192.168.1.0 0.0.0.255
!
!
!
control-plane                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       !
line con 0                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              line 2    --
 no activation-character
 no exec
 transport preferred none
 transport input all
 transport output pad telnet rlogin lapb-ta mop udptn v120 ssh
 stopbits 1
line vty 0 4
 password hdm
 login
 transport input all
!
scheduler allocate 20000 1000
end
```

Die Routing-Tabelle des Routers kann mit `show ip route` angezeigt werden.

![Routing-Tabelle des Routers](./static/aufgabe2_show_ip_route.png)

Die Routing Tabelle des Lokalen Computers kann mit `ip route show` angezeigt werden. Zusätzlich nutzen wir `ip a`, um die Netzwerk-Interfaces und deren jeweilige IP-Adressen zu betrachten.

![Routing-Tabelle des Lokalen Computers](./static/aufgabe2_ip_route_show_a.png)

### Experimentieren Sie mit nachfolgenden Befehlen nach Aufruf einer beliebigen Website und dokumentieren Sie Ihre Ergebnisse

Als Erstes wurde unser Router von unserem Lokalen Computer angepingt.

![Ping an unseren Router](./static/aufgabe2_ping_router_cropped.png)

Danach wurde der Router im Rechnernetze-Labor von unserem Router angepingt.

![Ping an Router im Rechnernetze-Labor](./static/aufgabe2_ping_room_router_ping_cropped.png)

Danach haben wir den Google DNS-Server angepingt.

![Ping an den Google DNS-Server](./static/aufgabe2_ping_dns.png)

Von den folgenden Kommandos haben wir vergessen Screenshots zu machen, daher finden sich im Folgenden Bilder aus dem Internet, die die Funktionalität der Kommandos illustrieren sollen. Die Konfiguration unterscheidet sich offensichtlich.

`show ip nat statistics`

![http://blog.soundtraining.net/2013/02/nat-configuration-on-cisco-router-port.html](./static/show_ip_nat_statistics.png)

`show ip nat translation`

![https://www.computernetworkingnotes.com/ccna-study-guide/configure-pat-in-cisco-router-with-examples.html](./static/nat-pat-show-ip-nat-translation-r1.png)

`debug ip nat`

![https://www.google.com/search?q=debug+ip+nat&rlz=1C5CHFA_enDE964DE964&source=lnms&tbm=isch&sa=X&ved=2ahUKEwibntq-84D0AhWE2KQKHWMIBfIQ_AUoAXoECAEQAw&biw=1622&bih=857&dpr=2#imgrc=40zndQOWKiYsiM&imgdii=t1e4jXoag0v3iM](./static/debug_ip_nat.png)

## Internet-Verbindung ohne NAT

### Konfigurieren Sie Ihren Router ohne NAT so, dass vom Subnetz ihrer Wahl eine Internet-Verbindung moeglich ist. Richten Sie dabei jeweils zwei Subnetze ein und stellen Sie zusaetzlich sicher, dass beide Subnetze sich gegenseitig erreichen koennen.

Nach einem Reset des NVRAMs & einem `reload` wurden zwei IP-Addressen und die korrespondierenden Subnetzmasken für die Subnetze zugeordnet:

![Einrichtung beider IP-Addressen](./static/aufgabe3_primary_secondary.png)

Mittels `ip route 141.62.67.1 0.0.0.0 141.62.66.250` wurde nun vom 1. Subnetz eine Internetverbindung über den Laborrouter aufgebaut. Mittels `ping` wurde hier nochmal gechecked, ob dieser auch zu erreichen ist:

![Check der Erreichbarkeit des Laborrouters](./static/aufgabe3_ping_room_router.png)

Um die Kommunikation mit den Subnetzen der Nachbargruppe zu ermöglichen, wurde nun nochmals `ip route` verwendet:

![Einrichtung der Subnetze](./static/aufgabe3_ip_route.png)

Aufgrund von Zeitmangel konnte leider keine weitere Konfiguration vorgenommen werden. Die nächsten Schritt wären gewesen:

1. Einrichten von IP-Addressen und Subnetzmasken auf der Workstation für die beiden Subnetze (`ip addr add` etc.) hinter beiden Routern
2. Test, ob aus dem 1. Subnetz eine Internetverbindung möglich ist (i.e. mittels `ping 8.8.8.8`)
3. Test, ob die Subnetze erreichbar sind, z.B. indem eine IP aus Subnetz 1 der Nachbargruppe mittels unserer Workstation ange`ping`t wird

### Dokumentieren Sie die Konfiguration und auch die Routing-Tabelle des Routers und des PCs

Leider hat es hierzu aufgrund von Zeitmangel nicht mehr gereicht.
