# 📅 ToDoScorer - Flutter Clean Architecture

ToDoScorer est une application mobile Flutter permettant de créer, gérer et suivre des tâches avec un système de score de priorité. Ce projet a été réalisé dans une démarche professionnelle avec une architecture modulaire propre et évolutive.

---

## 🌐 Fonctionnalités principales

* ✅ Création de tâches avec un titre et un score de priorité (1 à 5)
* ✔️ Marquage des tâches comme "fait"
* ❌ Suppression en masse des tâches terminées
* 📕 Persistance des données localement via Hive
* 🛍️ Interface traduite (anglais / français)
* 🔧 Architecture clean avec injection de dépendances via GetIt + Injectable

---

## 🔄 Architecture et organisation

L'application suit une architecture **Clean** basée sur la séparation des responsabilités :

```
lib/
├── data/             # Modèles Hive + répositories
├── domain/           # Entités, usecases, interfaces
├── presentation/     # Pages, widgets, controllers
├── injection.dart    # Configuration DI avec Injectable
├── main.dart         # Point d'entrée de l'app
```

### 🎓 Technologies principales

* Flutter 3.x
* Dart
* Hive (local storage)
* GetIt + Injectable (DI)
* Provider (state management)
* EasyLocalization (multilingue)
* Mocktail + flutter\_test (tests unitaires)

---

## 🏙️ État actuel de l'application

| Fonctionnalité           | Statut                                           |
| ------------------------ | ------------------------------------------------ |
| Création de tâches       | ✅ Fonctionnelle                                  |
| Score par tâche          | ✅ Ajout via dropdown                             |
| Validation / Suppression | ✅ Checkbox + suppression en masse                |
| Persistance locale       | ✅ Via Hive                                       |
| Multilingue (FR/EN)      | ✅ Dynamique avec EasyLocalization                |
| Page paramètres          | ✅ Choix de langue en dropdown                    |
| Architecture Clean       | ✅ Injectable + GetIt en place                    |
| Tests unitaires          | ✅ Pour les services principaux (TaskServiceImpl) |

---

## ⚖️ Pistes d'évolution

* 🔔 **Notifications locales** pour les tâches non terminées
* 🔌 **Export / import JSON** des tâches
* ⚫️ **Mode sombre / clair** avec gestion dans les paramètres
* ⚡ **Synchronisation cloud** (Firebase ou Supabase)
* 📊 **Dashboard de priorité** (score cumulatifs, badges...)

---

## ✍️ Auteur

Ce projet a été réalisé dans une démarche d'apprentissage approfondi de Flutter, des architectures clean, et de la gestion de projet logiciel avec qualité de code.

Tu veux en savoir plus sur l'organisation technique, les décisions d'architecture ou la roadmap ? Ouvre une issue ou contacte-moi ❤️
