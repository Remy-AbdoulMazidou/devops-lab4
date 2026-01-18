\# DevOps Data — Lab 4 (ESIEE Paris DSIA)



Ce repository contient mon travail pour le \*\*Lab 4\*\* : workflow Git/GitHub, une petite application \*\*Node/Express\*\*, la conteneurisation \*\*Docker\*\*, des tests \*\*Jest/Supertest\*\*, et un \*\*bonus\*\* de tests infra avec \*\*OpenTofu\*\* (`tofu test`).



> Note : sur ma machine, j’ai eu un conflit de ports (3000/3001). Pour éviter les problèmes, l’app tourne sur \*\*3001\*\*.



---



\## 1) Structure du repo



\* `sample-app/` : application Node/Express + Docker + tests

\* `docs/` : notes de lab + pièges rencontrés

\* `infra-test-demo/` : bonus OpenTofu (démo de `tofu test`)



---



\## 2) Prérequis



\* Node.js + npm (pour lancer en local)

\* Docker Desktop (pour build/run l’image)

\* (Bonus) WSL Ubuntu + OpenTofu installé (pour `tofu test`)



---



\## 3) Run local (Node/Express)



Se placer dans le dossier de l’app :



```bash

cd sample-app

```



Installer les dépendances :



```bash

npm install

```



Démarrer l’application :



```bash

npm start

```



Tester rapidement (dans un autre terminal) :



\* `http://localhost:3001/` → `Hello, World!`

\* `http://localhost:3001/name/Remy` → `Hello, Remy!`



---



\## 4) Tests (Jest + Supertest)



Depuis `sample-app/` :



```bash

npm test

```



Les tests vérifient notamment :



\* `GET /` renvoie `Hello, World!`

\* `GET /name/:name` renvoie `Hello, <name>!`



J’ai aussi fait une démonstration de “bug volontaire” (changer la réponse en `Hello, Mars!`) pour vérifier que les tests passent bien en \*\*FAIL\*\* puis repassent en \*\*PASS\*\* après correction.



---



\## 5) Docker



\### Build de l’image



Depuis `sample-app/` :



```bash

docker build -t sample-app:1.0.2 .

```



\### Run du conteneur



```bash

docker run --rm -p 3001:3001 sample-app:1.0.2

```



\### Vérification



Dans un autre terminal :



```bash

curl http://localhost:3001/name/Remy

```



---



\## 6) Bonus — OpenTofu (`tofu test`)



Le dossier `infra-test-demo/` est une démo du principe de tests infra avec OpenTofu :



\* un module `test-endpoint` (provider HTTP)

\* un fichier `deploy.tftest.hcl` avec une assertion simple (status code 200)

\* exécution : `tofu test` → PASS/FAIL



\### Lancer le bonus (WSL recommandé)



Se placer dans le dossier :



```bash

cd infra-test-demo

```



Initialiser (première fois uniquement) :



```bash

tofu init

```



Lancer les tests :



```bash

tofu test

```



> Piège rencontré : si on lance directement `tofu test` sans init, on obtient “Module not installed”. La solution est `tofu init`.



---



\## 7) Notes / pièges



J’ai gardé des notes dans `docs/LAB4\_NOTES.md` (commandes clés, pièges rencontrés, etc.), notamment :



\* Docker Desktop pas démarré → vérifier avec `docker version`

\* Conflits de ports → diagnostic avec `netstat` (Windows)



