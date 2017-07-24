
-- las pelis para los nenes Ej:1
SELECT title, special_features, rating 
FROM film
WHERE rating LIKE 'PG-13'

En python:
        laquery = Film.objects.filter(rating='PG-13').values('title','special_features').all()
        data['query'] = laquery.query
        data['cols'] = ('Title','Special Features')
        data['rows'] = []
        for b in laquery:
             data['rows'].append(b)

-- saco la duracion de las peliculas Ej 2
SELECT DISTINCT length AS Duración:
FROM film ;

En python:
        a = Film.objects.values_list('length', flat=True).distinct()
        data['query'] = a.query
        data['result'] = a

-- cosas entre 20 y 24 en replacement_cost  Ej:3

SELECT title,rental_rate,replacement_cost
FROM film
WHERE replacement_cost 
BETWEEN '20.00' AND '24.00';

En python:

    laquery = Film.objects.filter(replacement_cost__range=(20,24)).values_list('title','rental_rate','replacement_cost')
    data['query'] = laquery.query
    data['cols'] = ('Title','Rental rate','Replacement cost')
    data['rows'] = []
    for b in laquery:
         data['rows'].append(b)

-- Ej:4

SELECT title,rating, special_features,name
FROM film,category,film_category
WHERE category.category_id=film_category.category_id
AND film.film_id=film_category.film_id
AND special_features LIKE '%Behind the Scenes%';

En python:

    laquery = Film.objects.filter(special_features='Behind the Scenes').values_list('title','category','rating')
    data['query'] = laquery.query
    data['cols'] = ('Title','category','rating')
    data['rows'] = []
    for b in laquery:
         data['rows'].append(b)

-- Ejer:5

SELECT first_name,last_name,title
FROM actor,film,film_actor
WHERE actor.actor_id=film_actor.actor_id
AND film_actor.film_id=film.film_id
AND title LIKE '%ZOOLANDER FICTION%';

En python:

    laquery = Film.objects.filter(title='ZOOLANDER FICTION').values_list('actor__first_name','actor__last_name')
    data['query'] = laquery.query
    data['cols'] = ('Nombre','Apellido')
    data['rows'] = []
    for b in laquery:
         data['rows'].append(b)

-- Ejer: 6

SELECT address,city,country,store_id
FROM store,address,city,country
WHERE store.store_id = 1
AND store.address_id=address.address_id
AND address.city_id=city.city_id
AND city.country_id=country.country_id;

En python:

    queryset=Store.objects.filter(store_id=1).values_list('address__address','address__city__city','address__city__country__country')
    data['query'] = queryset.query
    data['cols'] = ('address','city',"country")
    data['rows'] = []
    for a in queryset:
        data['rows'].append(a)


-- Ejer: 7

    laquery = Film.objects.filter(rating='').values_list('actor__first_name','actor__last_name')
    data['query'] = laquery.query
    data['cols'] = ('title','rating')
    data['rows'] = []
    for b in laquery:
         data['rows'].append(b)



