
Feature: check returned single user
  Background:
  	* url 'https://reqres.in/'
  	* header Accept = 'application/json'
  	
  Scenario: calling POST feature with parameters
    * def result = call read('reqres-create-post.feature') { name: 'morpheus' }
    * def userResponse = result.response
    * print userResponse
    * assert userResponse.job == 'leader'

  Scenario: get list of users
    Given path '/api/users/2'
    When method get
    Then status 200