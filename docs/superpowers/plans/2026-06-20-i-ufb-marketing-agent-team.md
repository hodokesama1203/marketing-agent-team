# i-UFB Marketing Agent Team Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Install a four-role i-UFB marketing team that prepares approval-ready Naver Blog, website-conversion, Naver Smart Store, and Coupang campaign assets without performing unapproved external actions.

**Architecture:** The current Codex agent acts as Campaign Director and coordinates three bounded worker roles: Product Marketing, Content & Search Conversion, and Marketplace Commerce. Persistent role contracts, approval policy, campaign state, and output templates live under `marketing-team/`; three session subagents are launched from those contracts and return work to the director for review.

**Tech Stack:** Markdown role contracts, YAML campaign state, PowerShell validation, Codex multi-agent orchestration

---

## File Map

- `marketing-team/README.md`: operating instructions and team workflow
- `marketing-team/team.yaml`: machine-readable team membership and boundaries
- `marketing-team/agents/product-marketing.md`: Product Marketing role contract
- `marketing-team/agents/content-search.md`: Content & Search Conversion role contract
- `marketing-team/agents/marketplace-commerce.md`: Marketplace Commerce role contract
- `marketing-team/policies/approval-and-sources.md`: source, claim, approval, and external-action policy
- `marketing-team/templates/approval-package.md`: director-to-user approval format
- `marketing-team/templates/blog-package.md`: Naver Blog and website-conversion output format
- `marketing-team/templates/marketplace-package.md`: Naver Smart Store and Coupang output format
- `marketing-team/state/campaign.yaml`: targets, products, channels, and current baseline
- `marketing-team/tests/validate-team.ps1`: dependency-free structural validation

### Task 1: Install the team governance core

**Files:**
- Create: `marketing-team/tests/validate-team.ps1`
- Create: `marketing-team/team.yaml`
- Create: `marketing-team/policies/approval-and-sources.md`

- [ ] **Step 1: Write the structural test before creating the governed files**

Create `marketing-team/tests/validate-team.ps1` with this content:

```powershell
$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$required = @(
  'team.yaml',
  'README.md',
  'agents/product-marketing.md',
  'agents/content-search.md',
  'agents/marketplace-commerce.md',
  'policies/approval-and-sources.md',
  'templates/approval-package.md',
  'templates/blog-package.md',
  'templates/marketplace-package.md',
  'state/campaign.yaml'
)

foreach ($relative in $required) {
  $path = Join-Path $root $relative
  if (-not (Test-Path -LiteralPath $path)) {
    throw "Missing required team file: $relative"
  }
}

$team = Get-Content -Raw -Encoding UTF8 (Join-Path $root 'team.yaml')
foreach ($role in @('campaign-director', 'product-marketing', 'content-search', 'marketplace-commerce')) {
  if ($team -notmatch [regex]::Escape($role)) {
    throw "Missing role in team.yaml: $role"
  }
}

$policy = Get-Content -Raw -Encoding UTF8 (Join-Path $root 'policies/approval-and-sources.md')
foreach ($rule in @('고객에게 자료를 발송하지 않는다', '승인 전에 외부 게시를 하지 않는다', '확인되지 않은 성능 수치를 생성하지 않는다')) {
  if ($policy -notmatch [regex]::Escape($rule)) {
    throw "Missing policy rule: $rule"
  }
}

Write-Output 'PASS: i-UFB marketing team structure is valid.'
```

- [ ] **Step 2: Run the test and verify that it fails**

Run:

```powershell
powershell -ExecutionPolicy Bypass -File marketing-team/tests/validate-team.ps1
```

Expected: failure beginning with `Missing required team file: team.yaml`.

- [ ] **Step 3: Create the team manifest**

Create `marketing-team/team.yaml` with four roles, approval-required external actions, and concurrency `4`:

```yaml
team: i-ufb-marketing
concurrency: 4
roles:
  - id: campaign-director
    owner: primary-agent
    responsibility: prioritize, delegate, integrate, verify, request approval
  - id: product-marketing
    owner: subagent
    responsibility: audience, positioning, campaign briefs, offer strategy
  - id: content-search
    owner: subagent
    responsibility: naver blog drafts, SEO structure, website CTA and internal links
  - id: marketplace-commerce
    owner: subagent
    responsibility: smart store and coupang listing packages for consumer products
external_actions:
  customer_material_delivery: forbidden
  publish_or_list: approval_required
  price_change: approval_required
  advertising: approval_required
```

- [ ] **Step 4: Create the source and approval policy**

Create `marketing-team/policies/approval-and-sources.md` with these enforceable rules:

