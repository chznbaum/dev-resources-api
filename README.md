# Dev-Resources API

[![Maintainability](https://api.codeclimate.com/v1/badges/7160d925c70594b0c2da/maintainability)](https://codeclimate.com/github/chznbaum/dev-resources-api/maintainability)[![Test Coverage](https://api.codeclimate.com/v1/badges/7160d925c70594b0c2da/test_coverage)](https://codeclimate.com/github/chznbaum/dev-resources-api/test_coverage)[![Build Status](https://travis-ci.org/chznbaum/dev-resources-api.svg?branch=master)](https://travis-ci.org/chznbaum/dev-resources-api)

This API provides access to resources I've found helpful during my study of web and software development.

## Getting Started

### Prerequisites

#### Ruby 2.5.0

Download and manage via [rbenv](https://github.com/rbenv/rbenv) or [RVM](https://rvm.io/)

#### Rails 5.1.5

```bash
gem install rails -v '~> 5.1'
```

#### PostgreSQL 10.3

Follow the [instructions for downloading PostgreSQL](https://www.postgresql.org/download/) based on your operating system, and be sure to [create a database user with privileges](https://wiki.postgresql.org/wiki/First_steps).

### Installing

Clone the repository:

```bash
git clone https://github.com/chznbaum/dev-resources-api.git
cd ./dev-resources-api
```

Install the gems:

```bash
bundle install
```

And set up the database:

```bash
rails db:create
rails db:migrate
```

Start the development server:

```bash
rails s
```

You can test this by making a GET request to `localhost:3000` using Postman or an alternative.

## API Reference

### Authentication

Endpoints for creating or updating categories or resources require a JSON Web Token.

Authentication requests must be made to `http://localhost:3000/api/v1/auth/login`, and include an email and a password. Valid login credentials are limited to the API creator at this time.

An example response may look like the following:

```json
{
    "access_token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1MjA4MjEwNTV9.OwcvXUtkeyK-vyoAUQbSB16AqHRw9rmMfJUeCSXHEJs",
    "message": "Login successful."
}
```

Authentication is not required to access resource or category data.

### Response Codes

All valid and properly formatted requests will return a HTTP status of 200. In the JSON response, there will also be a status field that will return "Successful" on such requests.

### Endpoints

#### Log In

* **URL**
    `/api/v1/auth/login`
* **Method:**
    `POST`
* **Data Params:**
    **Required:**
    `email=[string]`
    `password=[string]`
* **Success Response**
  * **Code:** 200
  * **Content:** `{ "access_token": ..., "message": "Login successful." }`
* **Error Response**
  * **Code:** 401
  * **Content:** { "error": { "user_authentication": [ "Invalid credentials." ] } }

## Index Resources

* **URL**
    `/api/v1/resources/`
* **Method:**
    `GET`
* **Data Params:**
    **Required:** none
* **Success Response**
  * **Code:** 200
  * **Content:** `{ "status": "Success", "message": "Loaded all resources.", "data": [ { "id": 1, "name": ..., "url": ..., "credit": ..., "description": ..., "category_id": ..., "created_at": ..., "updated_at": ... } ] }`

## Show Resource

* **URL**
    `/api/v1/resources/:id`
* **Method:**
    `GET`
* **Data Params:**
    **Required:** none
* **Success Response**
  * **Code:** 200
  * **Content:** `{ "status": "Success", "message": "Loaded resource: ....", "data": { "id": 1, "name": ..., "url": ..., "credit": ..., "description": ..., "category_id": ..., "created_at": ..., "updated_at": ... } }`

## Index Categories

* **URL**
    `/api/v1/categories/`
* **Method:**
    `GET`
* **Data Params:**
    **Required:** none
* **Success Response**
  * **Code:** 200
  * **Content:** `{ "status": "Success", "message": "Loaded all categories.", "data": [ { "id": 1, "name": ..., "description": ..., "created_at": ..., "updated_at": ... } ] }`

## Show Category

* **URL**
    `/api/v1/categories/:id`
* **Method:**
    `GET`
* **Data Params:**
    **Required:** none
* **Success Response**
  * **Code:** 200
  * **Content:** `{ "status": "Success", "message": "Loaded all categories.", "data": [ { "id": 1, "name": ..., "description": ..., "created_at": ..., "updated_at": ..., "resources": [ { "id": 1, "name": ..., "url": ..., "credit": ..., "description": ..., "category_id": ..., "created_at": ..., "updated_at": ... }, { "id": 1, "name": ..., "url": ..., "credit": ..., "description": ..., "category_id": ..., "created_at": ..., "updated_at": ... } ] } ] }`

## Built With

* [Rails](http://rubyonrails.org/) - Web Framework
* [rbenv](https://github.com/rbenv/rbenv) - Environment Managemet
* [Bundler](http://bundler.io/) - Dependency Management
* [Heroku](https://www.heroku.com/) - Deployment Platform
* [Travis CI](https://travis-ci.org/) - Continuous Integration
* [Code Climate](https://codeclimate.com) - Code Quality Checks

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on the code of conduct, and the process for submitting pull requests.

## Versioning

v. 1.0 - Initial API release

## Authors

* **Chazona Baum** - Initial work

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for more details.

## Acknowledgements
