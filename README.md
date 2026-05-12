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

| Exercise | Description |\n|----------|-------------|\n| ex00 | Data preparation: cities and distances table |\n| ex01 | Recursive CTE for route enumeration |

### 🚀 Quick Start

```sql\n-- Recursive graph traversal\nWITH RECURSIVE routes AS (\n    SELECT point1 as path, point1, point2, cost, 1 as level\n    FROM roads\n    UNION ALL\n    SELECT r.path || ',' || roads.point2,\n           roads.point1, roads.point2,\n           r.cost + roads.cost, r.level + 1\n    FROM routes r\n    JOIN roads ON r.point2 = roads.point1\n    WHERE r.level < (SELECT COUNT(DISTINCT point1) FROM roads)\n)\nSELECT * FROM routes\nWHERE point2 = SUBSTRING(path FROM 1 FOR 1)\nORDER BY cost LIMIT 1;\n```

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

| Задача | Описание |\n|--------|----------|\n| ex00 | Подготовка данных: таблица городов и расстояний |\n| ex01 | Рекурсивный CTE для перебора маршрутов |

### 🚀 Быстрый старт

```sql\n-- Рекурсивный обход графа\nWITH RECURSIVE routes AS (\n    SELECT point1 as path, point1, point2, cost, 1 as level\n    FROM roads\n    UNION ALL\n    SELECT r.path || ',' || roads.point2,\n           roads.point1, roads.point2,\n           r.cost + roads.cost, r.level + 1\n    FROM routes r\n    JOIN roads ON r.point2 = roads.point1\n    WHERE r.level < (SELECT COUNT(DISTINCT point1) FROM roads)\n)\nSELECT * FROM routes\nWHERE point2 = SUBSTRING(path FROM 1 FOR 1)\nORDER BY cost LIMIT 1;\n```

---

<div align="center">

*Project from portfolio | Проект из портфолио*

</div>
