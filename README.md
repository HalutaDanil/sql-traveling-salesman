<div align="center">

# SQL Traveling Salesman Problem

**[English](#english) | [Русский](#русский)**

</div>

---

<a name="english"></a>
## 🇬🇧 English

A team project solving the classic **Traveling Salesman Problem** using only SQL and recursive CTEs. The goal was to prove that SQL can handle graph algorithms, not just table operations.

### What was done

| Task | What & Why |
|------|-----------|
| Data Preparation | Created a table of cities and travel costs between them. Modeled an undirected weighted graph in relational form. |
| Cheapest Tour | Wrote a recursive CTE that enumerates all Hamiltonian cycles starting from city "a", sums their costs, and returns the cheapest one. |
| Most Expensive Tour | Extended the query to also find the most expensive tour. Demonstrated how to rank and filter recursive results. |

### How it works

The recursive CTE builds paths one city at a time:
1. **Anchor**: start from each city.
2. **Recursive step**: append an unvisited city, accumulating cost and path.
3. **Termination**: when all cities are visited, check if the path returns to the start.
4. **Selection**: pick the tour with minimum (or maximum) total cost.

### Key takeaways
- **Recursive CTEs** can traverse graphs and solve NP-hard problems in SQL — though not efficiently at scale.
- SQL is more than CRUD: it is a **declarative computation engine**.
- Teamwork on a single SQL problem requires clear agreement on schema design and query logic.

### Tech Stack

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?style=flat-square&logo=postgresql&logoColor=white) ![SQL](https://img.shields.io/badge/SQL-336791?style=flat-square)

---

<div align="center">
  <img src="https://capsule-render.vercel.app/api?type=rect&color=0:58a6ff,50:1f6feb,100:0969da&height=2&section=header&text=&fontSize=1"/>
</div>

<a name="русский"></a>
## 🇷🇺 Русский

Командный проект по решению классической **задачи коммивояжёра** только средствами SQL и рекурсивных CTE. Цель — доказать, что SQL способен на графовые алгоритмы, а не только операции с таблицами.

### Что было сделано

| Задача | Что и зачем |
|--------|-------------|
| Подготовка данных | Создана таблица городов и стоимостей пути между ними. Смоделирован ненаправленный взвешенный граф в реляционной форме. |
| Самый дешёвый маршрут | Написан рекурсивный CTE, перебирающий все гамильтоновы циклы из города "a", суммирующий их стоимость и возвращающий самый дешёвый. |
| Самый дорогой маршрут | Расширен запрос для поиска самого дорогого маршрута. Продемонстрировано ранжирование и фильтрация рекурсивных результатов. |

### Как это работает

Рекурсивный CTE строит пути по одному городу за шаг:
1. **Anchor**: старт из каждого города.
2. **Рекурсивный шаг**: добавление непосещённого города, накопление стоимости и пути.
3. **Терминация**: когда все города посещены, проверяется возврат в начало.
4. **Выбор**: выбирается маршрут с минимальной (или максимальной) суммарной стоимостью.

### Ключевые выводы
- **Рекурсивные CTE** могут обходить графы и решать NP-трудные задачи в SQL — хотя и не эффективно в масштабе.
- SQL — это больше, чем CRUD: это **декларативный вычислительный движок**.
- Командная работа над одной SQL-задачей требует чёткой договорённости о дизайне схемы и логике запроса.

### Стек технологий

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?style=flat-square&logo=postgresql&logoColor=white) ![SQL](https://img.shields.io/badge/SQL-336791?style=flat-square)

---

<div align="center">

*Project from portfolio | Проект из портфолио*

</div>
