require 'sqlite3'

class RockBands
  def initialize(db_path = './resources/data.db')
    @db_path = db_path
    db_init
  end
  
  def db_init
    @db = SQLite3::Database.open @db_path
    @db.results_as_hash = true
  end

  def create_db
    @db.execute 'CREATE TABLE IF NOT EXISTS rock_bands(name TEXT, grade INTEGER)'
  end

  def fetch_all
    @db.execute 'SELECT * FROM rock_bands'
  end

  def fetch_by_grade(grade = 'A+')
    @db.execute 'SELECT * FROM rock_bands WHERE grade=?', grade
  end

  def fetch_by_name(name)
    @db.execute 'SELECT * FROM rock_bands WHERE name=? LIMIT 1', name
  end

  def update_grade(name, new_grade)
    @db.execute 'UPDATE rock_bands SET grade=? WHERE name=?', new_grade, name
  end

  def update_name(old_name, new_name)
    @db.execute 'UPDATE rock_bands SET name=? WHERE name=?', new_name, old_name
  end

  def add_band(name, grade)
    @db.execute 'INSERT INTO rock_bands(name, grade) VALUES (?, ?)', name, grade
  end
end

db = RockBands.new
puts db.fetch_all
