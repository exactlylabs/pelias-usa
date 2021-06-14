#!/bin/bash

OUTPUT=$(curl https://batch.openaddresses.io/api/data | jq '[.[]|select((.source | startswith("us")) and .layer == "addresses").source + ".csv"]')
jq ".imports.openaddresses.files = $OUTPUT" pelias.json > pelias2.json
mv pelias2.json pelias.json

