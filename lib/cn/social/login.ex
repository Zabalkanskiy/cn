defmodule Cn.Social.Login do
  use Ecto.Schema
  import Ecto.Changeset

  alias Cn.Social.Login

  schema("login") do
    field :nickname, :string
    field :name, :string
    field :passwrdhash, :string
    field :email, :string
  end

  def changeset(%Login{}=login, attrs) do
    login
    |>cast(attrs,[:nickname, :name, :passwordhash,:email] )
    |>validate_required([:nickname, :name, :passwordhash,:email])
  end

end


