import csv
import codecs
import re
import sqlite3 as sq


def extract_values(data):
    user_id_ = re.search(r'user_(\d+)', data[0])
    user_id = user_id_.group(1) if user_id_ else None

    data_time = None
    if len(data) > 1:
        date_time_raw = data[1].strip('[')
        if date_time_raw:
            date = date_time_raw.split(' ')[0]

            time = date_time_raw.split(' ')[1]
            if time[1] == ":":
                time = "0" + time

            data_time = date + " " + time

    bet = data[2] if len(data) > 2 else None
    win = data[3] if len(data) > 3 else None
    return user_id, data_time, bet, win


def log_filter(file_path, encoding):

    # READING AND FILTERING
    filtered_arr = []  # Filtered data to write
    with codecs.open(file_path, 'r', encoding) as file:
        csv_reader = csv.reader(file)
        for row in csv_reader:
            filtered_data = extract_values(row)
            if all([filtered_data[i] is not None for i in range(len(filtered_data))]):
                filtered_arr.append(filtered_data)

    # CREATING DATA BASE
    with sq.connect("Betting.db") as con:
        cur = con.cursor()
        cur.execute("""CREATE TABLE IF NOT EXISTS LOG (
                           user_id INTEGER,
                           time DATETIME,
                           bet REAL,
                           win REAL
                        );""")
        cur.executemany("INSERT INTO LOG VALUES(?, ?, ?, ?)", filtered_arr)


if __name__ == "__main__":
    log_filter('log(1).csv', 'utf-8')
