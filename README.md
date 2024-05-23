**Zadanie 1** Paradygmaty

:white_check_mark: Procedura do generowania 50 losowych liczb od 0 do 100

:white_check_mark: Procedura do sortowania liczb

:white_check_mark: Dodanie parametrów do procedury losującej określającymi zakres losowania: od, do, ile

:white_check_mark: 5 testów jednostkowych testujące procedury

:white_check_mark: Skrypt w bashu do uruchamiania aplikacji w Pascalu via docker

Kod: [lab1](https://github.com/cr0ow/Object-Oriented-Design-2024/tree/master/lab1)

Demo: [lab1-demo.zip](https://github.com/cr0ow/Object-Oriented-Design-2024/tree/master/demos)

**Zadanie 2** Wzorce architektury

:white_check_mark: Należy stworzyć jeden model z kontrolerem z produktami, zgodnie z CRUD

:white_check_mark: Należy stworzyć skrypty do testów endpointów via curl

:white_check_mark: Należy stworzyć dwa dodatkowe kontrolery wraz z modelami

:white_check_mark: Należy stworzyć widoki do wszystkich kontrolerów

:x: Stworzenie panelu administracyjnego z mockowanym logowaniem

Kod: [lab2](https://github.com/cr0ow/Object-Oriented-Design-2024/tree/master/lab1)

Demo: [lab2-mw-projobj](https://github.com/cr0ow/Object-Oriented-Design-2024/tree/master/demos)

**Zadanie 3** Wzorce kreacyjne

:white_check_mark: Należy stworzyć jeden kontroler wraz z danymi wyświetlanymi z listy na endpoint’cie w formacie JSON - Kotlin + Spring Boot

:white_check_mark: Należy stworzyć klasę do autoryzacji (mock) jako Singleton w formie eager

:white_check_mark: Należy obsłużyć dane autoryzacji przekazywane przez użytkownika

:white_check_mark: Należy wstrzyknąć singleton do głównej klasy via @Autowired

:white_check_mark: Obok wersji Eager do wyboru powinna być wersja Singletona w wersji lazy

Kod: [lab3](https://github.com/cr0ow/Object-Oriented-Design-2024/tree/master/lab3)

Demo: [lab3-demo](https://github.com/cr0ow/Object-Oriented-Design-2024/assets/70718059/111ba521-069d-419e-b6a1-5da06e8e13f1)

**Zadanie 4** Wzorce strukturalne

:white_check_mark: Należy stworzyć aplikację we frameworki echo w j. Go, która będzie miała kontroler Pogody, która pozwala na pobieranie danych o pogodzie (lub akcjach giełdowych)

:white_check_mark: Należy stworzyć model Pogoda (lub Giełda) wykorzystując gorm, a dane załadować z listy przy uruchomieniu

:white_check_mark: Należy stworzyć klasę proxy, która pobierze dane z serwisu zewnętrznego podczas zapytania do naszego kontrolera

:white_check_mark: Należy zapisać pobrane dane z zewnątrz do bazy danych

:white_check_mark: Należy rozszerzyć endpoint na więcej niż jedną lokalizację (Pogoda), lub akcje (Giełda) zwracając JSONa

Kod: [lab4](https://github.com/cr0ow/Object-Oriented-Design-2024/tree/master/lab4)

Demo: [lab4-demo](https://github.com/cr0ow/Object-Oriented-Design-2024/assets/70718059/c250ed21-cae6-4eb1-b124-ca1d91bc1068)

**Zadanie 5** Wzorce behawioralne

:white_check_mark: W ramach projektu należy stworzyć dwa komponenty: Produkty oraz Płatności; Płatności powinny wysyłać do aplikacji serwerowej dane, a w Produktach powinniśmy pobierać dane o produktach z aplikacji serwerowej

:white_check_mark: Należy dodać Koszyk wraz z widokiem; należy wykorzystać routing

:white_check_mark: Dane pomiędzy wszystkimi komponentami powinny być przesyłane za pomocą React hooks

:white_check_mark: Należy dodać skrypt uruchamiający aplikację serwerową oraz kliencką na dockerze via docker-compose

:x: Należy wykorzystać axios’a oraz dodać nagłówki pod CORS

Kod: [lab5](https://github.com/cr0ow/Object-Oriented-Design-2024/tree/master/lab5)

Demo: [lab5-demo](https://github.com/cr0ow/Object-Oriented-Design-2024/assets/70718059/2ab69645-2164-404f-9c3e-35c3b018b3e0)

**Zadanie 6** Zapaszki

:white_check_mark: Należy dodać eslint w hookach gita

:white_check_mark: Należy wyeliminować wszystkie bugi w kodzie w Sonarze (kod aplikacji klienckiej)

:white_check_mark: Należy wyeliminować wszystkie zapaszki w kodzie w Sonarze (kod aplikacji klienckiej)

:white_check_mark: Należy wyeliminować wszystkie podatności oraz błędy bezpieczeństwa w kodzie w Sonarze (kod aplikacji klienckiej)

:x: Zredukować duplikaty kodu do 0%

Kod: [lab6](https://github.com/cr0ow/Object-Oriented-Design-2024/tree/master/lab6)

Demo: ![lab6-demo](https://github.com/cr0ow/E-Business-2024/tree/master/demos/lab6-demo.png)
