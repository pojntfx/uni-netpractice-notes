---
author: [Jakob Waibel, Daniel Hiller, Elia Wüstner, Felix Pojtinger]
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

Uni Network Practice Notes (c) 2021 Jakob Waibel, Daniel Hiller, Elia Wüstner, Felix Pojtinger

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

- Signallaufzeit
- Transferimpedanz
- Impedanz
- Dämpfung
- NEXT

**Erläutern Sie mit wenigen Worten den Begriff der „strukturierten Verkabelung“**

TODO: Bei "strukturierter Verkabelung" handelt es sich um ein Konzept zur anwendungsneutralen Verkabelung in und zwischen Gebäuden.

**Sie finden an einem Patchfeld oder einer Dose folgende Gigabit-Verbindung vor. Warum könnte ein derartiges Kabel Probleme verursachen und welche?**

TODO: Wenn die Paare direkt nebeneinander liegen hebe ich die Verdrillung auf, die notwendig ist damit sich mit Differenzsignalen die eingestreuten Störungen gegenseitig kompensieren.

**Warum müssen eigentlich alle 8 Adern (=4 Paare) angeschlossen sein? (Stichwort: 4D-PAM5)**

TODO: In Ethernet (10 Mbps) und FastEthernet (100 Mbps) werden unterschiedliche Adern Paare für Senden und Empfangen genutzt. Gigabit Ethernet (1000 Mbps) nimmt dagegen ein Paar für Senden und Empfangen, was gleichzeitiges Senden und Empfangen auf einem Paar ermöglicht. Die Bandbreite von 1 Gbps wird durch das komplette Ausnützen aller 8 Adern erreicht.

**Wieso gibt es 2 Standards für die Kontaktierung von achtpoligen RJ-45-Steckern und Buchsen?**

TODO: Der Standard T568A von der Electronic Industries Alliance (EIA) und der Telecommunications Industry Association (TIA) ist an den Farbcodes der europäischen Telefonverkabelung angelehnt und wird daher gerne hier genutzt. In den USA gab es bereits den 258A Standard der weltweit verbreitet war. Die EIA übernahm diesen und nannte ihn um in T568B.

Der Attenuation-Crosstalk-Ratio ist als das Verhältnis von Nutzsignalstärke und Störsignalstärke definiert. Er lässt sich aus der Differenz des NEXT-Wertes und der Dämpfung berechnen, was dem Signal-to-Noise-Ratio entspricht.

**Sollte er hoch oder niedrig sein. Was kann ein ACR-Wert bewirken, der außerhalb der Toleranz liegt.**

Der ACR-Wert sollte so hoch wie möglich sein. Je höher der Wert ist, desto höher ist die Qualität der Übertragungsstrecke. Ein ACR-Wert, der au ss erhalb der Toleranz liegt kann dazu führen, dass das Signal nicht mehr eindeutig vom Rauschen zu unterscheiden ist. Dadurch kann es zu Übertragungsfehlern kommen.

**Welche weiteren Werte können zur Kabelqualifizierung herangezogen werden?**

Wie auch schon auf dem Vorbereitungsmaterial erwähnt, können diverse Werte zur Klassifizierung von Kabeln verwendet werden. Dazu gehören Werte wie Laufzeit, Transferimpedanz, Impedanz, Dämpfung, NEXT-Wert, Attenuation-Crosstalk-Ration und Normen.

**Erläutern Sie mit wenigen Worten den Begriff der „strukturierten Verkabelung“**

Die Strukturierte Verkabelung definiert ein Konzept für die Verkabelung zwischen Gebäuden und wird in EN 50173 definiert. Ursprünglich bezog sich die Norm nur auf Bürogebäude. Sie wurde allerdings um andere Normen erweitert und bezieht sich nun auch auch industrielle Gebäude, Wohnkomplexe und Rechenzentren.

**Sie finden an einem Patchfeld oder einer Dose folgende Gigabit-Verbindung vor. Warum könnte ein derartiges Kabel Probleme verursachen und welche?**

TODO: Add answer

**Warum müssen eigentlich alle 8 Adern (=4 Paare) angeschlossen sein? (Stichwort: 4D-PAM5)**

4D-PAM5 ist ein Pulsamplituden-Modulationsverfahren. Auf jeder der vier Doppeladern wird mit einer Nutzbitrate von 250Mbit/s üebertragen, was zu einer insgesamten Nutzbitrate von 1Gbit führt.
PAM-5 verwendet 5 Amplitudenstufen (1V, 0.5V, 0V, -0.5V, -1.0V). PAM5 wird verwendet, um eine Datenrate von 1Gbit zu ermöglichen.

**Wieso gibt es 2 Standards für die Kontaktierung von achtpoligen RJ-45-Steckern und Buchsen?**

Die Electronic Industries Alliance (EIA) definierte die Standards für die Kontaktierung von achtpoligen RJ-45 Steckern und Buchsen. Da es vor dem TIA-568A-Standard der EIA bereits den populären 258-A-Standard von AT&T gab, wurde bei der Veröffentlichung von TIA-568A der bereits etablierte 258-A-Standard als TIA-568B-Standard veröffentlicht.

