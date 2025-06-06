# social_network_system_design
System Design education (may 2025)
System Design социальной сети для курса по System Design

---

# Требования к системе

## Функциональные требования:
1. Публикация постов
    1. Возможность прикрепить фотографии
    2. Возможность оставить описание
    3. Возможность оставить гео-метку
2. Оценка постов других пользователей
3. Комментарии постов других пользователей
4. Подписка на обновления других пользователей
5. Поиск популярных мест для путешествий
6. Просмотр постов
7. Просмотр ленты других пользователей в обратном хронологическом порядке
8. Просмотр своей ленты в обратном хронологическом порядке

## Нефункциональные требования
1. DAU – 10 000 000 в сутки
2. Только для стран СНГ
3. Система должна работать в мобильных устройствах и браузерах
4. Система должна быть надежной
5. Активность пользователей:
    1. Пользователи постят 2 поста в день с 1 фотографией
    2. Пользователи просматривают чужие и свою ленты 10 раз в день (1 лента = 10 постов)
    3. Пользователи оценивают 15 постов в день
    4. Пользователи оставляют 3 комментария в день
6. Сезонность:
    1. Лето
    2. Зима
7. Тайминги:
    1. Публикация одного поста - 2 секунды
    2. Получение ленты новостей - 2 секунды


---

# Расчет нагрузки и трафика

## Расчет нагрузки на запись
* **Посты**: RPS (write) = DAU * 2 поста в день / 86400 = 250 
* **Оценки**: RPS (write) = DAU * 15 оценок в день / 86400 = 1736
* **Комментарии**: RPS (write) = DAU * 3 комментария в день / 86400 = 347
* **Общая оценка**: 250 + 1736 + 347 ~ 2300

## Расчет трафика на запись
* **Посты**: Traffic (write) = RPS * 270 байт (пост + картинка) * 2 поста в день = 1.3 МБ
* **Оценки**: Traffic (write) = RPS * 17 байт * 15 оценок = 640 KB
* **Комментарии**: Traffic (write) = RPS * 116 байт * 3 коммента в день = 347 KB
* **Общая оценка**: 1300 KB + 640 KB + 870 KB ~ 2 MB/s

## Расчет нагрузки на чтение
* **Ленты постов**: RPS (read) = DAU * 10 лент / 86400 = 1157

## Расчет трафика на чтение
* **Ленты постов**: Traffic (read) = RPS * 400 байт * 10 объектов = 4.6 MB/s

---

# Модель данных

Примерная модель поста (~240 байт):
* id (8 байт)
* user_id (8 байт)
* description (200 байт) 
* geo (8 байт) 
* created_at (8 байт)
* updated_at (8 байт)

Примерная модель изображения к посту (~24 байта):
* id (8 байт)
* post_id (8 байт)
* image_source (8 байт)

Примерная модель оценки (~17 байт): 
* id (8 байт)
* post_id (8 байт)
* grade (1 байт)

Примерная модель коммента (~116 байт):
* id (8 байт)
* post_id (8 байт)
* comment (100 байт)