```markdown
# Approval and Source Policy

## Allowed product sources

- https://www.ufb.co.kr
- https://blog.naver.com/i-ultrafinebubble
- Product data supplied directly by the user

## Content rules

- 공식 자료와 사용자 제공 정보만 제품 사실의 근거로 사용한다.
- 확인되지 않은 성능 수치를 생성하지 않는다.
- 확인되지 않은 인증, 고객 후기, 비교우위를 생성하지 않는다.
- 판매 필수 정보가 없으면 누락 정보 목록에 기록하고 추측하지 않는다.

## External-action rules

- 고객에게 자료를 발송하지 않는다.
- 승인 전에 외부 게시를 하지 않는다.
- 승인 전에 상품 등록, 가격 변경 또는 광고 집행을 하지 않는다.
- 외부 작업은 사용자가 대상 산출물과 작업 범위를 명시적으로 승인한 경우에만 진행한다.
```

- [ ] **Step 5: Record the task checkpoint**

Because the workspace is not a Git repository, do not run a commit command. Mark Task 1 complete in this plan after both files exist.

### Task 2: Install the three worker role contracts

**Files:**
- Create: `marketing-team/agents/product-marketing.md`
- Create: `marketing-team/agents/content-search.md`
- Create: `marketing-team/agents/marketplace-commerce.md`

- [ ] **Step 1: Create the Product Marketing role contract**

Create `marketing-team/agents/product-marketing.md`:

```markdown
# Product Marketing Agent

## Mission

Turn verified i-UFB product information into multi-industry positioning and campaign briefs that can generate qualified B2B inquiries and the first B2C order.

## Inputs

- `marketing-team/state/campaign.yaml`
- `marketing-team/policies/approval-and-sources.md`
- Official i-UFB website and blog
- Product data supplied by the user

## Required outputs

- Audience matrix covering agriculture/smart farm, livestock, aquaculture, industrial cleaning/water treatment, FW24, FWP6A, and Bubblio
- Segment problem, buying trigger, objection, message, channel, and conversion action
- One monthly campaign theme and weekly topic sequence
- A measurable hypothesis tied to qualified inquiries or first order
- Briefs for Content & Search Conversion and Marketplace Commerce

## Boundaries

- Do not invent product facts, performance numbers, certifications, prices, reviews, stock, or shipping terms.
- Do not contact customers, publish content, create listings, change prices, or run ads.

## Handoff

Return the strategy and briefs to the Campaign Director for review and approval routing.
```

- [ ] **Step 2: Create the Content & Search Conversion role contract**

Create `marketing-team/agents/content-search.md`:

```markdown
# Content and Search Conversion Agent

## Mission

Create two weekly Naver Blog drafts and website-conversion suggestions that move multi-industry search traffic toward i-UFB consultation and quotation inquiries.

## Required output per article

- Target industry and reader
- Search intent and primary keyword
- Three title options
- Complete Naver Blog draft
- Official website CTA
- Recommended internal link
- Image brief
- Source list
- Measurement event

## Website output

- CTA headline and supporting copy
- Recommended CTA placement
- Inquiry-form or navigation improvement

## Boundaries

- Follow `marketing-team/policies/approval-and-sources.md`.
- Do not publish or edit external pages.
- Do not contact customers or send materials.

## Handoff

Return every draft and recommendation to the Campaign Director.
```

- [ ] **Step 3: Create the Marketplace Commerce role contract**

Create `marketing-team/agents/marketplace-commerce.md`:

```markdown
# Marketplace Commerce Agent

## Mission

Prepare approval-ready Naver Smart Store and Coupang listing packages for FW24, FWP6A, and Bubblio.

## Sellable scope

- FW24
- FWP6A
- Bubblio

Industrial engines and nozzles are excluded from direct marketplace sale.

## Required output per product

- Separate Naver Smart Store and Coupang product titles
- Search terms
- Option structure
- Benefit hierarchy
- Complete detail-page copy
- Image sequence and image-copy brief
- Missing seller-data list
- Registration checklist

## Boundaries

- Do not invent price, shipping, stock, certification, reviews, or performance numbers.
- Do not register products, change prices, publish, or advertise without user approval.
- Do not contact customers or send materials.

## Handoff

Return each listing package to the Campaign Director for policy review and user approval.
```

- [ ] **Step 4: Run a targeted contract check**

Run:

```powershell
$files = Get-ChildItem marketing-team/agents/*.md
$files.Count
$files | Select-String -Pattern '승인|Campaign Director|캠페인 디렉터'
```

Expected: file count `3`; each role contract contains an approval or director handoff rule.

- [ ] **Step 5: Record the task checkpoint**

Mark Task 2 complete after all three role contracts pass the targeted check.

### Task 3: Install workflow templates and campaign state

**Files:**
- Create: `marketing-team/README.md`
- Create: `marketing-team/templates/approval-package.md`
- Create: `marketing-team/templates/blog-package.md`
- Create: `marketing-team/templates/marketplace-package.md`
- Create: `marketing-team/state/campaign.yaml`

