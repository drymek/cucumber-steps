Feature: First feature

  As a developer
  I want to make a GET request
  In order to test my API with CucumberJS

  Scenario:
    When I send a GET request to "/api/users/2"
    Then the response code should be 200
    And the JSON should match pattern
    """
    {
        "data": {
            "id": 2,
            "firstName": "lucille",
            "lastName": "bluth",
            "avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/josephstein/128.jpg"
        }
    }
    """


  Scenario:
    When I send a POST request to "/api/users" with body:
    """
    {
        "name": "morpheus",
        "job": "leader"
    }
    """
    Then the response code should be 201
    And the JSON should match pattern
    """
    {
        "name": "morpheus",
        "job": "leader",
        "id": "@integer@",
        "age": "@integer@",
        "createdAt": "@date@"
    }
    """

  Scenario:
    Given I set header Content-Type with value "application/text"
    When I send a GET request to "/header"
    Then the JSON should match pattern
    """
    {
      "content-type": "application/text"
    }
    """