## Optische Verkabelung

**Welche Messgrößen sind bei einem optischen Kabel im Vergleich zu den Messgrößen eines elektrischen Kabels sinnvoll?**

TODO:

- Attenuation die den Lichtverlust aufgrund von z.B. Absorption, Biegen und Streuung angibt.
- Chromatische Dispersion. Sie kann gemessen werden in dem man die Dauer misst, wie lange unterschiedliche Wellenlängen benötigen um eine Ader zu durchlaufen
- Reflektionen

**Was ist ein OTDR (zur Qualifizierung optischer Verbindungen)?**

TODO: Mittels dem Optischen Zeitbereichsreflektometrie-Verfahren werden Lauflängen und Reflexionscharakteristika von Elektromagnetischen- und Lichtwellen analysiert.

**Wozu wird es benötigt**

TODO: Wird z.B. verwendet um die Entfernung zu Fehlerstellen an Spleißen und Verbindern zu erfassen.

Ein OTDR ist ein "Optical-Time-Domain-Reflectometer". Das ist ein Werkzeug, um optische Leitungen zu analysieren.

**Wozu wird es benötigt**

Es kann dazu verwendet werden, um Lauflängen und Reflexionscharakteristika von elektromagnetischen Wellen zu analysieren. So können Leitungen auf ihre Funktionalität und Reflexionseigenschaften an Verbindungen oder Kabelenden getestet werden.

## Aufgaben für die „Kabel“-Gruppen

**Schließen Sie eine RJ-45 Anschlussdose an das zur Verfügung gestellte Patchfeld an (kurzes Kabel von der Rolle abschneiden). Am Arbeitsplatz liegt entsprechendes Werkzeug. Lassen Sie sich vom Betreuer u. U. die Funktion des LSA-Werkzeuges erklären.**

Das Kabel stammt von folgender Kabelrolle:

![Kabelrolle](./static/Kabelrolle.jpeg)

