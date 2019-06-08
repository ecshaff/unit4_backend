class Form
  # connecting to database
  DB = PG.connect({:host => "localhost", :port => 5432, :dbname => 'unit4_development'})

  # get all form
  def self.all
    results = DB.exec("SELECT * FROM form;")
    return results.map do |result|
      {
        "id" => result["id"].to_i,
        "date" => result["date"],
        "text" => result["text"],
        "image" => result["image"],
        "title" => result["title"],
        "author" => result["author"],
        "status" => result["status"]
        }
    end
  end

  # get one form
  def self.find(id)
    results = DB.exec("SELECT * FROM form WHERE id=#{id}")
    return {
     
        "id" => results.first["id"].to_i,
        "date" => results.first["date"],
        "text" => results.first["text"],
        "image" => results.first["image"],
        "title" => results.first["title"],
        "author" => results.first["author"],
        "status" => results.first["status"]
      
    }
  end

  # create form
  def self.create(opts)
    results = DB.exec(
      <<-SQL
        INSERT INTO form (date, text, image, title, author, status)
        VALUES ( '#{opts["date"]}', '#{opts["text"]}', '#{opts["image"]}', '#{opts["title"]}', '#{opts["author"]}', '#{opts["status"]}' )
        RETURNING id, date, text, image, title, author, status;
      SQL
    )
    return {
      "id" => results.first["id"].to_i,
      "date" => results.first["date"],
      "text" => results.first["text"],
      "image" => results.first["image"],
      "title" => results.first["title"],
      "author" => results.first["author"],
      "status" => results.first["status"]
    }
  end

  # delete one form
  def self.delete(id)
    results = DB.exec("DELETE FROM form WHERE id=#{id};")
    return { "deleted" => true }
  end

  # update one form
  def self.update id, opts
    results = DB.exec(
      <<-SQL
        UPDATE form
        SET date='#{opts["date"]}', text='#{opts["text"]}', image='#{opts["image"]}', title='#{opts["title"]}', author='#{opts["author"]}', status='#{opts["status"]}'
        WHERE id=#{id}
        RETURNING id, date, text, image, title, author, status;
      SQL
    )
    return {
      "id" => results.first["id"].to_i,
      "date" => results.first["date"],
      "text" => results.first["text"],
      "image" => results.first["image"],
      "title" => results.first["title"],
      "author" => results.first["author"],
      "status" => results.first["status"]
    }
  end

end
