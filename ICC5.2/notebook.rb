require_relative "database.rb"

class Notebook
  attr_reader :name

  def initialize(name, db)
    @name = name
    @db = db
  end

  def add_entry(entry)
    @db.append(entry)
  end
  
  def count_entries
    @db.record_count
  end

  def get_entry(n)
    all_entries = @db.record_get_all
    all_entries[n]
  end
end

class FakeDatabase
  def initialize
    @data = []
  end

  def append(entry)
    @data << entry
  end

  def record_count()
    @data.length
  end

  def record_get_all
    @data
  end
end