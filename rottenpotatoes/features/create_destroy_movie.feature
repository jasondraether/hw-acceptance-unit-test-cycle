Feature: Create and destroy movie on website 
 
  As a RottenPotatoes user 
  So that I can see new movies or delete old ones 
  I want to be able to add and destroy movies 

Background: movies have been added to database

  Given the following movies exist:
  | title        | rating | director     | release_date |
  | Star Wars    | PG     | George Lucas |   1977-05-25 |
  | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
  | Alien        | R      |              |   1979-05-25 |
  | THX-1138     | R      | George Lucas |   1971-03-11 |

  And  I am on the RottenPotatoes home page

Scenario: Create movie 
  When I add a new movie 
  And I fill in "Title" with "Amelie"
  And I select "R" from "Rating"
  And I select date "25-Apr-2001" from "Released On"
  Then I press "Save Changes"
  Then I should see "Amelie"

Scenario: Destroy movie 
  Given I am on the details page for "Blade Runner"
  When I press "Delete"
  Then I should be on the home page 
  And I should see "Movie 'Blade Runner' deleted."
  And I should not see the "Blade Runner" movie