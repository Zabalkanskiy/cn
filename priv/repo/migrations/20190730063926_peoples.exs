defmodule Cn.Repo.Migrations.Peoples do
  use Ecto.Migration

  def change do
    create table("people")do
      add :name, :string
      add :surname, :string
      add :country, :string
      add :sex, :boolean
      add :about, :text
      add :city, :string

      timestamps()

    end

  end
end
