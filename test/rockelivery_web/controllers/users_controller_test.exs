defmodule RockeliveryWeb.UsersControllerTest do
  use RockeliveryWeb.ConnCase, async: true

  import Mox
  import Rockelivery.Factory

  alias Rockelivery.ViaCep.ClientMock
  alias RockeliveryWeb.Auth.Guardian

  describe "create/2" do
    test "when all params are valid, creates the user", %{conn: conn} do
      params = build(:user_params)

      expect(ClientMock, :get_cep_info, fn _cep ->
        {:ok, build(:cep_info)}
      end)

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "User created!",
               "user" => %{
                 "address" => "Rua bandeirantes",
                 "age" => 20,
                 "email" => "vinicius@sales.com",
                 "id" => _id,
                 "name" => "Vinicius"
               }
             } = response
    end

    test "when there are some error, returns an error", %{conn: conn} do
      params = build(:user_params, %{"age" => 16})

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:bad_request)

      assert %{"message" => %{"age" => ["must be greater than or equal to 18"]}} = response
    end
  end

  describe "delete/2" do
    setup %{conn: conn} do
      user = insert(:user)
      {:ok, token, _claims} = Guardian.encode_and_sign(user)
      conn = put_req_header(conn, "authorization", "Bearer #{token}")
      {:ok, conn: conn}
    end

    test "when there is a user with the given id, deletes the user", %{conn: conn} do
      id = "35ec25f2-3ffd-4695-9ace-12e020d1c744"

      response =
        conn
        |> delete(Routes.users_path(conn, :delete, id))
        |> response(:no_content)

      assert response == ""
    end
  end
end
