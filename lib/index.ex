defmodule ChatApp.Index do
  require NITRO
  require N2O

  def event(:init) do
    room = ChatApp.Application.room
    :n2o.reg({:topic, room})
    :nitro.update(:heading, NITRO.h2(id: :heading, body: room))
    :nitro.update(:send, NITRO.button(id: :send, body: "Chat", postback: :chat, source: [:message]))
    :nitro.update(:logout, NITRO.button(id: :logout, postback: :logout, body: "Logout"))
  end
  def event(:logout) do
    :n2o.user([])
    :nitro.redirect("/app/login.htm")
  end
  def event(:chat), do: chat(:nitro.q(:message))
  def event({:client, {user, message}}) do
    :nitro.wire(NITRO.jq(target: :message, method: [:focus, :select]))
    :nitro.insert_top(:history, NITRO.message(body: [NITRO.author(body: user), :nitro.jse(message)]))
  end

  def chat(message) do
    room = ChatApp.Application.room
    user = :n2o.user()

    if message != "" do
      :n2o.send({:topic, room}, N2O.client(data: {user, message}))
    end
  end
end
