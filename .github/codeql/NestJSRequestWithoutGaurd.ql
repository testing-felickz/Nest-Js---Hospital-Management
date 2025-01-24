/**
 * @name NestJS Controller without UseGuards
 * @description Finds NestJS controllers that do not have a UseGuards decorator.
 * @kind problem
 * @problem.severity warning
 * @id js/nestjs-controller-without-useguards
 * @tags security
 *       correctness
 *       external/cwe/cwe-284
 *       external/cwe/cwe-285
 *       external/cwe/cwe-862
 * @precision high
 *       
 */

import javascript

// Find all NestJS `@Controller`'s that do not have a `@UseGuards` decorator
from ClassDefinition controller, Decorator controllerDecorator, VarRef controllerVarRef
where
    controllerDecorator = controller.getADecorator() and
    controllerVarRef.getParentExpr() = controllerDecorator.getExpression() and
    controllerVarRef.getName() = "Controller" and
    not exists(Decorator guardDecorator, VarRef guardVarRef |
        guardDecorator = controller.getADecorator() and
        guardVarRef.getParentExpr() = guardDecorator.getExpression() and
        guardVarRef.getName() = "UseGuards"
    )
select controllerVarRef, "This $@ does not have a @UseGuards decorator.", controller, "endpoint"
