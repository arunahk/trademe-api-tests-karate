# TradeMe API Test Suite
[![Build Status](https://circleci.com/gh/arunahk/tmsandbox-api-tests.svg?style=svg)](https://app.circleci.com/pipelines/github/arunahk/tmsandbox-api-tests?branch=main)

## Challenge

Using the API given below create an automated test with the listed acceptance criteria:

[API](https://api.tmsandbox.co.nz/v1/Categories/6327/Details.json?catalogue=false)

#### Acceptance Criteria:

```
Name = "Carbon credits"
CanRelist = true
The Promotions element with Name = "Gallery" has a Description that contains the text "2x larger image"
```

#### Instructions:

* Your test needs to be written using a programming language of your choice (not a tool like SoapUI). Ensure you include a clear ReadMe
* Submit your test to us in a format that lets us execute and review the code (it must be submitted in a public repository like Bitbucket or Github)
* Your test must validate all the three acceptance criteria
* Points will be awarded for meeting the criteria, style and the use of good practices and appropriate use of source control
* We want to see your best work - no lazy coding or comments.
* We would appreciate it if you could please return your submission within one week of this email.

#### Requirements

- [JRE 1.8+](https://www.java.com/en/download/manual.jsp)
- [maven](https://maven.apache.org)

## Test Execution

### run test

* Execute tests in development environment

`mvn test`

* Execute tests in a specified environment

`mvn test -Dkarate.env=prod`

# Questions to ask
* Do you have the specification for API?
* Is there a JSON Schema available?