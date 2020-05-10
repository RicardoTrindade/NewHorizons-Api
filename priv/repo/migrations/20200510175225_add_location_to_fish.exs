defmodule Newhorizonsapi.Repo.Migrations.AddLocationToFish do
  use Ecto.Migration

  def change do
    alter table(:fishes) do
      add :location, :text
    end
  end
end
