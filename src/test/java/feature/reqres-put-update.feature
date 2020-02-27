
Feature: check put update request succesful
  Background:
  	* url 'https://reqres.in/'
  	* header Accept = 'application/json'

  Scenario: put update request
    Given path '/api/users/2'
    And request { "name": "morpheus", "job": "zion resident" }
    When method put
    Then status 200
    
    And def userResponse = response
    Then assert userResponse.job == 'zion resident'