TODO: Add result (see pictures from Felix's phone)

**Welche zwei Anschlussmöglichkeiten (lt. Norm) haben sie für den Anschluss einer Dose?**

Laut Norm gibt es den EIA/TIA-568A-Standard und den EIA/TIA-568B-Standard. Letzterer beschreibt den Standard, welcher von AT&T etabliert worden ist.

Die Unterschiede der beiden Standards lassen sich in folgender Tabelle erkennen.

| Pin | TIA/EIA-568A | TIA/EIA-568B |
| --- | ------------ | ------------ |
| 1   | weiß\grün    | weiß\orange  |
| 2   | grün         | orange       |
| 3   | weiß\orange  | weiß\grün    |
| 4   | blau         | blau         |
| 5   | weiß         | weiß/blau    |
| 6   | orange       | grün         |
| 7   | weiß\braun   | weiß/braun   |
| 8   | braun        | braun        |

**Wie lang darf die unverdrillte Kabelstrecke sein?**

TODO: Sie muss möglichst kurz sein (max. ca. 1,5 cm) damit die Auswirkungen von Nahnebensprechen nicht überhandnehmen.

**Überprüfen Sie mittels JPerf, wie hoch die Datenrate ihrer Verbindung ist.**

Wir haben mit JPerf die Verbindung zu einem anderen Host im Rechnernetze-Labor gemessen.

![iperf server](./static/iperfserv.png)

![iperf client](./static/iperfclient.png)

Aus den Bildern lässt sich entnehmen, dass bei einem Transfer von einem Gigabyte eine Datenrate von 856 Mbits/s gemessen werden konnte.

**Weisen Sie die Qualität Ihrer Strecke messtechnisch mit dem CM 200 und dem Fluke DTX 1200 nach und dokumentieren Sie die Ergebnisse. (Benutzen Sie nicht die beigelegten kurzen blauen Kabel)**

TODO: Add result (see pictures on Felix's phone from CM 200 and Fluke)

Fluke DTX 1200:

Das Fluke-Setup sah folgendermaßen aus:

![Fluke Setup](./static/fluke-setup.jpeg)

Das Gerät zeigt uns an, dass wir am Patch-Feld aus Versehen den falschen Standard verwendet haben, um die Kabel anzuschließen. Das stellt aber keine weiteren Probleme dar. Eine Internetverbindung war auch so ohne Probleme möglich. Im folgenden Bild kann der Fehler betrachtet werden:

![Verschiedene Standards verwendet](./static/verschiedene-standards.jpeg)

Das Problem ist daher aufgetreten, dass am Patchfeld beide Standards verzeichnet sind, jedoch dies erst im Nachhinein bemerkt wurde und einer der beiden verwendet wurde.

![Standards am Patchfeld](./static/zwei-standards.jpeg)

Des weiteren wurde ein hoher NEXT-Wert gemeldet, was an eventuell zu weit geöffneten Verdrillungen und der daher resultierenden fehlenden Abschirmung liegen könnte.

![Hoher NEXT-Wert](./static/hohes-next-am-nahen-ende.jpeg)

**Welche Aussage können Sie bezüglich CAT5 und CAT6 machen? (Messtechniker-Gruppe ist hier gefragt; lassen sie sich ihre Ergebnisse auf dem Fluke DTX 1200 speichern)**

Die Messtechniker-Gruppe stellte uns folgende Ergebnisse bereit:

![Cat5e](./static/cat5e.png)

![Cat6](./static/cat6.png)

TODO: Stimmt die interpretation?

Es scheint, als wäre das CAT5e-Kabel besser als das CAT6-Kabel. Dies sollte aber eigentlich nicht der Fall sein. Laut unseren Vorbereitungsunterlagen sollte das Cat6-Kabel sowohl eine geringere Dämpfung, als auch einen höheren NEXT-Wert als das Cat5e-Kabel vorweisen.

**Versuchen Sie Ihr hoffentlich gut angeschlossenes Kabel so zu „bearbeiten“ (Quetschen, Pressen, Biegeradius verringern), daß Sie signifikant eine Änderung der Messqualität erreichen. Bitte systematisch und dokumentiert!**

Im ersten Durchgang knickten wir das Kabel sehr stark. Dies beinflusste die Ergebnisse allerdings gar nicht.

![Knick im Kabel](./static/knick.jpeg)

Im zweiten Durchgang schnitten wir mit dem Seitenschneider in das Kabel und durchtrenten eine Ader. Dies lies sich dann an der Fluke-Analyse erkennen.

![Ergebnis nach dem durchschneiden einer Ader](./static/kabel-seitenschneider.jpeg)

**Was versteht man unter „CableSharing“? Realisieren Sie solch eine Verbindung (Patchfeld -> Dose) und dokumentieren Sie Ihre Messergebnisse!**

Unter CableSharing versteht man, dass sich zwei Buchsen an der Dose und zwei anschlüsse am Pathfeld ein einzelnes Kabel teilen. Dadurch ist allerdings nur eine maximale Datenrate von 100Mbit/s möglich. Dies konnte auch unter verwendung von `iperf` bestätigt werden. Es wurden beide Buchsen getestet:

![Test der ersten Buchse](./static/erste-buchse-cable-sharing.png)

![Test der zweiten Buchse](./static/zweite-buchse-cable-sharing.png)

Misst man das CableSharing-Setup mit dem Fluke-Messgerät fällt auf, dass die Messung fehlschlägt. Dies liegt daran, dass das Fluke-Messgerät nicht für das testen von CableSharing ausgelegt ist. Wir erhalten lediglich die Meldung, dass nicht alle Adern verbunden sind.

![Fluke Messung](./static/Fluke.jpeg)

TODO: Add result (see screenshots and pictures from Felix's phone (Misswire) and PDF: We first tried to connect it differently, so there are multiple versions) and interpretation

**Warum kann man mit CableSharing keine Gigabit-Anbindung realisieren?**

TODO: Bei Cable-Sharing werden ungenutzte Adern für eine zweite Netzwerkverbindung verwendet. Gigabit-Ethernet benötigt aber alleine schon alle acht Adern.

**Ihnen stehen 3 blaue Kabel zur Verfügung, die unterschiedliche Fehler aufweisen. Messen sie diese Kabel mit ihrem CM200-Messgerät durch. Dokumentieren Sie die Messergebnisse**

TODO: Add answer (see pictures from Felix's phone: 1: 1 & 2 blinked, 2: 7 & 8 blinked, 3: 6 & 2 blinked and PDF)

**Können Sie bei Verwendung von Kabel 2 mittels JPerf die Übertragungsrate messen?**

Ja, dies war trotz dem Fehler `short` möglich, wie im folgenden Bild zu sehen ist:

![iperf client](./static/kabel-2-iperf-client.png)

**Messen Sie mit ihrem CM200-Messgerät folgende Strecken und dokumentieren Sie die Ergebnisse. Grosser Systemschrank: 1-05 zu 1-06 (Fragen Sie nach den Messergebnissen der „Messtechnikern“-Gruppe und vergleichen sie mit Ihren Ergebnissen)**

TODO: Add result (see pictures from Felix's phone (Misswire) and PDF) and interpretation

![Ergebnisse der Messtechniker](./static/1.05-1.06.png)

**Grosser Systemschrank: 1-07 zu 1-08 (Fragen Sie nach den Messergebnissen der „Messtechnikern“-Gruppe und vergleichen sie mit Ihren Ergebnissen)**

TODO: Add result (see pictures from Felix's phone (Pass, but with blinking C) and PDF) and interpretation

![Ergebnisse der Messtechniker](./static/1.07-1.08.png)

**Kleiner Systemschrank: 2-13 zu 2-14 (Fragen Sie nach den Messergebnissen der „Messtechnikern“-Gruppe und vergleichen sie mit Ihren Ergebnissen)**

TODO: Add result (see pictures from Felix's phone (Open, but with blinking 3,4,5,6) and PDF) and interpretation

![Ergebnisse der Messtechniker](./static/2.13-2.14.png)
