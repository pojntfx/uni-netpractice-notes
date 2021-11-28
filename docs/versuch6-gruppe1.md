---
author: [Jakob Waibel, Daniel Hiller, Elia Wüstner, Felicitas Pojtinger]
date: "2021-11-16"
subject: "Praktikum Rechnernetze: Protokoll zu Versuch 6 (Verkabelung) von Gruppe 1"
keywords: [Rechnernetze, Protokoll, Versuch, HdM Stuttgart]
subtitle: "Protokoll zu Versuch 6 (Verkabelung) von Gruppe 1"
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

## Elektrische Verkabelung

**Die wichtigsten technischen Größen eines Kabels sind die Werte für die Impedanz, die Dämpfung, für das Nebensprechen und das sich daraus zu errechnende ACR.**

**Wie ist der ACR-Wert definiert?**

TODO: Der ACR-Wert ist die Differenz aus dem NEXT-Wert und der Dämpfung. Damit gibt er das Verhältnis zwischen Nutzsignalstärke und Störsignalstärke an, was auch Signalrauschabstand genannt wird.

**Sollte er hoch oder niedrig sein. Was kann ein ACR-Wert bewirken, der außerhalb der Toleranz liegt.**

TODO: Der ACR-Wert sollte möglichst hoch sein. Ein zu niedriger ACR-Wert kann zu Bitfehlern führen.

**Welche weiteren Werte können zur Kabelqualifizierung herangezogen werden?**

TODO: 
* Signallaufzeit
* Transferimpedanz
* Impedanz
* Dämpfung
* NEXT

**Erläutern Sie mit wenigen Worten den Begriff der „strukturierten Verkabelung“**

TODO: Bei "strukturierter Verkabelung" handelt es sich um ein Konzept zur anwendungsneutralen Verkabelung in und zwischen Gebäuden.


**Sie finden an einem Patchfeld oder einer Dose folgende Gigabit-Verbindung vor. Warum könnte ein derartiges Kabel Probleme verursachen und welche?**

TODO: Wenn die Paare direkt nebeneinander liegen hebe ich die Verdrillung auf, die notwendig ist damit sich mit Differenzsignalen die eingestreuten Störungen gegenseitig kompensieren.

**Warum müssen eigentlich alle 8 Adern (=4 Paare) angeschlossen sein? (Stichwort: 4D-PAM5)**

TODO: In Ethernet (10 Mbps) und FastEthernet (100 Mbps) werden unterschiedliche Adern Paare für Senden und Empfangen genutzt. Gigabit Ethernet (1000 Mbps) nimmt dagegen ein Paar für Senden und Empfangen, was gleichzeitiges Senden und Empfangen auf einem Paar ermöglicht. Die Bandbreite von 1 Gbps wird durch das komplette Ausnützen aller 8 Adern erreicht.

**Wieso gibt es 2 Standards für die Kontaktierung von achtpoligen RJ-45-Steckern und Buchsen?**

TODO: Der Standard T568A von der Electronic Industries Alliance (EIA) und der Telecommunications Industry Association (TIA) ist an den Farbcodes der europäischen Telefonverkabelung angelehnt und wird daher gerne hier genutzt. In den USA gab es bereits den 258A Standard der weltweit verbreitet war. Die EIA übernahm diesen und nannte ihn um in T568B.

## Optische Verkabelung

**Welche Messgrößen sind bei einem optischen Kabel im Vergleich zu den Messgrößen eines elektrischen Kabels sinnvoll?**

TODO: 
* Attenuation die den Lichtverlust aufgrund von z.B. Absorption, Biegen und Streuung angibt.
* Chromatische Dispersion. Sie kann gemessen werden in dem man die Dauer misst, wie lange unterschiedliche Wellenlängen benötigen um eine Ader zu durchlaufen
* Reflektionen


**Was ist ein OTDR (zur Qualifizierung optischer Verbindungen)?**

TODO: Mittels dem Optischen Zeitbereichsreflektometrie-Verfahren werden Lauflängen und Reflexionscharakteristika von Elektromagnetischen- und Lichtwellen analysiert. 

**Wozu wird es benötigt**

TODO: Wird z.B. verwendet um die Entfernung zu Fehlerstellen an Spleißen und Verbindern zu erfassen.

