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

    , final_routes as (
        select
            cost as total_cost
            , tour
        from routes
        where
            tour[array_length(tour, 1)] = 'A'
            and array_length(tour, 1)
            = (select count(distinct point1) from paths) + 1
    )

select
    total_cost
    , tour
from final_routes
where
    total_cost in ((
        select min(total_cost)
        from final_routes
    ), (
        select max(total_cost)
        from final_routes
    ))
order by 1, 2;
