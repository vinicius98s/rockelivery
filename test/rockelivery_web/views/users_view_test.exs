defmodule RockeliveryWeb.UsersViewTest do
  use RockeliveryWeb.ConnCase, async: true

  import Phoenix.View
  import Rockelivery.Factory

  alias Rockelivery.User
  alias RockeliveryWeb.UsersView

  test "renders create.json" do
    user = build(:user)
    response = render(UsersView, "create.json", user: user)

    assert %{
             message: "User created!",
             user: %User{id: "35ec25f2-3ffd-4695-9ace-12e020d1c744"}
           } = response
  end
end
