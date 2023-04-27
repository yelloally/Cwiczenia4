#!/bin/bash

touch .gitignore
echo "log*" > .gitignore
echo "error*" >> .gitignore

git add .gitignore

if [ $1 == "--date" ] | [ $1 == "-d" ]
 then
  date +"%Y-%m-%d"
elif [ $1 == "--logs" ] | [ $1 == "-l"
  then
   if [ -n $2 ]
     num_logs=$2
   else
     num_logs=100
   fi
   for (( c=1; c<=num_logs; c++ ))
   do
     echo "Nazwa pliku: log$c.txt" >> log$c.txt
     echo "Nazwa skryptu: $0" >> log$c.txt
     echo "Data: $(date +"%Y-%m-%d %T")" >> log$c.txt
   done
elif [ $1 == "--error"] | [ $1 == "-e" ]
 then
  if [ -n $2 ]
   num_errors=$2
  else
   num_errors=100
  fi
  for (( i=1; i<=num_errors; i++ ))
  do
   echo "Nazwa pliku: error$i.txt" >> error$i.txt
   echo "Nazwa skryptu: $0" >> error$i.txt
   echo "Data: $(data +"%Y-%m-%d %T")" >> error$i.txt
  done
elif [ $1 == "--init" ]
 then
  git clone https://github.com/username/repo.git
  export PATH=$PATH:~/bin
elif [ $1 == "--help" ] | [ $1 == "-h"]
 then
  echo "Dostępne opcje:"
  echo "--date albo -d  wyświetla dzisiejszą datę"
  echo "--logs albo -l  tworzy 100 plików logx.txt, x - numer pliku od 1-100, w każdym pliku wpisana jest jego nazwa, nazwa skryptu i data. Opcjonalny argument liczby plików."
  echo "--help albo -h  wyświetla wszystkie dostępne opcje"
  echo "--init          klonuje całe repozytorium do katalogu w którym został uruchomiony oraz ustawia ścieżkę w zmiennej środowiskowej PATH"
else
  echo "Nieznana opcja. Użyj --help, aby wyświetlić dostępne opcje."
fi
