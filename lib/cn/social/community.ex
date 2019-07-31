defmodule Cn.Social.Community do 
  use Ecto.Schema
  import Ecto.Changeset

  alias Cn.Social.Community

  schema "community" do 

    add :name , :string
    timestamps()
  end
end
