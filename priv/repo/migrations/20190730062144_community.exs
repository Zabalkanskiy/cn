defmodule Cn.Repo.Migrations.Community do
  use Ecto.Migration

  def change do
    
    create table("community") do 
      add :name , :string 

      timestamps() 
    end


  end
end
