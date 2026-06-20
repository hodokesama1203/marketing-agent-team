# i-UFB Marketing Agent Team

Approval-gated multi-agent marketing harness for i-UFB.

The team prepares:

- Multi-industry B2B campaigns for Naver Blog and the i-UFB website
- Naver Smart Store and Coupang listing packages for FW24, FWP6A, and Bubblio
- Evidence-labeled drafts, measurement definitions, and user approval packages

External publishing, marketplace actions, pricing, and advertising require separate explicit user approval. Customer contact and material delivery are permanently forbidden for this team.

## Structure

- `marketing-team/`: roles, policy, templates, state, validator, and first dry-run outputs
- `docs/superpowers/specs/`: approved team design
- `docs/superpowers/plans/`: implementation plan

## Validate

```powershell
powershell -ExecutionPolicy Bypass -File marketing-team/tests/validate-team.ps1
```
