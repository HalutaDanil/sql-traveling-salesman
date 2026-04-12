with recursive
    routes as (
        select
            point1
            , point2
            , array[point1, point2]::varchar [] as tour
            , cost
        from paths
        where point1 = 'A'

        union all

        select
            p.point1
            , p.point2
            , r.tour || p.point2
            , r.cost + p.cost
        from paths p
            join routes r on r.point2 = p.point1
        where p.point2 != all(r.tour[2:array_length(r.tour, 1)])
    )

select
    cost as total_cost
    , tour
from routes
where tour[array_length(tour, 1)] = 'A' and array_length(tour, 1) = 5
order by 1, 2;
