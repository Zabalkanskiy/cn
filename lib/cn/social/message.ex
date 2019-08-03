defmodule Cn.Social.Message do
  use Ecto.Schema
  import Ecto.Changeset

  alias Cn.Social.Message

  schema "message" do
    field :letter, :string

    timestamps()
  end

  def changeset(%Message{}=message, attrs) do
    message
    |>cast(attrs,[:letter])
    |>validate_required([:letter])
  end

end
