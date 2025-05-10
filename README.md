# esp-idf-docker-environment
Готовая среда разработки ESP-IDF в докер-контейнере. С установкой нужных пакетов и SSH сервером для подключения из VSCoduim через плагин Remote SSH.

Установка:
1. Замените в файле Dockerfile `MyRootPasword` на ваш пароль для SSH.
2. При необходимости раскомментируйте настройки прокси в файле compose.yaml.
3. Соберите контейнер командой `docker compose build`.
4. Запустите контейнер `docker compose up -d`.

Среда разработки готова. Для подключание по SSH из VSCodium введите `root@host:2222`.
