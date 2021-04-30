class Doctor

  attr_reader :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @age = attributes[:age]
    @name = attributes[:name]
    @specialty = attributes[:specialty]
  end

  def save
    if is_this_object_persisted_in_the_db?
      DB.execute("UPDATE ...")
    else
      DB.execute("INSERT INTO doctors () VALUES ()")
      @id = DB.last_insert_row_id
    end
  end

end

tex = Doctor.new(age: 31, name: "Thiago Teixeira", specialty: "Neurologist")
tex.save

tex.name = "Thiago Tex"
tex.save