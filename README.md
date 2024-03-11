După ce am instalat Docker Desktop, am descărcat o imagine Ubuntu folosind comanda 'docker pull' din Docker Hub.
Am pornit un container bazat pe imaginea descărcată folosind comanda:
docker run -it --name my_linux_container <linux-image:tag>
După finalizarea acestor pași, am continuat cu următorii pași:
În interiorul containerului, am creat mai întâi un nou utilizator numit "john":useradd john
, apoi am copiat fișierul create_large_file.sh în containerul Linux și am rulat scriptul acolo. Fișierul menționat poate fi găsit la linkul dat pentru Resurse Utile, în folderul 1-linux:docker cp create_large_file.sh my_linux_container:/create_large_file.sh
Rularea scriptului create_large_file.sh în container:
docker exec -it my_linux_container /bin/bash -c '/create_large_file.sh'

Am scris un script bash care citește fișierul passwd, verifică dacă numele fișierului este "passwd" și face următoarele acțiuni:

Am afișat directorul home:
Am listat toate numele de utilizatori din fișierul passwd.
Am numărat numărul de utilizatori.
Am găsit directorul home al unui utilizator specific (am cerut să introduc valoarea numelui de utilizator).
Am listat utilizatorii cu un anumit interval de UID (de exemplu, 1000-1010).
Am găsit utilizatori cu shell-uri standard precum /bin/bash sau /bin/sh.
Am înlocuit caracterul "/" cu caracterul "" în întregul fișier /etc/passwd și am redirecționat conținutul către un fișier nou.
Am afișat adresa IP privată.
Am afișat adresa IP publică.
Am trecut la utilizatorul "john".
Am afișat directorul home al lui "john".
