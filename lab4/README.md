# Zadanie 4: Wzorce strukturalne

Należy stworzyć aplikację w Go na frameworku echo. Aplikacja ma mieć jeden endpoint, minimum jedną funkcję proxy, która pobiera dane np. o pogodzie, giełdzie, etc. (do wyboru) z zewnętrznego API. Zapytania do endpointu można wysyłać w jako GET lub POST.

- Należy stworzyć aplikację we frameworki echo w j. Go, która będzie miała kontroler Pogody, która pozwala na pobieranie danych o pogodzie (lub akcjach giełdowych)
- Należy stworzyć model Pogoda (lub Giełda) wykorzystując gorm, a dane załadować z listy przy uruchomieniu
- Należy stworzyć klasę proxy, która pobierze dane z serwisu zewnętrznego podczas zapytania do naszego kontrolera
- Należy zapisać pobrane dane z zewnątrz do bazy danych
- Należy rozszerzyć endpoint na więcej niż jedną lokalizację (Pogoda), lub akcje (Giełda) zwracając JSONa