## Aufgaben für die „Kabel“-Gruppen

**Schließen Sie eine RJ-45 Anschlussdose an das zur Verfügung gestellte Patchfeld an (kurzes Kabel von der Rolle abschneiden). Am Arbeitsplatz liegt entsprechendes Werkzeug. Lassen Sie sich vom Betreuer u. U. die Funktion des LSA-Werkzeuges erklären.**

TODO: Add result (see pictures from Felicitas's phone)

**Welche zwei Anschlussmöglichkeiten (lt. Norm) haben sie für den Anschluss einer Dose?**

TODO: Add answer

**Wie lang darf die unverdrillte Kabelstrecke sein?**

TODO: Sie muss möglichst kurz sein (max. ca. 1,5 cm) damit die Auswirkungen von Nahnebensprechen nicht überhandnehmen.

**Überprüfen Sie mittels JPerf, wie hoch die Datenrate ihrer Verbindung ist.**

TODO: Add result (see screenshots)

**Weisen Sie die Qualität Ihrer Strecke messtechnisch mit dem CM 200 und dem Fluke DTX 1200 nach und dokumentieren Sie die Ergebnisse. (Benutzen Sie nicht die beigelegten kurzen blauen Kabel)**

TODO: Add result (see pictures on Felicitas's phone from CM 200 and Fluke)

**Welche Aussage können Sie bezüglich CAT5 und CAT6 machen? (Messtechniker-Gruppe ist hier gefragt; lassen sie sich ihre Ergebnisse auf dem Fluke DTX 1200 speichern)**

TODO: Add result (see PDF)

**Versuchen Sie Ihr hoffentlich gut angeschlossenes Kabel so zu „bearbeiten“ (Quetschen, Pressen, Biegeradius verringern), daß Sie signifikant eine Änderung der Messqualität erreichen. Bitte systematisch und dokumentiert!**

TODO: Add result (see pictures from Jakob's phone)

**Was versteht man unter „CableSharing“? Realisieren Sie solch eine Verbindung (Patchfeld -> Dose) und dokumentieren Sie Ihre Messergebnisse!**

Connection:

```plaintext
Dose 1:
1-4
2-5
3-7
6-8

Dose 2:
1-1
2-2
3-3
6-6
```

TODO: Add result (see screenshots and pictures from Felicitas's phone (Misswire) and PDF: We first tried to connect it differently, so there are multiple versions)

**Warum kann man mit CableSharing keine Gigabit-Anbindung realisieren?**

TODO: Bei Cable-Sharing werden ungenutzte Adern für eine zweite Netzwerkverbindung verwendet. Gigabit-Ethernet benötigt aber alleine schon alle acht Adern.

**Ihnen stehen 3 blaue Kabel zur Verfügung, die unterschiedliche Fehler aufweisen. Messen sie diese Kabel mit ihrem CM200-Messgerät durch. Dokumentieren Sie die Messergebnisse**

TODO: Add answer (see pictures from Felicitas's phone: 1: 1 & 2 blinked, 2: 7 & 8 blinked, 3: 6 & 2 blinked and PDF)

**Können Sie bei Verwendung von Kabel 2 mittels JPerf die Übertragungsrate messen?**

TODO: Add result (see screenshot)

**Messen Sie mit ihrem CM200-Messgerät folgende Strecken und dokumentieren Sie die Ergebnisse. Grosser Systemschrank: 1-05 zu 1-06 (Fragen Sie nach den Messergebnissen der „Messtechnikern“-Gruppe und vergleichen sie mit Ihren Ergebnissen)**

TODO: Add result (see pictures from Felicitas's phone (Misswire) and PDF)

**Grosser Systemschrank: 1-07 zu 1-08 (Fragen Sie nach den Messergebnissen der „Messtechnikern“-Gruppe und vergleichen sie mit Ihren Ergebnissen)**

TODO: Add result (see pictures from Felicitas's phone (Pass, but with blinking C) and PDF)

**Kleiner Systemschrank: 2-13 zu 2-14 (Fragen Sie nach den Messergebnissen der „Messtechnikern“-Gruppe und vergleichen sie mit Ihren Ergebnissen)**

TODO: Add result (see pictures from Felicitas's phone (Open, but with blinking 3,4,5,6) and PDF)
