Feature: Test category details

  Background: Setup API Server
    # set base path
    * print baseUrl
    * url baseUrl + '/v1/Categories/'

  Scenario Outline: Get categories and verify Promo Description
    Given path '<CategoryId>/Details.json'
    And param catalogue = false
    When method get
    Then status 200

    * def resp = response

    Then match resp.CategoryId == <CategoryId>
    And match resp.Name == '<Name>'
    And match resp.CanRelist == true
    And match resp.Promotions[*].Name contains '<Promo>'

    * def promo = get[0] resp.Promotions[?(@.Name=='<Promo>')]
    * print promo
    * print promo.Description
    Then match promo.Description contains '<PromoDescription>'

    Examples:
      | CategoryId | Name           | Promo   | PromoDescription |
      | 6327       | Carbon credits | Gallery | 2x larger image  |
      | 6329       | Home & garden  | Feature | Better position  |