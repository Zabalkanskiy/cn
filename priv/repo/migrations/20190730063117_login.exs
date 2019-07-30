defmodule Cn.Repo.Migrations.Login do
  use Ecto.Migration

  def change do
    create table("login") do 
      add :nickname, :string
      add :name, :string
      add :passwordhash, :string
      add :email, :string

      timestamps()

    end

  end
end
