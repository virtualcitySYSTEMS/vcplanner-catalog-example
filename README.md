# Example Catalog
This is an example catalog for the VC Planner. You can use the
provided bash script to generate screenshots for your own catalog if you wish.

To integrate this catalog to your planner, do the following:

```bash
zip catalog-example.zip *.glb *.jpg catalog.json
scp catalog-example.zip user@planner-host:~/catalog-example.zip

ssh user@planner-host
# on the planner host
source /etc/vcplanner.conf
cd $DATA_PATH
mkdir -p objectLibrary/catalog-example
cd objectLibrary/catalog-example
cp ~/catalog-example.zip .
unzip catalog-example.zip
```

Once the static files are on the server, you can adde the following catalog to the
`catalogs` array of the `Planning` widget in your VC Map, e.g:

```json
{
  ...,
  "widgets": [
    {
      "type": "vcs.vcm.widgets.Planning",
      ...,
      "catalogs": [
        {
          "url": "object-library/catalog-example/catalog.json"
        },
      ]
    }
  ]
}
```
