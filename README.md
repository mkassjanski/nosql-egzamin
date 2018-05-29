## Projekt na egzamin z NoSQL

Skład grupy:
-------
- Krzysztof Łozowski
- Michał Kassjański
- Michał Kisielewski


Informacje o zbiorze danych (w KB):
```js
db.alarms.stats( { scale : 1024 } )
{
	"ns" : "test.alarms",
	"count" : 2799916,
	"size" : 730929,
	"avgObjSize" : 267,
	"storageSize" : 218156,
	 ...
}
```

Struktura bazy:
```js
db.alarms.findOne()
{
	"_id" : ObjectId("5ac48f79f6968ccc1f0274f1"),
	"" : 1,
	"callDateTime" : "2015-07-13 10:47:00",
	"priority" : "Medium",
	"district" : "CD",
	"description" : "911/NO  VOICE",
	"callNumber" : "P151941003",
	"incidentLocation" : "600 E FAYETTE ST",
	"location" : "(39.2906737,-76.6071600)"
}
```
Opis projektu
-------
Projekt został napisany w Ruby i korzysta z [Ruby MongoDB Driver](https://docs.mongodb.com/ruby-driver/master/).
Cały obraz maszyny, wraz z projektem i bazą danych można pobrać za pomocą dockera:
```
docker pull mkassjanski/nosql
```

Opis agregacji 1
-------
1. **bin/agg1.rb**

Skrypt zwraca procentowe statystyki wybranego powodu zgłoszenia w dzielnicach.
```
$ ./agg1.rb -d <description>
```
W przypadku nie podania parametru, skrypt wybierze powod "911/NO  VOICE".

Została napisany analogiczny map_reduce w pliku **bin/mr1.rb**.

Przykładowy wynik agregracji i map_reduce:
![alt text](https://raw.githubusercontent.com/mkassjanski/nosql-egzamin/master/image.png "Logo Title Text 1")

Opis agregacji 2
-------
1. **bin/agg2.rb**

Skrypt zwraca zaliczone powody w alarmach.
```
$ ./agg2.rb -l <limit>
```
W przypadku nie podania parametru, skrypt wybierze limit równy 10.

Została napisany analogiczny map_reduce w pliku **bin/mr2.rb**.
Przykładowy wynik agregacji:
<table>
  <tr>
    <th>_id</th>
    <th>count</th>
  </tr>
  <tr>
    <td>911/NO  VOICE</td>
    <td>457475</td>
  </tr>
  <tr>
    <td>DISORDERLY</td>
    <td>238913</td>
  </tr>
  <tr>
    <td>Traffic Stop</td>
    <td>167911</td>
  </tr>
  <tr>
    <td>COMMON ASSAULT</td>
    <td>119659</td>
  </tr>
  <tr>
    <td>AUTO ACCIDENT</td>
    <td>109821</td>
  </tr>
  <tr>
    <td>NARCOTICSOutside</td>
    <td>95939</td>
  </tr>
  <tr>
    <td>SILENT ALARM</td>
    <td>78706</td>
  </tr>
  <tr>
    <td>FAMILY DISTURB</td>
    <td>68354</td>
  </tr>
  <tr>
    <td>Repairs/Service</td>
    <td>67050</td>
  </tr>
  <tr>
    <td>OTHER</td>
    <td>61879</td>
  </tr>
</table>
<to_s/>

Wnioski:
-------
- agregacje i map_reduce wykonywane na localhost wykanują się szybciej niż na dockerze,
- dodanie odpowiednich indesków powoduje przyspieszenie wykonywania agregracji,
- według naszych obserwacji indeksy nie wpływaja tak mocno na map_reduce jak na agregracje.
- map_readuce wykonują sie znaczenie dłużej niż agregację, podejrzewamy, że chodzi o wykorzystanie polecanie find().


TODO:
-------
- [x] Stworzenie jednej agregacji i analogicznej do niej map reduce
- [x] Stworzenie drugiej agregacji i analogicznej do niej map reduce
- [x] Stworzenie indeksow
- [x] Zliczenie czasow na localhost
- [x] Zliczenie czasow na docker
- [x] Stworzenie tabelki z czasami
- [x] README
- [x] Wnioski


Czasy:
-------
| Operacja | localhost | localhost + indexes | docker | docker + indexes |
| --- | --- | --- | --- | --- |
| I agregacja | 7.830s | 6.807s | 8.636s | 7.153s |
| I map_reduce | 31.531s | 31.529s | 34.830s | 34.824s |
| II agregacja | 4.842s | 4.636s | 4.898s| 4.693s |
| II map_reduce | 28.531s | 28.155s| 30.852s | 29.920s |

Rspec
----------

```
$ rspec spec/*
```
