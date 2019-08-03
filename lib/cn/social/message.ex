defmodule Cn.Social.Message do
  use Ecto.Schema
  import Ecto.Changeset

  alias Cn.Social.Message

  schema "message" do
    field :letter, :striing

    timestamps()
  end

  def changeset(%Message{}=message, attrs) do
    message
    |>cast(attr,[:letter])
    |>validate_required([:letter], opts \\ [])
  end

end
