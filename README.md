<div align="center">

# SQL Traveling Salesman Problem

**[English](#english) | [Русский](#русский)**

</div>

---

<a name="english"></a>
## 🇬🇧 English

Implementation of the shortest route search algorithm (TSP) using recursive CTEs in PostgreSQL.

### 🛠️ Tech Stack

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?style=flat-square&logo=postgresql&logoColor=white) ![SQL](https://img.shields.io/badge/SQL-336791?style=flat-square)

### ✨ Features

| Exercise | Description |
|----------|-------------|
| ex00 | Data preparation: cities and distances table |
| ex01 | Recursive CTE for route enumeration |

### 🚀 Quick Start

```sql
-- Recursive graph traversal
WITH RECURSIVE routes AS (
    SELECT point1 as path, point1, point2, cost, 1 as level
    FROM roads
    UNION ALL
    SELECT r.path || ',' || roads.point2,
           roads.point1, roads.point2,
           r.cost + roads.cost, r.level + 1
    FROM routes r
    JOIN roads ON r.point2 = roads.point1
    WHERE r.level < (SELECT COUNT(DISTINCT point1) FROM roads)
)
SELECT * FROM routes
WHERE point2 = SUBSTRING(path FROM 1 FOR 1)
ORDER BY cost LIMIT 1;
```

---

<div align="center">
  <img src="https://capsule-render.vercel.app/api?type=rect&color=0:58a6ff,50:1f6feb,100:0969da&height=2&section=header&text=&fontSize=1"/>
</div>

<a name="русский"></a>
## 🇷🇺 Русский

Реализация алгоритма поиска кратчайшего маршрута (TSP) с помощью рекурсивных CTE в PostgreSQL.

### 🛠️ Стек технологий

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?style=flat-square&logo=postgresql&logoColor=white) ![SQL](https://img.shields.io/badge/SQL-336791?style=flat-square)

### ✨ Возможности

| Задача | Описание |
|--------|----------|
| ex00 | Подготовка данных: таблица городов и расстояний |
| ex01 | Рекурсивный CTE для перебора маршрутов |

### 🚀 Быстрый старт

```sql
-- Рекурсивный обход графа
WITH RECURSIVE routes AS (
    SELECT point1 as path, point1, point2, cost, 1 as level
    FROM roads
    UNION ALL
    SELECT r.path || ',' || roads.point2,
           roads.point1, roads.point2,
           r.cost + roads.cost, r.level + 1
    FROM routes r
    JOIN roads ON r.point2 = roads.point1
    WHERE r.level < (SELECT COUNT(DISTINCT point1) FROM roads)
)
SELECT * FROM routes
WHERE point2 = SUBSTRING(path FROM 1 FOR 1)
ORDER BY cost LIMIT 1;
```

---

<div align="center">

*Project from portfolio | Проект из портфолио*

</div>
