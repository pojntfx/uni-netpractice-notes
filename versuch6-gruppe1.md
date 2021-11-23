-   [<span class="toc-section-number">0.1</span>
    Einführung](#einführung)
    -   [<span class="toc-section-number">0.1.1</span>
        Mitwirken](#mitwirken)
    -   [<span class="toc-section-number">0.1.2</span> Lizenz](#lizenz)
-   [<span class="toc-section-number">0.2</span> Elektrische
    Verkabelung](#elektrische-verkabelung)
-   [<span class="toc-section-number">0.3</span> Optische
    Verkabelung](#optische-verkabelung)
-   [<span class="toc-section-number">0.4</span> Aufgaben für die
    „Kabel“-Gruppen](#aufgaben-für-die-kabel-gruppen)

Protokoll zu Versuch 6 (Verkabelung) von Gruppe 1

Jakob Waibel

Daniel Hiller

Elia Wüstner

Felix Pojtinger

2021-11-16

## Einführung

### Mitwirken

Diese Materialien basieren auf [Professor Kiefers “Praktikum
Rechnernetze”-Vorlesung der HdM
Stuttgart](https://www.hdm-stuttgart.de/vorlesung_detail?vorlid=j212254).

**Sie haben einen Fehler gefunden oder haben einen
Verbesserungsvorschlag?** Bitte eröffnen Sie ein Issue auf GitHub
([github.com/pojntfx/uni-netpractice-notes](https://github.com/pojntfx/uni-netpractice-notes)):

<figure>
<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAZoAAAGaAQAAAAAefbjOAAADC0lEQVR4nO2bwY3bMBBF30QCfKSBLcClSB2kpNSUDqRSXEAA8WiAws+BpCQ7uQTeaL2r0U2UHkzCgz8zn5SJf77Gb//OgEMOOeSQQw459DUhK1cLMJvZuY71zAaxvtB/yPQc2h/qJEkTQDwJopmGIJVbGkmS7qH9pufQ/lAsAmB9uBkEyfpoxnguL1QF+ZjpOfSBUDyJ7tpCpwTdBNb/n19y6BWh9q+j4+VmGq0R4xkT8R1+yaHPAdWICILyx88mmDEA6wTW/YStk/Xia3LoHaDRLHcYQCPr40l0E0Bc+g8z+6jpObS3RjxY2SLOOVdovNxMjy+8+JocegYid5VZD2hqCxoSGoIkKVHGaguq4cXX5NAzEKvPIClVZ2KNklAiQgOUpx4RB4A6JUrNEFssO5U00hBPMrtI9mOqYfFJ1uTQc91nIyOkVnAzEc9ASECYoBtg9apefk0OPQNRcsQE0tQINtXDWlZIJX941vjqUK0slaiiUJzKHAfdEhsDeB1xAOiuslw1YmqkIazB0ORC0zXi60OLRix68NhrKMuDBu8+DwHda8TSTdDoLn8kahLxiDgElMNivJQ6olpSwHhJSNcWDdF3w48A1dIgpOpBTU21rIPyYZksFF5HHAOqWSPb1mlJIktYUGrMPOZZ4yhQd22BeJL1sV387PsTM+Hme58HgBaNUJWCv7kQ2atyjTgCdL/3uTSZE9SOVCq7oJPXEUeA1n2NxPh9wjrNJgAR35JGaxJEQ2PfpN2n59Du0OP5iNXKrsqwbT1cI74+tDEpV/eyXBO5/yj5w+uIQ0A5a9Qmokkaz7+Wk3ZNsm6agfiWKEdy952eQ7tDbJWh7nRtHgBFI5Yx14hDQPWbLrqr5eNTm0/9RjODkMivfJY1OfRukIZwM+uDZD+m2YpHcfV9jSNAf3zTNV5SS3c9ifH8qxXxTbn73BzRf/E1OfQM9PhNl2DOI9ZdWwya/NTA/YgjQNsCcrvP2ehhX1ySn7M8AvT4TVdNDgnlu7A+W7yqF1+TQw455JBDDjm0D/QbWaSEhCo1bbkAAAAASUVORK5CYII=" width="150" alt="QR-Code zum Quelltext auf GitHub" /><figcaption aria-hidden="true">QR-Code zum Quelltext auf GitHub</figcaption>
</figure>

Wenn ihnen die Materialien gefallen, würden wir uns über einen
GitHub-Stern sehr freuen.

### Lizenz

Dieses Dokument und der enthaltene Quelltext ist freie Kultur bzw. freie
Software.

<figure>
<img src="data:image/png;base64,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" width="128" alt="Badge der AGPL-3.0-Lizenz" /><figcaption aria-hidden="true">Badge der AGPL-3.0-Lizenz</figcaption>
</figure>

Uni Network Practice Notes (c) 2021 Jakob Waibel, Daniel Hiller, Elia
Wüstner, Felix Pojtinger

SPDX-License-Identifier: AGPL-3.0

## Elektrische Verkabelung

**Die wichtigsten technischen Größen eines Kabels sind die Werte für die
Impedanz, die Dämpfung, für das Nebensprechen und das sich daraus zu
errechnende ACR.**

TODO: Add answer

**Wie ist der ACR-Wert definiert?**

TODO: Add answer

**Sollte er hoch oder niedrig sein. Was kann ein ACR-Wert bewirken, der
außerhalb der Toleranz liegt.**

TODO: Add answer

**Welche weiteren Werte können zur Kabelqualifizierung herangezogen
werden?**

TODO: Add answer

**Erläutern Sie mit wenigen Worten den Begriff der „strukturierten
Verkabelung“**

TODO: Add answer

**Sie finden an einem Patchfeld oder einer Dose folgende
Gigabit-Verbindung vor. Warum könnte ein derartiges Kabel Probleme
verursachen und welche?**

TODO: Add answer (has something to do with twisted pairs)

**Warum müssen eigentlich alle 8 Adern (=4 Paare) angeschlossen sein?
(Stichwort: 4D-PAM5)**

TODO: Add answer

**Wieso gibt es 2 Standards für die Kontaktierung von achtpoligen
RJ-45-Steckern und Buchsen?**

TODO: Add answer

## Optische Verkabelung

**Welche Messgrößen sind bei einem optischen Kabel im Vergleich zu den
Messgrößen eines elektrischen Kabels sinnvoll?**

TODO: Add answer

**Was ist ein OTDR (zur Qualifizierung optischer Verbindungen)?**

TODO: Add answer

**Wozu wird es benötigt**

TODO: Add answer

## Aufgaben für die „Kabel“-Gruppen

**Schließen Sie eine RJ-45 Anschlussdose an das zur Verfügung gestellte
Patchfeld an (kurzes Kabel von der Rolle abschneiden). Am Arbeitsplatz
liegt entsprechendes Werkzeug. Lassen Sie sich vom Betreuer u. U. die
Funktion des LSA-Werkzeuges erklären.**

TODO: Add result (see pictures from Felix’s phone)

**Welche zwei Anschlussmöglichkeiten (lt. Norm) haben sie für den
Anschluss einer Dose?**

TODO: Add answer

**Wie lang darf die unverdrillte Kabelstrecke sein?**

TODO: Add answer

**Überprüfen Sie mittels JPerf, wie hoch die Datenrate ihrer Verbindung
ist.**

TODO: Add result (see screenshots)

**Weisen Sie die Qualität Ihrer Strecke messtechnisch mit dem CM 200 und
dem Fluke DTX 1200 nach und dokumentieren Sie die Ergebnisse. (Benutzen
Sie nicht die beigelegten kurzen blauen Kabel)**

TODO: Add result (see pictures on Felix’s phone from CM 200 and Fluke)

**Welche Aussage können Sie bezüglich CAT5 und CAT6 machen?
(Messtechniker-Gruppe ist hier gefragt; lassen sie sich ihre Ergebnisse
auf dem Fluke DTX 1200 speichern)**

TODO: Add result (see PDF)

**Versuchen Sie Ihr hoffentlich gut angeschlossenes Kabel so zu
„bearbeiten“ (Quetschen, Pressen, Biegeradius verringern), daß Sie
signifikant eine Änderung der Messqualität erreichen. Bitte systematisch
und dokumentiert!**

TODO: Add result (see pictures from Jakob’s phone)

**Was versteht man unter „CableSharing“? Realisieren Sie solch eine
Verbindung (Patchfeld -&gt; Dose) und dokumentieren Sie Ihre
Messergebnisse!**

Connection:

``` plaintext
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

TODO: Add result (see screenshots and pictures from Felix’s phone
(Misswire) and PDF: We first tried to connect it differently, so there
are multiple versions)

**Warum kann man mit CableSharing keine Gigabit-Anbindung realisieren?**

TODO: Add answer

**Ihnen stehen 3 blaue Kabel zur Verfügung, die unterschiedliche Fehler
aufweisen. Messen sie diese Kabel mit ihrem CM200-Messgerät durch.
Dokumentieren Sie die Messergebnisse**

TODO: Add answer (see pictures from Felix’s phone: 1: 1 & 2 blinked, 2:
7 & 8 blinked, 3: 6 & 2 blinked and PDF)

**Können Sie bei Verwendung von Kabel 2 mittels JPerf die
Übertragungsrate messen?**

TODO: Add result (see screenshot)

**Messen Sie mit ihrem CM200-Messgerät folgende Strecken und
dokumentieren Sie die Ergebnisse. Grosser Systemschrank: 1-05 zu 1-06
(Fragen Sie nach den Messergebnissen der „Messtechnikern“-Gruppe und
vergleichen sie mit Ihren Ergebnissen)**

TODO: Add result (see pictures from Felix’s phone (Misswire) and PDF)

**Grosser Systemschrank: 1-07 zu 1-08 (Fragen Sie nach den
Messergebnissen der „Messtechnikern“-Gruppe und vergleichen sie mit
Ihren Ergebnissen)**

TODO: Add result (see pictures from Felix’s phone (Pass, but with
blinking C) and PDF)

**Kleiner Systemschrank: 2-13 zu 2-14 (Fragen Sie nach den
Messergebnissen der „Messtechnikern“-Gruppe und vergleichen sie mit
Ihren Ergebnissen)**

TODO: Add result (see pictures from Felix’s phone (Open, but with
blinking 3,4,5,6) and PDF)
