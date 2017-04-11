class Pokemon

attr_accessor :id, :name, :type, :db, :hp
def initialize(id:, name:, type:, db:, hp: nil)
	@id = id
	@name = name
	@type = type
	@db = db
	@hp = hp
end

def self.save(name, type, db)
	db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
end

def self.find(id, db)
	test = db.execute("SELECT * FROM pokemon WHERE id = (?)", id)
	Pokemon.new(id: test[0][0], name: test[0][1], type: test[0][2], hp: test[0][3], db: @db)
end

def alter_hp (num, db)
	db.execute("UPDATE pokemon SET hp = (?) WHERE name = (?)", num, self.name)
end

end
