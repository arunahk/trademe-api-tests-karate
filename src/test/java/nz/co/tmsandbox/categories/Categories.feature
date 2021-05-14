Feature: Test category details

  Background: Setup API Server
    # set base path
    * print baseUrl
    * url baseUrl + '/v1/Categories/'

  Scenario Outline: verify promo description '<PromoDescription>' of promotion '<Promo>' in category '<CategoryName>'
    Given path '<CategoryId>/Details.json'
    And param catalogue = '<Catalogue>'
    When method get
    Then status <Status>

    * def resp = response
    * def contentType = responseHeaders['Content-Type'][0]
    Then match contentType == 'application/json'

    And match resp.CategoryId == <CategoryId>
    And match resp.Name == '<CategoryName>'
    And match resp.CanRelist == <CanRelist>
    And match resp.Promotions[*].Name contains '<Promo>'

    * def promo = get[0] resp.Promotions[?(@.Name=='<Promo>')]
    * print promo
    Then match promo.Description contains '<PromoDescription>'

    @Positive
    Examples:
      | CategoryId | Catalogue | CanRelist | Status | CategoryName   | Promo   | PromoDescription |
      | 6329       | false     | true      | 200    | Home & garden  | Feature | Better position  |
      | 6327       | false     | true      | 200    | Carbon credits | Gallery | 2x larger image  |
      | 6327       | true      | true      | 200    | Carbon credits | Gallery | 2x larger image  |
      | 6327       |           | true      | 200    | Carbon credits | Gallery | 2x larger image  |

  @Negative
  Scenario Outline: Verify category responses for invalid query parameters CategoryID = '<CategoryId>', isCatalogue = '<Catalogue>'
    Given path '<CategoryId>/Details.json'
    And param catalogue = '<Catalogue>'
    When method get
    Then status <Status>

    * def resp = response
    * def contentType = responseHeaders['Content-Type'][0]

    Then match contentType == 'text/html'
    Then match resp contains 'Server Error'
    @Negative
    Examples:
    # For the following tests, the expected responses for given requests are assumed as specified
      | CategoryId | Catalogue | Status |
      |            |           | 404    |
      |            | false     | 404    |
      | abc        | false     | 404    |
      | abc$!@4    | false     | 404    |