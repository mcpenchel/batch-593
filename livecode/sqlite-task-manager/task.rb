class Task

  attr_reader :id
  attr_accessor :title, :description, :done

  def initialize(attr = {})
    @id          = attr[:id]
    @title       = attr[:title]
    @description = attr[:description]
    @done        = attr[:done] || 0
  end

  # def some_method
  #   # instance method, so we're in the context of the instance
  #   @id
  # end

  def self.find(id)
    result = DB.execute("SELECT * FROM tasks WHERE id = ?", id)

    if result.empty?
      return nil
    else
      # result => [ { "id" => 1, ... } ]
      hash = result.first

      return Task.build_task(hash)
    end
  end

  def save
    if @id.nil?
      DB.execute("INSERT INTO tasks (title, description, done) VALUES (?, ?, ?)", @title, @description, @done)
      @id = DB.last_insert_row_id
    else
      DB.execute("UPDATE tasks SET title = ?, description = ?, done = ? WHERE id = #{@id}", @title, @description, @done)
    end
  end

  def self.all
    tasks = DB.execute("SELECT * FROM tasks")
    
    array = []

    tasks.each do |hash|
      array << Task.build_task(hash)
    end

    array
  end

  def destroy
    DB.execute("DELETE FROM tasks WHERE id = #{@id}")
  end

  private
  def self.build_task(hash)
    Task.new(
      id: hash["id"],
      title: hash["title"],
      description: hash["description"],
      done: hash["done"]
    )
  end

end