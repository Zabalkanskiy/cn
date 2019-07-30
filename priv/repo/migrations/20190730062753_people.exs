defmodule Cn.Repo.Migrations.People do
  use Ecto.Migration

  def change do
    create table ("friend") do

      add :name, :string
      add :surname, :string

      timestamps()
    end

  end
end
