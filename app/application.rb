class application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      if @@items.include?(item_name)
        item = @@items.find{|item| item.name == item_name}
        resp.write "#{}"
      else
