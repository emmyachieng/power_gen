defmodule PowerGen.Data.Customer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "customers" do
    field :country_id, :integer
    field :date_of_birth, :date
    field :id_number, :string
    field :name, :string
    field :site_id, :integer
    field :telephone_number, :string

    timestamps()
  end

  @doc false
  def changeset(customer, attrs) do
    customer
    |> cast(attrs, [:name, :date_of_birth, :telephone_number, :id_number, :country_id, :site_id])
    |> validate_required([:name, :date_of_birth, :telephone_number, :id_number, :country_id, :site_id])
  end
end
