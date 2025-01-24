# NestJS Request without UseGuards

This query detects NestJS controllers that do not have a UseGuards decorator.  

## Recommendation

NestJS endpoints and must include a decorator on the endpoint that references a type guard (for authorization checks).

Guards have a single responsibility. They determine whether a given request will be handled by the route handler or not, depending on certain conditions (like permissions, roles, ACLs, etc.) present at run-time. 

```ts
import {Controller } from '@nestjs/common'

// BAD: No @UseGuards
@Controller()
export class AppController {
...
```


```ts
import { Controller, UseGuards } from '@nestjs/common'

// GOOD: uses @UseGuards
@Controller('/doctors')
@UseGuards(new RolesGuard())
export default class DoctorsController{
...
```

## References
- [guards | NestJS](https://docs.nestjs.com/guards)
