/* Задание 1.2.1
Вывести информацию о всех книгах, хранящихся на складе.
+---------+-----------------------+------------------+--------+--------+
| book_id | title                 | author           | price  | amount |
+---------+-----------------------+------------------+--------+--------+
| 1       | Мастер и Маргарита    | Булгаков М.А.    | 670.99 | 3      |
| 2       | Белая гвардия         | Булгаков М.А.    | 540.50 | 5      |
| 3       | Идиот                 | Достоевский Ф.М. | 460.00 | 10     |
| 4       | Братья Карамазовы     | Достоевский Ф.М. | 799.01 | 2      |
| 5       | Стихотворения и поэмы | Есенин С.А.      | 650.00 | 15     |
+---------+-----------------------+------------------+--------+--------+ */

SELECT * FROM book;

/* Задание 1.2.2
Выбрать авторов, название книг и их цену из таблицы book.
Результат:
+------------------+-----------------------+--------+
| author           | title                 | price  |
+------------------+-----------------------+--------+
| Булгаков М.А.    | Мастер и Маргарита    | 670.99 |
| Булгаков М.А.    | Белая гвардия         | 540.50 |
| Достоевский Ф.М. | Идиот                 | 460.00 |
| Достоевский Ф.М. | Братья Карамазовы     | 799.01 |
| Есенин С.А.      | Стихотворения и поэмы | 650.00 |
+------------------+-----------------------+--------+ */

SELECT author, title, price FROM book;

/* Задание 1.2.3
Выбрать названия книг и авторов из таблицы book, для поля title задать имя(псевдоним) Название, для поля author –  Автор. 
Результат:
+-----------------------+------------------+
| Название              | Автор            |
+-----------------------+------------------+
| Мастер и Маргарита    | Булгаков М.А.    |
| Белая гвардия         | Булгаков М.А.    |
| Идиот                 | Достоевский Ф.М. |
| Братья Карамазовы     | Достоевский Ф.М. |
| Стихотворения и поэмы | Есенин С.А.      |
+-----------------------+------------------+ */

SELECT title AS Название, author AS Автор
FROM book;

/* Задание 1.2.4
Для упаковки каждой книги требуется один лист бумаги, цена которого 1 рубль 65 копеек. Посчитать стоимость упаковки для каждой книги 
(сколько денег потребуется, чтобы упаковать все экземпляры книги). В запросе вывести название книги, ее количество и стоимость упаковки, 
последний столбец назвать pack. 
Результат:
+-----------------------+--------+-------+
| title                 | amount | pack  |
+-----------------------+--------+-------+
| Мастер и Маргарита    | 3      | 4.95  |
| Белая гвардия         | 5      | 8.25  |
| Идиот                 | 10     | 16.50 |
| Братья Карамазовы     | 2      | 3.30  |
| Стихотворения и поэмы | 15     | 24.75 |
+-----------------------+--------+-------+ */

SELECT title, amount, amount * 1.65 AS pack
FROM book;

/* Задание 1.2.5
В конце года цену всех книг на складе пересчитывают – снижают ее на 30%. Написать SQL запрос, который из таблицы book выбирает названия, 
авторов, количества и вычисляет новые цены книг. Столбец с новой ценой назвать new_price, цену округлить до 2-х знаков после запятой.
Результат:
+-----------------------+------------------+--------+-----------+
| title                 | author           | amount | new_price |
+-----------------------+------------------+--------+-----------+
| Мастер и Маргарита    | Булгаков М.А.    | 3      | 469.69    |
| Белая гвардия         | Булгаков М.А.    | 5      | 378.35    |
| Идиот                 | Достоевский Ф.М. | 10     | 322.00    |
| Братья Карамазовы     | Достоевский Ф.М. | 2      | 559.31    |
| Стихотворения и поэмы | Есенин С.А.      | 15     | 455.00    |
+-----------------------+------------------+--------+-----------+ */

SELECT title, author, amount, ROUND((price*0.7),2) AS new_price
FROM book;

/* Задание 1.2.6
При анализе продаж книг выяснилось, что наибольшей популярностью пользуются книги Михаила Булгакова, на втором месте книги Сергея 
Есенина. Исходя из этого решили поднять цену книг Булгакова на 10%, а цену книг Есенина - на 5%. Написать запрос, куда включить автора, 
название книги и новую цену, последний столбец назвать new_price. Значение округлить до двух знаков после запятой.
Результат:
+------------------+-----------------------+-----------+
| author           | title                 | new_price |
+------------------+-----------------------+-----------+
| Булгаков М.А.    | Мастер и Маргарита    | 738.09    |
| Булгаков М.А.    | Белая гвардия         | 594.55    |
| Достоевский Ф.М. | Идиот                 | 460.00    |
| Достоевский Ф.М. | Братья Карамазовы     | 799.01    |
| Есенин С.А.      | Стихотворения и поэмы | 682.50    |
+------------------+-----------------------+-----------+ */

