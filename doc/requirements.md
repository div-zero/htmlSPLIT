# htmlSPLIT: Requirements

> per eMail / 2020-09-27
>
> ...
>
> auf der Suche nach einem Programm, mit dem ich eine Text-Datei in mehrere Text-Dateien aufteilen kann, bin ich auf Ihr Programm fileSPLIT gestoßen. Von der Bedienung her wäre es ein sehr gut und einfach zu bedienenden Programm – nur: es ist leider nicht das, was ich suche. „Meine“ Text-Dateien müssen nach anderen Kriterien aufgespalten werden.
> Haben Sie Lust (und Zeit) ein „fileSPLITplus“ zu schreiben? Ich würde ein Programm, das die im Folgenden beschriebene Aufgabe erledigt, benötigen, kann aber selbst nicht programmieren und scheue mich sehr, den sonst empfohlenen Lösungsweg über Installation eine Subsystem Linux und dann mit Skripten arbeiten. Vielleicht ist ein solches Programm zu schreiben, für Sie nicht mehr, als eine Aufwärmübung ;-)
>
> ...

## Anforderungen:

1.	Die Gesamtdatei anbei enthält mehrere Datensätze, formatiert in HTML und getrennt durch eine Leerzeile (alternativ könnte anstelle der Leerzeile auch %%% oder etwas anderes stehen, wenn dies erforderlich wäre). Innerhalb der Datensätze sind keine Leerzeilen enthalten. Die Gesamtdatei soll anhand der Leerzeilen in mehreren Dateien aufgespalten werden.
2.	Umlaute, ß, é, è usw. müssen beibehalten werden.
3.	Die Zeilen müssen beibehalten werden (keine Zeilen vereinen oder teilen).
4.	Die erstellten Dateien sollen mit einer durchlaufenden Nummer benannt werden
5.	Wenn möglich sollten die erstellten Dateien als *.html gespeichert werden (alternativ als *.txt, die Umwandlung in *.html könnte ich dann selbst mit einem anderen Programm machen).

Die Gesamtdatei soll, so zumindest der Plan, regelmäßig erstellt werden. Leider kann ich die Datensätze nicht einzeln ausgeben. Da die Gesamtdatei irgendwann hunderte Datensätze enthält, ist eine manuelle Aufspaltung nicht möglich.

