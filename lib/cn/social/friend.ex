defmodule Cn.Social.Friend do
  use Ecto.Schema
  import Ecto.Changeset

  alias Cn.Social.Friend

  schema "friend" do

      field :name, :string
      field :surname, :string


      timestamps()
  end

  def changeset(%Friend{}=friend, attrs)do
    friend
    |>cast(attrs,[:name,:surname])
    |>validate_required([:name,:surname])
  end


end