SELECT author, title, ROUND(IF(author='Булгаков М.А.', price*1.1, IF(author='Есенин С.А.', price*1.05, price*1)),2) AS new_price
FROM book;

/* Задание 1.2.7
Вывести автора, название  и цены тех книг, количество которых меньше 10.
Результат:
+------------------+--------------------+--------+
| author           | title              | price  |
+------------------+--------------------+--------+
| Булгаков М.А.    | Мастер и Маргарита | 670.99 |
| Булгаков М.А.    | Белая гвардия      | 540.50 |
| Достоевский Ф.М. | Братья Карамазовы  | 799.01 |
+------------------+--------------------+--------+ */

SELECT author, title, price
FROM book
WHERE amount < 10;

/* Задание 1.2.8
Вывести название, автора,  цену  и количество всех книг, цена которых меньше 500 или больше 600, а стоимость всех экземпляров этих 
книг больше или равна 5000.
Результат:
+-----------------------+-------------+--------+--------+
| title                 | author      | price  | amount |
+-----------------------+-------------+--------+--------+
| Стихотворения и поэмы | Есенин С.А. | 650.00 | 15     |
+-----------------------+-------------+--------+--------+ */

SELECT title, author, price, amount
FROM book
WHERE (price < 500 OR price > 600) AND price * amount >= 5000;

/* Задание 1.2.9
Вывести название и авторов тех книг, цены которых принадлежат интервалу от 540.50 до 800 (включая границы),  а количество или 2, 
или 3, или 5, или 7.
Результат:
+--------------------+------------------+
| title              | author           |
+--------------------+------------------+
| Мастер и Маргарита | Булгаков М.А.    |
| Белая гвардия      | Булгаков М.А.    |
| Братья Карамазовы  | Достоевский Ф.М. |
+--------------------+------------------+ */

SELECT title, author
FROM book
WHERE price BETWEEN 540.50 AND 800 AND amount IN (2, 3, 5, 7);

/* Задание 1.2.10
Вывести  автора и название  книг, количество которых принадлежит интервалу от 2 до 14 (включая границы). Информацию  отсортировать 
сначала по авторам (в обратном алфавитном порядке), а затем по названиям книг (по алфавиту).
Результат:
+------------------+--------------------+
| author           | title              |
+------------------+--------------------+
| Достоевский Ф.М. | Братья Карамазовы  |
| Достоевский Ф.М. | Идиот              |
| Булгаков М.А.    | Белая гвардия      |
| Булгаков М.А.    | Мастер и Маргарита |
+------------------+--------------------+ */

SELECT author, title
FROM book
WHERE amount BETWEEN 2 AND 14
ORDER BY 1 DESC, 2;

/* Задание 1.2.11
Вывести название и автора тех книг, название которых состоит из двух и более слов, а инициалы автора содержат букву «С». Считать, 
что в названии слова отделяются друг от друга пробелами и не содержат знаков препинания, между фамилией автора и инициалами обязателен 
пробел, инициалы записываются без пробела в формате: буква, точка, буква, точка. Информацию отсортировать по названию книги в 
алфавитном порядке.
Результат:
+-----------------------+-------------+
| title                 | author      |
+-----------------------+-------------+
| Капитанская дочка     | Пушкин А.С. |
| Стихотворения и поэмы | Есенин С.А. |
+-----------------------+-------------+ */

SELECT title, author
FROM book
WHERE title LIKE '% %'
AND title NOT LIKE ' '
AND author LIKE '% %С.%';

/* Задание 1.2.12 - Контрольный срез */

SELECT title AS Название, author AS Автор, price AS Розничная_ц, amount AS Остаток,
IF (author='Булгаков М.А.', 11, IF(author='Достоевский Ф.М.', 10, 9)) AS Класс,
ROUND (IF (author='Булгаков М.А.', price * 0.89, IF (author='Достоевский Ф.М.', price * 0.9, price * 0.89)),2) AS Класс_ц,
ROUND (IF (author='Булгаков М.А.', 
        IF (price > 650, price * (0.89 - amount / 100 - 0.02), price * (0.89 - amount / 100)), 
        IF (author='Достоевский Ф.М.', 
            IF (price > 650, price * (0.9 - amount / 100 - 0.02), price * (0.9 - amount / 100)),
            IF (price > 650, price * (0.91 - amount / 100 - 0.02), price * (0.91 - amount / 100)))
            ),2) AS КДП_ц
FROM book
WHERE author LIKE '%М.%'
ORDER BY 5 DESC, 3, 1;