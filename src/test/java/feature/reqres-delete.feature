
Feature: check delete request succesful
  Background:
  	* url 'https://reqres.in/'
  	* header Accept = 'application/json'

  Scenario: delete request
    Given path '/api/users/2'
    When method DELETE
    Then status 204