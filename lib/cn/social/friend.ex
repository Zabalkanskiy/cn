defmodule Cn.Social.Friend do 
  use Ecto.Schema
  import Ecto.Changeset

  alias Cn.Social.Friend
  
  schema "friend" do 

      field :name, :string
      field :surname, :string


      timestamps()
  end


end


