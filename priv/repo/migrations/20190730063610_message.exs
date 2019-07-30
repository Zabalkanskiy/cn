defmodule Cn.Repo.Migrations.Message do
  use Ecto.Migration

  def change do
    create table("message") do 
      add :letter, :string
      timestamps()
    end

  end
end
