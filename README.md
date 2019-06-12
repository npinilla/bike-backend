## Descripción

Aplicación backend desarrollada en Rails que obtiene información sobre las estaciones de BikeSantiago desde su api http://api.citybik.es/v2/networks/bikesantiago cada 1 minuto.

## Componentes
### Station.rb
Almacena el nombre, bicicletas usadas, bicicletas libres y el tiempo de última actualización las estaciones.

### SystemUsage.rb
Almacena el total de bicicletas libres y el total de bicicletas usadas del sistema completo.

### stations_controller.rb
API que entrega toda las estaciones ordenadas alfabeticamente por nombre

### system_usage_controller.rb
API que entrega información sobre el total de bicicletas usadas y total de bicicletas libres. Puede entregar la información de la última hora en intervalos de 1 minutos o del último día en intervalos de 1 hora.

### Gema Whenever
Se usa para obtener la información de la api cada 1 minutos y almacenarla en la base de datos.

## Como ejecutar

1. Crear carpeta para aplicación
  * mkdir name
  * cd name
  
2. Descargar aplicación de Github
  * git init
  * git remote add origin https://github.com/npinilla/bike-backend.git
  * git pull origin master
  
3. Ejecutar aplicación
  * bundle install
  * rake db:migrate
  * whenever --update-crontab --set 'environment=development' (para poblar base de datos)
  * rails s

4. Ejecutar aplicación de frontend
  * Instrucciones en https://github.com/npinilla/bike-frontend.git
  
5. Limpiar crontab
  * whenever -c
