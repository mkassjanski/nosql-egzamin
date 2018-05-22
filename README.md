## Projekt na egzamin z NoSQL




TODO:
-------
- [x] Stworzenie jednej agregacji i analogicznej do niej map reduce
- [x] Stworzenie drugiej agregacji i analogicznej do niej map reduce
- [ ] Stworzenie indeksow
- [ ] Zliczenie czasow na localhost
- [ ] Zliczenie czasow na docker
- [ ] Stworzenie tabelki z czasami
- [ ] README
- [ ] Wnioski


Czasy:
-------
| Operacja | localhost | localhost + indexes |
| --- | --- | --- |
| `pierwsza agregacja` | 7.5526e-05s | 7.0574e-05s |
| `pierwszy map_reduce` | 9.0153e-05s | 9.0157e-05s |
| `druga agregacja` | 8.9196e-05s | 8.8895e-05 |
| `drugi map_reduce` | 4.8962e-05s | 8.7793e-05 |

Rspec
----------

```
$ rspec spec/*
```
