# CodeQL Custom Query Sample

- Run with CodeQL via Advanced setup [here](https://github.com/testing-felickz/Nest-Js---Hospital-Management/blob/main/.github/workflows/codeql.yml#L71) 

![image](https://github.com/user-attachments/assets/5140cea3-04bc-46dd-ba8a-019247079750)


## [`NestJSRequestWithoutguard.ql`](https://github.com/testing-felickz/Nest-Js---Hospital-Management/blob/main/.github/codeql/NestJSRequestWithoutguard.ql)
- [Docs](https://github.com/testing-felickz/Nest-Js---Hospital-Management/blob/main/.github/codeql/NestJSRequestWithoutguard.md)

### Purpose
This CodeQL query identifies NestJS enpoints (currently controllers) that do not have a `@UseGuards` decorator. The absence of this decorator can indicate a potential security risk, as it means that the controller's endpoints may not be properly protected by authorization guards.

### Description
- **Query Name**: NestJS Controller without UseGuards
- **Severity**: Warning
- **Tags**: Security, Correctness, CWE-284, CWE-285, CWE-862
- **Precision**: High

### How It Works
1. **Imports**: The query imports the `javascript` library to analyze JavaScript/TypeScript code.
2. **Class and Decorator Identification**: The query looks for class definitions (`ClassDefinition`) that have a `@Controller` decorator.
3. **Decorator Check**: It checks if these classes do not have a `@UseGuards` decorator.
4. **VarRef Usage**: The query uses `VarRef` to get the names of the decorators and ensure they match `Controller` and `UseGuards`.
5. **Exclusion**: If a class has a `@Controller` decorator but does not have a `@UseGuards` decorator, it is selected as a potential issue.

### Potential Enhancements
- Allow for controllers without guards if all endpoints have guards applied.
- Allow for a list of known endpoints where guards are not required.
- Detect the use of global scoped guards (`app.useGlobalGuards`).
- Detect guards that do not apply authorization (heuristics by name or by allowlist in data extensions).
- Add a security severity tag with a CVSS score for more granular severity classification.

### Example
```typescript
import {Controller } from '@nestjs/common'

// BAD: No @UseGuards
@Controller()
export class AppController {
...
```


```typescript
import { Controller, UseGuards } from '@nestjs/common'

// GOOD: uses @UseGuards
@Controller('/doctors')
@UseGuards(new RolesGuard())
export default class DoctorsController{
...
```


# Nest Sample


<p align="center">
  <a href="http://nestjs.com/" target="blank"><img src="https://nestjs.com/img/logo_text.svg" width="320" alt="Nest Logo" /></a>
</p>

[circleci-image]: https://img.shields.io/circleci/build/github/nestjs/nest/master?token=abc123def456
[circleci-url]: https://circleci.com/gh/nestjs/nest

  <p align="center">A progressive <a href="http://nodejs.org" target="_blank">Node.js</a> framework for building efficient and scalable server-side applications.</p>
    <p align="center">
<a href="https://www.npmjs.com/~nestjscore" target="_blank"><img src="https://img.shields.io/npm/v/@nestjs/core.svg" alt="NPM Version" /></a>
<a href="https://www.npmjs.com/~nestjscore" target="_blank"><img src="https://img.shields.io/npm/l/@nestjs/core.svg" alt="Package License" /></a>
<a href="https://www.npmjs.com/~nestjscore" target="_blank"><img src="https://img.shields.io/npm/dm/@nestjs/common.svg" alt="NPM Downloads" /></a>
<a href="https://circleci.com/gh/nestjs/nest" target="_blank"><img src="https://img.shields.io/circleci/build/github/nestjs/nest/master" alt="CircleCI" /></a>
<a href="https://coveralls.io/github/nestjs/nest?branch=master" target="_blank"><img src="https://coveralls.io/repos/github/nestjs/nest/badge.svg?branch=master#9" alt="Coverage" /></a>
<a href="https://discord.gg/G7Qnnhy" target="_blank"><img src="https://img.shields.io/badge/discord-online-brightgreen.svg" alt="Discord"/></a>
<a href="https://opencollective.com/nest#backer" target="_blank"><img src="https://opencollective.com/nest/backers/badge.svg" alt="Backers on Open Collective" /></a>
<a href="https://opencollective.com/nest#sponsor" target="_blank"><img src="https://opencollective.com/nest/sponsors/badge.svg" alt="Sponsors on Open Collective" /></a>
  <a href="https://paypal.me/kamilmysliwiec" target="_blank"><img src="https://img.shields.io/badge/Donate-PayPal-ff3f59.svg"/></a>
    <a href="https://opencollective.com/nest#sponsor"  target="_blank"><img src="https://img.shields.io/badge/Support%20us-Open%20Collective-41B883.svg" alt="Support us"></a>
  <a href="https://twitter.com/nestframework" target="_blank"><img src="https://img.shields.io/twitter/follow/nestframework.svg?style=social&label=Follow"></a>
</p>
  <!--[![Backers on Open Collective](https://opencollective.com/nest/backers/badge.svg)](https://opencollective.com/nest#backer)
  [![Sponsors on Open Collective](https://opencollective.com/nest/sponsors/badge.svg)](https://opencollective.com/nest#sponsor)-->

## Description

[Nest](https://github.com/nestjs/nest) framework TypeScript starter repository.

## Installation

```bash
$ npm install
```

## Running the app

```bash
# development
$ npm run start

# watch mode
$ npm run start:dev

# production mode
$ npm run start:prod
```

## Test

```bash
# unit tests
$ npm run test

# e2e tests
$ npm run test:e2e

# test coverage
$ npm run test:cov
```

## Support

Nest is an MIT-licensed open source project. It can grow thanks to the sponsors and support by the amazing backers. If you'd like to join them, please [read more here](https://docs.nestjs.com/support).

## Stay in touch

- Author - [Kamil Myśliwiec](https://kamilmysliwiec.com)
- Website - [https://nestjs.com](https://nestjs.com/)
- Twitter - [@nestframework](https://twitter.com/nestframework)

## License

Nest is [MIT licensed](LICENSE).
