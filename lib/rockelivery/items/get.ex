defmodule Rockelivery.Items.Get do
  alias Rockelivery.{Repo, Item}

  def call() do
    Repo.all(Item)
  end
end
