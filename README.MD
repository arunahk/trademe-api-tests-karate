# TradeMe API Test Suite

[![Build Status](https://circleci.com/gh/arunahk/trademe-api-tests-karate.svg?style=svg)](https://app.circleci.com/pipelines/github/arunahk/trademe-api-tests-karate)

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

#### Build Requirements

- [JRE 1.8+](https://www.java.com/en/download/manual.jsp)
- [maven](https://maven.apache.org)

## Test Scope

* Service unavailability tests were assumed out-of-scope
* Service is assumed to be available for public use without any authentication

## Test Execution

### Run tests

* Execute tests in development environment

`mvn test`

* Execute tests in a specified environment

`mvn test -Dkarate.env=prod`

## Test Reports

Karate framework generates old style junit and cucumber reports.

#### Cucumber Reports: `target/cucumber-html-reports`

![Cucumber Reports](cucumber-report.png?raw=true)

#### Karate Reports: `target/test-reports`

![Karate Reports](karate-report.png?raw=true)

#### CircleCI Integration
* Repository integrated with CircleCI to run tests automatically and build status is displayed in the repository
[https://circleci.com/gh/arunahk/trademe-api-tests-karate](https://circleci.com/gh/arunahk/trademe-api-tests-karate)