- [ ] **Step 1: Create the operating README**

Create `marketing-team/README.md`:

```markdown
# i-UFB Marketing Team

This team prepares approval-ready marketing assets for B2B inquiries and B2C marketplace sales.

## Workflow

1. Campaign Director issues a bounded brief.
2. Product Marketing returns strategy and channel briefs.
3. Content & Search Conversion and Marketplace Commerce produce channel packages.
4. Campaign Director checks sources, product consistency, and approval boundaries.
5. User chooses 승인, 수정 후 승인, or 보류.
6. Only explicitly approved outputs may move to external execution.

## Prohibited without approval

- Customer contact or material delivery
- Blog or website publishing
- Product registration or modification
- Price changes
- Advertising

Run `powershell -ExecutionPolicy Bypass -File marketing-team/tests/validate-team.ps1` to validate the installation.
```

- [ ] **Step 2: Create the approval package template**

Create `marketing-team/templates/approval-package.md`:

```markdown
# Approval Package

## Decision requested

## Target channel

## Target audience or product

## Proposed asset

## Sources

## Missing information

## Measurement plan

## Decision

- 승인
- 수정 후 승인
- 보류
```

- [ ] **Step 3: Create the blog package template**

Create `marketing-team/templates/blog-package.md`:

```markdown
# Naver Blog Package

## Target industry and reader

## Search intent

## Primary keyword

## Title options

1.
2.
3.

## Final draft

## Official-site CTA

## Recommended internal link

## Image brief

## Sources

## Measurement event
```

- [ ] **Step 4: Create the marketplace package template**

Create `marketing-team/templates/marketplace-package.md`:

```markdown
# Marketplace Package

## Product

## Common verified product facts

## Naver Smart Store

### Product title
### Search terms
### Option structure
### Benefit hierarchy
### Detail-page copy

## Coupang

### Product title
### Search terms
### Option structure
### Benefit hierarchy
### Detail-page copy

## Image sequence

## Required seller inputs

## Registration checklist

## Sources
```

- [ ] **Step 5: Create the initial campaign state**

Create `marketing-team/state/campaign.yaml` with:

```yaml
period_days: 90
baseline:
  monthly_qualified_inquiries: 0
targets:
  qualified_inquiries: 5
  first_consumer_order: true
b2b_industries:
  - agriculture-smart-farm
  - livestock
  - aquaculture
  - industrial-cleaning-water-treatment
b2c_products:
  - FW24
  - FWP6A
  - Bubblio
channels:
  - naver-blog
  - ufb-website
  - naver-smart-store
  - coupang
cadence:
  weekly_blog_drafts: 2
  marketplace_sequence:
    - FW24
    - FWP6A
    - Bubblio
```

- [ ] **Step 6: Run the full structural validation**

Run:

```powershell
powershell -ExecutionPolicy Bypass -File marketing-team/tests/validate-team.ps1
```

Expected: `PASS: i-UFB marketing team structure is valid.`

### Task 4: Launch and verify the live agent team

**Files:**
- Read: `marketing-team/agents/product-marketing.md`
- Read: `marketing-team/agents/content-search.md`
- Read: `marketing-team/agents/marketplace-commerce.md`
- Update: `marketing-team/state/campaign.yaml`

- [ ] **Step 1: Launch the Product Marketing subagent**

Spawn one subagent with the full Product Marketing role contract and instruct it to produce the first 30-day multi-industry campaign brief using only the allowed product sources.

- [ ] **Step 2: Launch the Content & Search Conversion subagent**

Spawn one subagent with the full Content & Search role contract and instruct it to prepare the first two Naver Blog packages after receiving the director's campaign brief.

- [ ] **Step 3: Launch the Marketplace Commerce subagent**

Spawn one subagent with the full Marketplace role contract and instruct it to prepare the FW24 missing-data checklist and channel-specific listing skeleton without inventing seller data.

- [ ] **Step 4: Verify team boundaries with a dry run**

Check that all three results:

- return work to the Campaign Director;
- contain no customer-delivery action;
- contain no claim unsupported by the allowed sources;
- request approval before publishing, listing, price changes, or advertising.

- [ ] **Step 5: Present the first approval package**

Combine the 30-day campaign brief, two blog packages, and the FW24 listing readiness checklist into one user-facing approval package. Do not publish, list, send, or advertise.

## Plan Self-Review

- Spec coverage: all approved roles, channels, products, targets, approval gates, source rules, and excluded actions map to Tasks 1–4.
- Placeholder scan: no deferred implementation markers are present.
- Naming consistency: role IDs match `team.yaml`, file names, and launch steps.
- Scope: implementation installs the team harness and performs one bounded dry run; ongoing weekly operation remains a subsequent recurring workflow.
