# SQL: Traveling Salesman Problem

> Рекурсивные CTE для решения задачи коммивояжёра

## О проекте

Реализация алгоритма поиска кратчайшего маршрута (TSP) с помощью рекурсивных CTE в PostgreSQL. Задача коммивояжёра — классическая NP-трудная задача комбинаторной оптимизации.

## Что реализовано

| Задача | Описание |
|--------|----------|
| `ex00` | Подготовка данных: таблица городов и расстояний |
| `ex01` | Рекурсивный CTE для перебора всех маршрутов |

## Алгоритм

```sql
-- Рекурсивный обход графа городов
WITH RECURSIVE routes AS (
    -- Базовый случай: начинаем из каждого города
    SELECT 
        point1 as path,
        point1,
        point2,
        cost,
        1 as level
    FROM roads
    
    UNION ALL
    
    -- Рекурсивный случай: добавляем следующий город
    SELECT 
        r.path || ',' || roads.point2,
        roads.point1,
        roads.point2,
        r.cost + roads.cost,
        r.level + 1
    FROM routes r
    JOIN roads ON r.point2 = roads.point1
    WHERE r.level < (SELECT COUNT(DISTINCT point1) FROM roads)
)
-- Выбираем маршрут, возвращающийся в начало, с минимальной стоимостью
SELECT * FROM routes
WHERE point2 = SUBSTRING(path FROM 1 FOR 1)
ORDER BY cost
LIMIT 1;
```

## Технологии

- **PostgreSQL**
- **Рекурсивные CTE**
- **Графовые алгоритмы** в чистом SQL

---

*Командный проект. Проект из портфолио*
