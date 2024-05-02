import csv
import codecs
import sqlite3 as sq
import re


def parse_data(data):
    match = re.match(r'User_(\d+)\t(.*?)@(\S+?)\.(\S+)\s+(.*)', data)
    if match:
        user_id = match.group(1)
        email = match.group(2) + '@' + match.group(3) + '.' + match.group(4)
        city = match.group(5).strip()
        return int(user_id), email, city
    return None, None, None


def users_filter(file_path, encoding):

    # READING AND FILTERING
    filtered_arr = []  # Filtered data to write
    with codecs.open(file_path, 'r', encoding) as file:
        csv_reader = csv.reader(file)
        for row in csv_reader:
            data = row[0]
            parsed_data = parse_data(data)
            if all([parsed_data[i] is not None and parsed_data[i] != "" for i in range(len(parsed_data))]):
                filtered_arr.append(parsed_data)

    # CREATING DATA BASE
    with sq.connect("Betting.db") as con:
        cur = con.cursor()
        cur.execute("""CREATE TABLE IF NOT EXISTS USERS (
	                    user_id INTEGER PRIMARY KEY AUTOINCREMENT,
	                    email TEXT,
	                    geo TEXT
                        );""")
        cur.executemany("INSERT INTO USERS VALUES(?, ?, ?)", filtered_arr)


if __name__ == "__main__":
    users_filter('users(1).csv', 'koi8_r')
