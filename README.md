# DevOps Data — Lab 4 (ESIEE Paris DSIA)

Ce repository contient mon travail pour le **Lab 4** : workflow Git/GitHub, une petite application **Node/Express**, la conteneurisation **Docker**, des tests **Jest/Supertest**, et un **bonus** de tests infra avec **OpenTofu** (`tofu test`).

> Note : sur ma machine, j’ai eu un conflit de ports (3000/3001). Pour éviter les problèmes, l’app tourne sur **3001**.

---

## Structure du repo

* `sample-app/` : application Node/Express + Docker + tests
* `docs/` : notes de lab + pièges rencontrés
* `infra-test-demo/` : bonus OpenTofu (démo de `tofu test`)

---

## Prérequis

* Node.js + npm (run en local)
* Docker Desktop (build/run de l’image)
* Bonus : WSL Ubuntu + OpenTofu (pour `tofu test`)

---

## Run local (Node/Express)

```bash
cd sample-app
npm install
npm start
```

Endpoints :

* `http://localhost:3001/` → `Hello, World!`
* `http://localhost:3001/name/Remy` → `Hello, Remy!`

---

## Tests (Jest + Supertest)

```bash
cd sample-app
npm test
```

Les tests valident notamment :

* `GET /` renvoie `Hello, World!`
* `GET /name/:name` renvoie `Hello, <name>!`

---

## Docker

### Build

```bash
cd sample-app
docker build -t sample-app:1.0.2 .
```

### Run

```bash
docker run --rm -p 3001:3001 sample-app:1.0.2
```

### Vérification

```bash
curl http://localhost:3001/name/Remy
```

---

## Bonus — OpenTofu (`tofu test`)

Le dossier `infra-test-demo/` montre le principe de tests infra avec OpenTofu :

* module `test-endpoint` (provider HTTP)
* fichier `deploy.tftest.hcl` avec une assertion (status code 200)

Exécution (WSL recommandé) :

```bash
cd infra-test-demo
tofu init
tofu test
```

> Piège rencontré : lancer `tofu test` sans `tofu init` provoque “Module not installed”. La solution est `tofu init`.

---

## Notes / pièges

Voir `docs/LAB4_NOTES.md` pour un récap (commandes, erreurs fréquentes, etc.).
