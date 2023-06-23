Feature: Testando o Poke API

Background: Executa antes de cada teste
    * def url_base = 'https://pokeapi.co/api/v2/'


Scenario: Testando retorno de pokemons
        Given url url_base
        And path 'pokemon'
        When method get
        Then status 200

Scenario: Testando o retorno de pokemons com informações inválidas.
        Given url url_base
        And path 'pokemon/remedio'
        When method get
        Then status 404

Scenario: Testando o retorno do primeiro pokemon.
        Given url url_base
        And path 'products/1'
        When method get
        Then status 200
        And match response.id == 1
        And match response.name == "bulbasaur"

Scenario: Testando solicitação com método HTTP inválido
        Given url url_base
        And path 'pokemon'
        When method delete
        Then status 404

Scenario: checando a contagem de pokemons recebidos
        Given url url_base
        And path 'pokemons'
        When method get
        Then status 200
        And match response.count == 1281
        And request request_json_post


