# Color Swatch API

Color Swatch tracks frequently used colors. You can `POST` colors to the database, and
`GET` the most frequently posted color.

## Base URL: [https://color-swatch-api.herokuapp.com/](https://color-swatch-api.herokuapp.com/)

|Verb|Path|Body|Response|
|---|---|---|---|
|`GET`|`/api/v1/top_color`||`"{\"value\":\"tomato\", \"color_count\": 7}"`|
|`GET`|`/api/v1/colors`||`"[{\"value\":"tomato"},{\"value\":\"indigo\"}]"`|
|`POST`|`/api/v1/colors`|`{ color: { value: "indigo" } }`|`"{\"color\":{\"value\":\"indigo\"}}"`|

## Setup

```bash
bundle install
bundle exec rake db:{create,migrate,seed}
bundle exec rspec
bundle exec rails s
```

## Notes

The `colors` table is set to reset itself once exceeding 2000 entries. This may happen mid-development for you, so be wary.
