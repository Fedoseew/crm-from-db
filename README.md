# crm-from-db

**RU** · [EN](#english)

Демо-проект «Jmix-приложение из существующей базы». Есть PostgreSQL со схемой и данными CRM, кода приложения нет; ветки по шагам строят поверх неё Jmix-приложение: модель из таблиц, экраны, новый атрибут с Liquibase, роль и AI-агент с jmix-agent-toolkit. Проект используется в демо B runbook'а [jmix-demo-runbook](https://github.com/Fedoseew/jmix-demo-runbook).

Нужны JDK 21 и Docker.

```bash
docker compose -f db/docker-compose.yml up -d   # PostgreSQL 17: localhost:5434, база crm, crm / crm
./gradlew bootRun                               # http://localhost:8080, вход admin / admin
```

В Jmix Studio то же делает run-конфигурация «Crm-from-db Jmix Application». Дамп `db/crm.sql` загружается только при первом старте, в пустой том. Вернуть базу к дампу: `docker compose -f db/docker-compose.yml down -v`, затем снова `up -d`. `./gradlew test` работает с отдельной базой `crm_test` из того же дампа, поэтому база должна быть запущена.

| Ветка | Что добавляет |
|---|---|
| `b/01-empty` (= `main`) | Проект из `jmix new crm-from-db --non-interactive` (Jmix 3.0.3, Project id `crm`), PostgreSQL вместо HSQLDB, `db/` с дампом CRM |
| `b/02-model` | JPA-сущности для таблиц CRM, как их строит Studio Generate Model from Database: Client, Contact, Category, CategoryItem, Order, OrderItem, Invoice и Employee (таблица `USER_`), перечисления OrderStatus и InvoiceStatus; для существующих таблиц Liquibase не генерируется |
| `b/03-views` | Списки и карточки с пунктами меню для всех сущностей, кроме Invoice |
| `b/04-role` | Атрибут `rating` у Client с Liquibase-changelog, поле на экранах, ресурсная роль «Manager: Clients read-only» |
| `b/05-agent` | jmix-agent-toolkit (skills и правила для AI-агентов) и список счетов Invoice, написанный агентом по skills |

Данные CRM взяты из демо-данных [jmix-framework/jmix-crm](https://github.com/jmix-framework/jmix-crm). Лицензия: Apache 2.0.

## English

A demo project: a Jmix application built on top of an existing database. PostgreSQL holds the CRM schema and data, there is no application code yet, and the branches build a Jmix application on top of it step by step: a model from the tables, views, a new attribute with Liquibase, a role, and an AI agent with jmix-agent-toolkit. It is demo B of the [jmix-demo-runbook](https://github.com/Fedoseew/jmix-demo-runbook).

Requires JDK 21 and Docker.

```bash
docker compose -f db/docker-compose.yml up -d   # PostgreSQL 17: localhost:5434, database crm, crm / crm
./gradlew bootRun                               # http://localhost:8080, log in as admin / admin
```

In Jmix Studio, use the "Crm-from-db Jmix Application" run configuration. `db/crm.sql` is loaded only on the first start, into an empty volume. To reset the database to the dump, run `docker compose -f db/docker-compose.yml down -v`, then `up -d` again. `./gradlew test` uses a separate `crm_test` database loaded from the same dump, so the database must be running.

| Branch | Adds |
|---|---|
| `b/01-empty` (= `main`) | The project from `jmix new crm-from-db --non-interactive` (Jmix 3.0.3, Project id `crm`), PostgreSQL instead of HSQLDB, `db/` with the CRM dump |
| `b/02-model` | JPA entities for the CRM tables as Studio's Generate Model from Database builds them: Client, Contact, Category, CategoryItem, Order, OrderItem, Invoice and Employee (table `USER_`), enums OrderStatus and InvoiceStatus; no Liquibase for the existing tables |
| `b/03-views` | List and detail views with menu items for every entity except Invoice |
| `b/04-role` | A `rating` attribute on Client with a Liquibase changelog, the field in the views, the resource role "Manager: Clients read-only" |
| `b/05-agent` | jmix-agent-toolkit (skills and guidelines for AI agents) and the Invoice list view an agent wrote by following the skills |

The CRM data comes from the demo data of [jmix-framework/jmix-crm](https://github.com/jmix-framework/jmix-crm). License: Apache 2.0.
