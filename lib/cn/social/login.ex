defmodule Cn.Social.Login do
  use Ecto.Schema
  import Ecto.Changeset

  alias Cn.Social.Login

  schema("login") do
    field :nickname, :string
    field :name, :string
    field :passwordhash, :string
    field :email, :string

    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true

    timestamps()
  end

  def changeset(%Login{}=login, attrs) do
    login
    |>cast(attrs,[:nickname, :name, :email, :password, :password_confirmation])
    |>validate_confirmation(:password, message: "does not match password!")
    |>encrypt_password()
    |>validate_required([:nickname, :name, :email, :passwrodhash])
  end

  def encrypt_password(changeset)do
    with password when not is_nil(password) <- get_change(changeset, :password) do
      put_change(changeset, :passwordhash, Comeonin.Bcrypt.hashpwsalt(password))
      else
      _ -> changeset
    end

  end
end


