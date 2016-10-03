# Alumnos de una facultad - Proyecto Xtend

## Objetivo

Muestra cómo modelar relaciones one-to-many, many-to-one, atributos comunes y enums en [Arena Persistence](http://arena-pers.uqbar.org/)

## Modelo

* El modelo es un alumno que tiene muchas cursadas (one-to-many), un nombre y la forma en la que se comporta (un enum).
* A su vez cada cursada tiene asociada una materia (many-to-one) y la comisión. 
* Y de cada materia se conoce el nombre y el año.

## Correr el ejemplo

En la aplicación tenemos 2 alumnos

* Leandro Barragán que es un alumno común y está cursando Diseño de Sitemas y Sistemas Operativos
* y Federico Cano que es estudioso y está cursando Análisis Matemático I y Matemática Discreta

Respecto a los tests
* la base de grafos se anota en modo test, para trabajar en memoria y no terminar actualizando los archivos de Neo4J
* previo a correr los tests se crean ambos alumnos si no existen
* al finalizar el test se eliminan ambos alumnos
* un test valida la actualización de Leandro de alumno común a estudioso
* otro test hace una búsqueda by example sencilla por nombre de alumno
* y otro muestra que al consultar quiénes cursan Diseño la búsqueda by example de Arena Persistence falla

