import csv
import psycopg2

# 1. Подключаемся к базе данных
conn = psycopg2.connect(
    host="127.0.0.1",
    port="5433",
    database="north",
    user="postgres",
    password="567894Lucky"
)
cur = conn.cursor()

# 2. employees сотрудники
with open('north_data/employees_data.csv', encoding='utf-8') as f:
    reader = csv.reader(f)
    next(reader)  # пропускаем строку-заголовок
    for row in reader:
        cur.execute("INSERT INTO employees VALUES (%s, %s, %s, %s, %s, %s)", row)

# 3. customers клиенты
with open('north_data/customers_data.csv', encoding='utf-8') as f:
    reader = csv.reader(f)
    next(reader)  # пропускаем строку-заголовок
    for row in reader:
        cur.execute("INSERT INTO customers VALUES (%s, %s, %s)", row)

# 4. orders заказы
with open('north_data/orders_data.csv', encoding='utf-8') as f:
    reader = csv.reader(f)
    next(reader)  # пропускаем строку-заголовок
    for row in reader:
        cur.execute("INSERT INTO orders VALUES (%s, %s, %s, %s, %s)", row)

# 5. Сохраняем изменения и закрываем соединение
conn.commit()
cur.close()
conn.close()

print("Успешно! Все данные перенесены в PostgreSQL.")
