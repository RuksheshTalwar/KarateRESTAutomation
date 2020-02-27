
Feature: check returned list of users
  Background:
  	* url 'https://reqres.in/'
  	* header Accept = 'application/json'
  	

  Scenario: get list of users
    Given path '/api/users'
    And   param page = '2'
    When  method get
    Then  status 200
    
    And def userResponse = response
    Then match userResponse.data[0] == { "id": 7,"email": "michael.lawson@reqres.in", "first_name": "Michael","last_name": "Lawson",	"avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/follettkyle/128.jpg" }
    
    Then match each userResponse.data[*].id  == '#number'
    Then match each userResponse.data[*].first_name  == '#string'
    Then match each userResponse.data[*].avatar contains "https://"
    Then match each userResponse.data[*].email contains "@reqres.in"