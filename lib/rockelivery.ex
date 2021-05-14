defmodule Rockelivery do
  alias Rockelivery.Users.Create, as: UsersCreate
  alias Rockelivery.Users.Delete, as: UsersDelete
  alias Rockelivery.Users.Get, as: UsersGet

  defdelegate create_user(params), to: UsersCreate, as: :call
  defdelegate get_user_by_id(id), to: UsersGet, as: :by_id
  defdelegate delete_user(id), to: UsersDelete, as: :call
end
