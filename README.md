# Организация баз данных - ЛБ

## Вариант № 3 - Поликлиника

### Содержимое репозитория

Папка `initdb-scripts/` - скрипты для создания и заполнения таблиц

### Запуск БД при помощи Docker

1. Запустить контейнер с БД под управлением PostgreSQL
    ```
    docker compose up
    ```
2. Подключиться к БД  
    _Host_: localhost  
    _Port_: 5439  
    _Database_: med_dev  
    _Username_: postgres  
    _Password_: 123456
