## Projekt na egzamin z NoSQL

Skład grupy:
-------
- Krzysztof Łozowski
- Michał Kassjański
- Michał Kisielewski


Opis projektu
-------
Projekt został napisany w Ruby i korzysta z [Ruby MongoDB Driver](https://docs.mongodb.com/ruby-driver/master/).

Opis agregacji
-------
1. **bin/agg1.rb**

Skrypt zwraca procentowe statystyki wybranego powodu zgłoszenia w dzielnicach.
```
$ ./agg3.rb -d <description>
```
W przypadku nie podania parametru, skrypt wybierze powod "911/NO  VOICE".

Została napisany analogiczny map_reduce w pliku **bin/mr1.rb**.

Przykładowy wynik agregracji i map_reduce:
![alt text](https://i.imgur.com/1HyHiKN.png "Logo Title Text 1")


TODO:
-------
- [x] Stworzenie jednej agregacji i analogicznej do niej map reduce
- [x] Stworzenie drugiej agregacji i analogicznej do niej map reduce
- [x] Stworzenie indeksow
- [x] Zliczenie czasow na localhost
- [x] Zliczenie czasow na docker
- [x] Stworzenie tabelki z czasami
- [ ] README
- [ ] Wnioski


Czasy:
-------
| Operacja | localhost | localhost + indexes | docker | docker + indexes |
| --- | --- | --- | --- | --- |
| `pierwsza agregacja` | 7.830s | 6.807s | 8.636s | 6.753s |
| `pierwszy map_reduce` | 1m2.955s | 1m3.234s | 1m4.780s | 1m4.109s |
| `druga agregacja` | 4.842s | 4.636s| 4.898s| 4.693s |
| `drugi map_reduce` | 1m38.739s | 1m38.155s| 1m30.852s | 1m32.020s |

Rspec
----------

```
$ rspec spec/*
```
