defmodule Rockelivery.Error do
  @keys [:status, :result]

  @enforce_keys @keys

  defstruct @keys

  def build(status, result), do: %__MODULE__{status: status, result: result}

  def build_user_not_found, do: build(:not_found, "User not found")

  def build_invalid_id, do: build(:bad_request, "Invalid id format")
end
