# EggClock

EggClock es una aplicación Flutter que permite seleccionar y configurar un temporizador para cocinar huevos. La aplicación ofrece opciones predefinidas de tiempo y una opción personalizada para ingresar minutos y segundos específicos.

## Características

- Selección de temporizadores predefinidos: 3, 5, 10 y 15 minutos.
- Configuración de temporizador personalizado con minutos y segundos.
- Validación para evitar tiempos menores a 10 segundos.
- Interfaz de usuario atractiva con imágenes y colores personalizados.

## Instalación

1. Clona este repositorio:
    ```sh
    git clone https://github.com/tu-usuario/EggClock.git
    ```
2. Navega al directorio del proyecto:
    ```sh
    cd EggClock
    ```
3. Instala las dependencias:
    ```sh
    flutter pub get
    ```

## Uso

1. Ejecuta la aplicación:
    ```sh
    flutter run
    ```
2. En la pantalla principal, selecciona un temporizador predefinido o configura uno personalizado.
3. Si seleccionas la opción personalizada, ingresa los minutos y segundos deseados y presiona "Start".
4. El temporizador comenzará la cuenta regresiva y mostrará el tiempo restante.
5. Cuando el temporizador llegue a cero, se mostrará un mensaje indicando que el huevo está listo.

## Estructura del Proyecto

- `lib/main.dart`: Punto de entrada de la aplicación.
- `lib/home.dart`: Pantalla principal de la aplicación.
- `lib/egg_timer_selection.dart`: Pantalla de selección de temporizador.
- `lib/egg_timer.dart`: Pantalla del temporizador en funcionamiento.
- `lib/personal_button.dart`: Widget personalizado para los botones.
- `lib/colors.dart`: Definición de colores utilizados en la aplicación.

## Galería de Fotos

![Background](assets/images/eggClock_background.png)
![Egg](assets/images/eggClock_egg.png)
![Egg Final](assets/images/eggClock_eggFinal.png)
![Button Skin](assets/images/eggClock_BottonSkin.png)

## Contribuciones

Las contribuciones son bienvenidas. Si deseas contribuir, por favor sigue los siguientes pasos:

1. Haz un fork del repositorio.
2. Crea una nueva rama (`git checkout -b feature/nueva-caracteristica`).
3. Realiza tus cambios y haz commit (`git commit -am 'Agrega nueva característica'`).
4. Sube tus cambios a tu fork (`git push origin feature/nueva-caracteristica`).
5. Abre un Pull Request.

## Licencia

Este proyecto está bajo la Licencia MIT. Consulta el archivo [LICENSE](LICENSE) para más detalles.
