Feature: Adding a task

  Background:
    Given I am a new, authenticated user
    Given a project with two tasks

  @javascript
  Scenario: I can add and change the priority of a new task
    When I visit the project page
    Then I complete the new task form
    And I see the new task is last in the list
    And I see the middle task is in the list
    When I click to move the new task up
    And the new task is in the middle of the list
