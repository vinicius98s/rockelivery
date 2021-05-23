defmodule RockeliveryWeb.ItemsController do
  use RockeliveryWeb, :controller

  alias Rockelivery.Item
  alias RockeliveryWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Item{} = item} <- Rockelivery.create_item(params) do
      conn
      |> put_status(:created)
      |> render("create.json", item: item)
    end
  end

  # def delete(conn, %{"id" => id}) do
    # with {:ok, %User{}} <- Rockelivery.delete_user(id) do
      # conn
      # |> put_status(:no_content)
      # |> text("")
    # end
  # end

  # def show(conn, %{"id" => id}) do
    # with {:ok, %User{} = user} <- Rockelivery.get_user_by_id(id) do
      # conn
      # |> put_status(:ok)
      # |> render("user.json", user: user)
    # end
  # end

  # def update(conn, params) do
    # with {:ok, %User{} = user} <- Rockelivery.update_user(params) do
      # conn
      # |> put_status(:ok)
      # |> render("user.json", user: user)
    # end
  # end
end
