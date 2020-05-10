defmodule Newhorizonsapi.Animals.Fish do
  use Ecto.Schema
  import Ecto.Changeset

  schema "fishes" do
    field :name, :string
    field :price, :integer

    timestamps()
  end

  @doc false
  def changeset(fish, attrs) do
    fish
    |> cast(attrs, [:name, :price])
    |> validate_required([:name, :price])
  end
end
