DUMITRACHE Daniela Andreea 311CB

	
	LERP
Functia realizeaza interpolarea liniara unidimensionala. Daca pozitia cautata de afla in afara intervalului [1,n] (n = dimensiunea vectorului), atunci valolarea intoarsa este 0. Altfel, caut, folosind functia floor, i = primul intreg mai mare decat pozitia cautata. Daca acesta se afla in interval, inseamna ca pozitia este incadrata de pozitiile i si i-1 din vector, deci se alfa pe dreapta formata de valorile functiei in aceste puncte. Calculez panta dreptei intai folosind valorile cunoscute , i si i-1, apoi, stiind panta, deduc valoarea functiei in punctul de interes.

	
	BILERP	
Ca si la lerp, verific intai ca pozitia ceruta sa se afle in intervalul [1, nr. de linii] pentru row si [1, nr coloane] pentru col. Daca aceasta conditie este indeplinita, voi determina primii intregi mai mare decat row (i), respectiv  col(j). Verific ca si acestia sa apartina intervalelor corespunzatoare. Apoi, folosind lerp, voi afla valoarea functiei in punctul col de pe linia de deasupra (i-1) si dedesubtul punctului dat (i). Apoi introduc aceste valori intr-un vector pe pozitiile i si i-1, care incadreaza row, pentru a afla functia in pozitia row, folosind lerp.
	
	
	FORWARD_MAPPING
Creaza o noua imagine, in functie de transformarea T aplicata vechii imagini. Citesc imaginea folosind functia imread si ii retin dimensiunile. In functie de matricea T, determin tipul transformarii penrtu a sti cum sa scalez imaginea.

Daca imaginea trebuie micsorata/marita, folosesc factorul de scalare pentru a crea o noua matrice cu dimensiunile noii imagini. Parcurg matricea imaginii initiale pixel cu pixel. Pentru fiecare pixel voi pune in matricea noii imagini (pe pozitia data de inmultirea vectorului pozitiei curente cu T) valoarea de pe pozitia curenta, obtinand astfel noua imagine

Daca imaginea trebuie rotita, atunci determin noile dimensiuni in functie de unghiul cu care trebuie efectuata rotatia. Calculez apoi pozitiile pixelului central din imaginea intiala si din cea rotita, deoarece voi calcula pozitiile fiecarui pixel in raport cu centrul.Parcurg matricea imaginii initiale pixel cu pixel. Pentru fiecare pixel voi calcula noua poztite astfel: din coordonatele voi scadea coordonatele pixelului din mijloc imaginii curente pentru a obtine pozitia lui relativa ata de centru. Apoi voi calcula pozitiil din imaginea rotita prin inmultire cu T si prin adunarea indicilor pixelului din mijlocul noii imagini. Apoi, voi pune pe pozitiile corespunzatoarea din matricea noii imagini valorile din vecheaimagine, obitand astfel imaginea rotita.


	INVERSE_MAPPING
Creaza matricea noii imagini, in functie de transformarea T aplicata vechii imagini. Citesc imaginea folosind functia imread si ii retin dimensiunile. In functie de matricea T, determin tipul transformarii penrtu a sti dimensiunile noii imagini. Calculez de asemenea inversa transformarii T, conform formulei de inversare a unei matrice de 2x2.

Daca imaginea trebuie marita/micsorata, atunci creez o noua matrice de dimensiunile corespuzatoare. Parcurg aceasta noua matrice pixel cu pixel si pentru fiecare pozitie din noua matrice determin pozitia din matricea initiala, prin inmultire  cu T^-1. Verific ca pozitia noua sa aiba indicii in interiorul matricei imaginii initale. Daca aceasta conditie se respecta, voi calcula valoarea pixelului in pozitia curenta prin aproximarea rezultatului intors de functia bilerp, aplicata pe matricea vechii imagini, in pozitile determinate mai sus.

Daca imaginea trebuie rotita, atunci determin noile dimensiuni in functie de unghiul cu care trebuie efectuata rotatia. Calculez pozitiile pixelului central din imaginea intiala si din cea rotita, deoarece voi calcula pozitiile fiecarui pixel in raport cu centrul. Parcurg matricea imaginii rotite pixel cu pixel. Pentru fiecare pixel voi calcula coordonatele in functie de centru imaginii, apoi prin inmultire cu T^-1, voi obtine pozitia pixelului din matricea originala. Daca aceasta pozitie este in interiorul matricei intiale, voi calcula valoarea pixelului in pozitia curenta prin aproximarea rezultatului intors de functia bilerp, aplicata pe matricea vechii imagini, in pozitile determinate mai sus.

	DEMO
Primeste ca parametru calea catre cele doua imagini de test.
Se testeaza functia inverse_mapping pentru cele doua imagini, flapping_bird si flapping_duck. Functia creaza imaginile corespunzatoare transformarilor aplicate pentru fiecare poza. Transformarile folosite sunt: scalarea cu 0.4, rotirea fata de orizontala si rotatia cu 45 de grade. Pentru fiecare dintre poze apelez functia inverse_mapping si, folosind matricea intoarsa de aceasta, creez noua imagine folosind functia mat2grey. Imaginile create vor avea denumirea pozei intiale (flapping_duck / flapping_bird), concatenate cu o denumire sugestiva pentru transformarea aplicata: scalare, rotatie45, rotatie180.
Pentru scalarea cu 0.4 am folosit matricea T1 = [0.4 0; 0 0.4];
Pentru rotirea cu 45 de garde am folosit matricea T2 = [cos(pi/4) -sin(pi/4); sin(pi/4) cos(pi/4)];
Pentru rotirea cu 180 de garde am folosit matricea T3 = [cos(pi) -sin(pi);sin(pi) cos(pi)];
