import connection from './database/connection.js'


connection.exec(`CREATE TABLE IF NOT EXISTS movies (title, year, score)`)
connection.exec(`INSERT INTO movies (title, year, score) VALUES (?, ?, ?)`, ["The Awakening", 2011, "John Doe"])
connection.exec(`INSERT INTO movies (title, year, score) VALUES (?, ?, ?)`, ["The Awakening", 2011, "John Doe"])