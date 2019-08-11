defmodule Cn.Social.People do
  use Ecto.Schema
  import Ecto.Changeset

  alias Cn.Social.People

  schema("peoples")do
    field :name, :string
    field :surname, :string
    field :sex, :boolean
    field :country, :string
    field :about, :string
    field :city, :string

    timestamps()
  end

  def changeset(%People{}=people, attrs)do
    people
    |>cast(attrs, [:name,:surname,:sex,:country, :about, :city])
    |>validate_required([:name,:surname,:sex,:country, :about, :city])
  end

end
