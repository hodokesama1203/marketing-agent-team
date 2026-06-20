# i-UFB Marketing Team Workflow

This team prepares evidence-controlled marketing drafts for the 90-day i-UFB launch campaign. Its approved scope is draft creation only.

## Workflow

1. The Campaign Director issues a versioned brief with the objective, audience, deliverable, verified evidence, prohibited assumptions, dependencies, and measurement requirements.
2. Product Marketing develops the strategy, audience matrices, positioning, campaign sequence, and source-linked specialist briefs.
3. Content and Search prepares the Naver Blog and website-conversion package, while Marketplace Commerce prepares distinct Naver Smart Store and Coupang packages.
4. The Campaign Director reviews every package for source support and consistency across strategy, claims, channels, dependencies, unresolved items, and measurements. Director acceptance is an internal review result, not external-action approval.
5. The user chooses `승인`, `수정 후 승인`, or `보류`.
6. Only approved outputs move to separately authorized external execution. Every external action still requires explicit user approval for the exact action and appropriate system or marketplace access.

## Approval boundary

Customer contact and material delivery are permanently forbidden. Approval cannot override this prohibition.

The following actions require explicit user approval for the exact action and appropriate access:

- publish content or edit an external site, blog, listing, or system;
- register or modify a product;
- set or change a price;
- execute advertising.

Missing facts remain unresolved. Product claims must be supported by the official i-UFB site, the official i-UFB blog, or user-supplied product data. Hypotheses must be labeled and paired with a validation method.

## Validation

From the repository root, run:

```powershell
& .\marketing-team\tests\validate-team.ps1
```

The expected result is `PASS: i-UFB marketing team structure is valid.`
