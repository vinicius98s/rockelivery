defmodule Rockelivery.Factory do
  use ExMachina.Ecto, repo: Rockelivery.Repo

  alias Rockelivery.User

  def user_params_factory do
    %{
      "age" => 20,
      "address" => "Rua bandeirantes",
      "cep" => "12345678",
      "cpf" => "12345678901",
      "email" => "vinicius@sales.com",
      "password" => "123456",
      "name" => "Vinicius"
    }
  end

  def user_factory do
    %User{
      id: "35ec25f2-3ffd-4695-9ace-12e020d1c744",
      age: 20,
      address: "Rua bandeirantes",
      cep: "12345678",
      cpf: "12345678901",
      email: "vinicius@sales.com",
      password: "123456",
      name: "Vinicius"
    }
  end

  def cep_info_factory do
    %{
      "bairro" => "Sé",
      "cep" => "01001-000",
      "complemento" => "lado ímpar",
      "ddd" => "11",
      "gia" => "1004",
      "ibge" => "3550308",
      "localidade" => "São Paulo",
      "logradouro" => "Praça da Sé",
      "siafi" => "7107",
      "uf" => "SP"
    }
  end
end
