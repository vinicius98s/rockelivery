defmodule Rockelivery.UserTest do
  use Rockelivery.DataCase, async: true

  import Rockelivery.Factory

  alias Ecto.Changeset
  alias Rockelivery.User

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = build(:user_params)

      response = User.changeset(params)

      assert %Changeset{changes: %{name: "Vinicius"}, valid?: true} = response
    end

    test "when there are any error, returns an invalid changeset" do
      params = build(:user_params, %{"age" => 15, "password" => "12345"})

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["should be at least 6 character(s)"]
      }

      response = User.changeset(params)

      assert errors_on(response) == expected_response
    end
  end

  describe "changeset/2" do
    test "when updating a changeset, returns a valid changeset with given changes" do
      user =
        build(:user_params)
        |> User.changeset()

      update_params = %{name: "Alves"}

      response = User.changeset(user, update_params)

      assert %Changeset{changes: %{name: "Alves"}, valid?: true} = response
    end
  end
end
