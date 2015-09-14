defmodule Meetup4 do
  import Plug.Conn
  
  def start() do
    IO.puts "Server is running at http://localhost:8888."
    Plug.Adapters.Cowboy.http(__MODULE__, [], port: 8888)
  end
  
  def init(options) do
    options
  end
  
  def call(conn, _opts) do
    # That thing below is same as if you'd type...
    # 
    # conn = Plug.Conn.put_resp_content_type(conn, "text/plain")
    # conn = Plug.Conn.send_resp(200, "Hello world!")
    # conn
    #
    # So you see why the pipe operator comes handy. :)
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "Hello world!\n")
  end
end
