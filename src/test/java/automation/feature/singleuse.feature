Feature: Single use account automation
  Background:
    * url 'http://localhost:3000/api/v1/is_single_use'

  Scenario: check the phone number
    Given path '?phone_number=4593706933'
    When method get
    Then status 200

  Scenario: Empty phone number
    Given path '?phone_number='
    When method get
    Then status 200

  Scenario: Check the phone number which is not in the database
   # Given path '?phone_number='0000000000'
    Given params {phone_number:0000000000}
    When method Get
    Then status 404

  Scenario:  Phone number more than 20 digit
    Given params {phone_number:12345654321123456789455}
    When method Get
    Then status 404

  Scenario: Phone number with character
      Given params {phone_number:'testphonenumber'}
      When method Get
      Then status 404
