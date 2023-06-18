defmodule PowerGen.Repo.Migrations.CreateCustomers do
  use Ecto.Migration

  def change do
    create table(:customers) do
      add :name, :string
      add :date_of_birth, :date
      add :telephone_number, :string
      add :id_number, :string, null: true
      add :country_id, :integer
      add :site_id, :integer

      timestamps()
    end
  end
end
