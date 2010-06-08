Feature: Posts
  In order to expose the world to my thinking
  As a blogger
  I want create and publish posts

  Scenario: Successfully creating posts
    Given I am on the home page
    When I follow "New Post"
    And I fill in "Title" with "First post"
    And I fill in "Body" with "Blah blah"
    And I press "Create post"
    Then I should be on the posts index page
    And I should see "Successfully created post."
    And a post should exist with title: "First post"

  Scenario: Successfully creating posts
    Given I am on the home page
    When I follow "New Post"
    And I fill in "Body" with "Blah blah"
    And I press "Create post"
    Then I should see "Failed to create post."
    And a post should not exist with title: "First post"
