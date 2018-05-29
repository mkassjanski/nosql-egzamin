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
| `pierwsza agregacja` | 7.830s | 6.807s | 6.8475e-05 | 6.8604e-05 |
| `pierwszy map_reduce` | 1m2.955s | 1m3.234s | 8.8391e-05 | 0.000114419 |
| `druga agregacja` | 4.842s | 4.636s| 4.9161e-05| 9.9474e-05 |
| `drugi map_reduce` | 1m38.739s | 1m38.155s| 5.3842e-05 | 9.7165e-0 |

Rspec
----------

```
$ rspec spec/*
```
