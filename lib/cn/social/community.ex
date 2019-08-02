defmodule Cn.Social.Community do
  use Ecto.Schema
  import Ecto.Changeset

  alias Cn.Social.Community

  schema "community" do

    field :name , :string
    timestamps()
  end
  def changeset(%Community{}=community, attrs) do
    community
    |>cast(attrs,[:name])
    |>validate_required([:name])
  end


end
