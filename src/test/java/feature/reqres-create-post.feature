
Feature: check post create request succesful
  Background:
  	* url 'https://reqres.in/'
  	* header Accept = 'application/json'

  Scenario: post create request
  
  * def readFunc =
"""
function(args) {
  var CalledFile = Java.type('feature.CalledFile');
  var cF = new CalledFile();
  return cF.read(args);
}
""" 
    Given path '/api/users/'
    And request { name: '#(name)', job: 'leader' }
    When method post
		Then status 201
		* def result = call readFunc {'key': 'world'}
		* print result 