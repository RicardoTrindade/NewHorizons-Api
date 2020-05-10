defmodule Newhorizonsapi.Repo.Migrations.CreateFishes do
  use Ecto.Migration

  def change do
    create table(:fishes) do
      add :name, :string
      add :price, :integer

      timestamps()
    end

  end
end
