# PowerGen

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

- The page displayed has a link to allow the upload of CSV files saved on your laptop.
- Once the file is uploaded, the data is saved inside the Postgres database.
- The saved data is what is displayed once you click the import customer records button.

   NOTE
    - The CSV file only allows files with the following headers [name, date_of_birth, telephone_number, id_number, country_id, site_id]
      * id_number is optional
      * date of birth is displayed in an ISO 8601 date string


Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
