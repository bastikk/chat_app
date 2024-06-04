defmodule ChatApp.Login do
  require NITRO

  def event(:init) do
    :nitro.update( :one, NITRO.button(id: :one, name: "one", body: "one", postback: :one, source: [:user]))
    :nitro.update(:two, NITRO.button(id: :two, name: "two", body: "two", postback: :two, source: [:user]))
    :nitro.update(:three, NITRO.button(id: :three, name: "three", body: "three", postback: :three, source: [:user]))
  end
  def event(button) when button in [:one, :two, :three] do
    user = :nitro.to_list(:nitro.q(:user))
    room = :nitro.to_binary(button)

    if user != [] do
      :n2o.user(user)
      :n2o.session(:room, room)
      :nitro.redirect(["/app/index.htm?room=", room])
    end
  end
end