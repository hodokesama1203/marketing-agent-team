# FW24 Marketplace Readiness / Listing Skeleton

## Package identity and boundary

- Campaign ID: `i-ufb-launch-90d`
- Version ID: `v1-marketplace-fw24-readiness`
- Upstream brief: `v1-product-marketing-30d`
- Product: `FW24`
- Deliverable: Naver Smart Store and Coupang readiness/listing skeleton only
- Approval state: `draft`
- Acceptance status: `passed-for-user-review`
- Executable external scope: none
- Prohibited in this package: live registration, publication, pricing, advertising, account access, customer contact, and material delivery

This document is not a product listing and does not authorize one. The only product-specific fact used is that FW24 is a consumer washbasin model for the 24 mm specification. Everything else is either missing seller/product data or a clearly labeled hypothesis.

## Verified product facts

| ID | Fact | Evidence status | Source | Access date | Notes |
|---|---|---|---|---|---|
| P1 | FW24 is in the consumer/lifestyle product line and is for a washbasin with a 24 mm specification. | `verified` | https://www.ufb.co.kr/ufb/index.html | 2026-06-20 (Asia/Seoul) | Official page text: `생활용 라인 — FW 시리즈 / FW24 세면대용 (24mm 규격)`. This does not establish fit with any particular fixture. |
| P2 | FW24 is the first product in the campaign's marketplace sequence. | `user-supplied` | `marketing-team/state/campaign.yaml`; upstream 30-day campaign brief | 2026-06-20 | Campaign sequencing input, not a product claim. |

No price, stock, shipping, return, certification, review, performance, material, origin, dimensions beyond 24 mm, installation, included-parts, warranty, or broader compatibility evidence is available.

## Product-claim boundary

Allowed product wording in this draft:

- `FW24`
- `세면대용` / washbasin use context
- `24mm 규격` / 24 mm specification
- `생활용` / consumer-lifestyle line context

Not allowed until separately verified from an allowed product source or seller-authorized data:

- Any water-quality, cleaning, pressure, flow, skin, hygiene, saving, durability, convenience, or quantified benefit
- Compatibility with a named basin, faucet, connector, brand, model, or range beyond the literal 24 mm statement
- Installation steps, tool requirements, adapters, components, materials, origin, dimensions/weight, operating conditions, maintenance, warranty, certification, test, review, or comparative claim

## Decision evidence register

Every non-factual listing decision remains a hypothesis. Marketplace operational documentation is not product evidence.

| ID | Listing decision | Channel | Status | Evidence basis | Validation method | Resolution |
|---|---|---|---|---|---|---|
| D1 | Put `FW24` first in the title to make the exact model immediately identifiable. | Naver Smart Store | `hypothesis` | P1 plus unverified listing-framing judgment | In authenticated Smart Store help, verify current title policy; after an approved launch, compare attributable product-page visits and model-related questions against an approved alternative title. | Unresolved |
| D2 | Put the use context and 24 mm specification before the model in the title. | Coupang | `hypothesis` | P1 plus unverified listing-framing judgment | In authenticated Wing help, verify current title policy; after an approved launch, review search-query and product-question data without treating impressions as product evidence. | Unresolved |
| D3 | Use only model/context/specification terms as search-term candidates. | Both | `hypothesis` | P1; no keyword-volume evidence | Validate against each platform's current authenticated search-term rules and approved query data; remove terms that are prohibited, unsupported, or show mismatch intent. | Unresolved |
| D4 | Do not create options until seller-authorized SKU/option data exists. | Both | `user-supplied` | `campaign.yaml` has `seller_data.options: null`; governing agent instructions prohibit inference. | Seller supplies signed/traceable option and SKU register; reviewer matches every marketplace option to it. | Blocked by missing seller data |
| D5 | Lead with context, model, and a pre-purchase 24 mm check rather than an unverified performance benefit. | Both | `hypothesis` | P1 and evidence policy | Seller/technical owner verifies the precise meaning and measurement point of 24 mm; approved pre-launch comprehension review checks whether readers understand that fit is not yet guaranteed. | Unresolved |
| D6 | Withhold purchase persuasion and use a specification-review gate while compatibility and commerce data are missing. | Both | `hypothesis` | Upstream brief and missing-data state | Reassess only after the data checklist is complete and exact user approval is recorded. | Unresolved |
| D7 | Use a documentary image sequence centered on model identification, measurement evidence, components, and installation evidence. | Both | `hypothesis` | No approved imagery exists | Seller supplies rights-cleared assets; technical and claims reviewers approve every visible component, label, dimension, and caption. | Unresolved |

## Naver Smart Store skeleton

### Title

- Draft title: `FW24 세면대용 24mm 규격`
- Evidence label: product tokens `FW24`, `세면대용`, and `24mm 규격` are `verified: P1`; their order and title framing are `hypothesis: D1`.
- Before use: verify title length, prohibited-expression, duplication, brand/model, and category-specific rules in the authenticated official seller help center. No such rule is asserted in this draft.

### Search-term candidates

| Candidate | Label | Basis / constraint | Validation |
|---|---|---|---|
| `FW24` | `hypothesis` | Exact verified model token from P1; usefulness as a search term is unverified. | Check current official search-term rules and approved query data. |
| `세면대용` | `hypothesis` | Verified use-context token from P1; search intent is unverified. | Check platform rules and mismatch questions. |
| `24mm 규격` | `hypothesis` | Verified specification wording from P1; compatibility intent may be broader than evidence permits. | Confirm measurement point with seller/technical evidence and review approved query data. |

Do not add `호환`, `설치`, `절수`, `수압`, `세정`, `필터`, `인증`, or performance-oriented terms without allowed evidence.

### Options

- Verified options: **none supplied**.
- Listing state: option structure must remain blank; do not create `단일상품`, color, size, adapter, bundle, quantity, or component options by inference.
- Required gate: seller-authorized SKU/option register, option labels, seller SKU/barcode, price and stock per option, and exact included parts.

### Benefit hierarchy

This is an information hierarchy, not a performance-claim hierarchy.

1. `verified: P1` — Identify the item: FW24.
2. `verified: P1` — Identify the stated context: washbasin use.
3. `verified: P1` — Surface the stated specification: 24 mm.
4. `hypothesis: D5` — Ask the shopper to verify the exact measurement/fit evidence before purchase; do not claim compatibility.
5. `user-supplied / missing-data gate` — Show seller terms and evidence only after they are supplied and approved.

### Benefit block skeleton

- Primary line: `FW24 — 세면대용 24mm 규격` `[verified: P1]`
- Supporting line: `현재 확인된 제품 정보는 세면대용 및 24mm 규격입니다.` `[verified: P1]`
- Pre-purchase gate: `실제 적용 가능 여부를 판단하려면 측정 기준, 연결부, 구성품 및 설치 조건에 대한 판매자 확인 정보가 추가로 필요합니다.` `[hypothesis: D5; compatibility is not claimed]`
- CTA state: `판매자 검증 정보 준비 중` `[hypothesis: D6; no purchase CTA]`

### Complete detail-copy skeleton

> **FW24**  
> 세면대용 24mm 규격 `[verified: P1]`
>
> **확인된 정보**  
> FW24는 생활용 라인의 세면대용 제품이며, 공식 페이지에는 24mm 규격으로 표시되어 있습니다. `[verified: P1]`
>
> **구매 전 확인이 필요한 정보**  
> 24mm의 정확한 측정 위치와 방식, 연결부 규격, 적용 가능한 세면대/수전 범위, 어댑터 필요 여부, 구성품, 설치 방법과 도구, 사용 조건은 아직 확인되지 않았습니다. 이 정보가 판매자 자료로 검증되기 전에는 특정 설비와의 호환을 보장하지 않습니다. `[missing seller/product data; hypothesis framing: D5]`
>
> **상품 구성 및 사양**  
> 모델명: FW24 `[verified: P1]`  
> 용도 표기: 세면대용 `[verified: P1]`  
> 규격 표기: 24mm `[verified: P1]`  
> 재질 / 치수 / 중량 / 제조국 / 제조자 / 구성품 / 설치 / 유지관리 / 보증: 판매자 검증 정보 필요 `[unresolved]`
>
> **판매·배송·교환 정보**  
> 가격, 재고, 배송, 반품·교환, A/S 정보는 판매자 입력 및 승인이 필요합니다. `[unresolved]`
>
> **현재 상태**  
> 본 문안은 등록 전 준비 초안입니다. 제품 이미지, 상세 사양, 판매 조건과 승인이 완료되기 전에는 구매 안내 또는 등록에 사용할 수 없습니다. `[user-supplied boundary]`

## Coupang skeleton

### Title

- Draft title: `세면대용 24mm 규격 FW24`
- Evidence label: product tokens are `verified: P1`; title order/framing is `hypothesis: D2`.
- Before use: verify current product-name composition, prohibited-expression, duplication, brand/model, category, and option-display rules in authenticated Wing documentation. No such rule is asserted here.

### Search-term candidates

| Candidate | Label | Basis / constraint | Validation |
|---|---|---|---|
| `FW24` | `hypothesis` | Exact model token from P1; platform search value is unverified. | Verify current Wing rules and approved query data. |
| `세면대용 24mm` | `hypothesis` | Combines the two verified descriptors; shopper interpretation may imply compatibility. | Confirm the measurement definition and review mismatch questions after any approved launch. |
| `24mm 세면대용` | `hypothesis` | Alternate ordering for platform-specific discovery; no performance or fit claim intended. | Verify rule compliance and avoid duplicate/redundant term use if current policy disallows it. |

### Options

- Verified options: **none supplied**.
- Do not infer a single-item option, variation, bundle, adapter, quantity, or SKU.
- Required gate: same seller-authorized option/SKU register as the Naver package, reconciled to Coupang fields.

### Benefit hierarchy

1. `verified: P1` — State the use context first: washbasin.
2. `verified: P1` — State the 24 mm specification.
3. `verified: P1` — State the exact model: FW24.
4. `hypothesis: D5` — Put the compatibility evidence gap next to the specification, not in fine print.
5. `user-supplied / missing-data gate` — Do not show transactional or benefit claims until data and approvals are complete.

### Benefit block skeleton

- Primary line: `세면대용 24mm 규격, FW24` `[verified: P1]`
- Supporting line: `공식 확인 범위는 모델명, 세면대용이라는 용도 표기, 24mm 규격입니다.` `[verified: P1]`
- Evidence gap: `정확한 측정 기준과 적용 가능 범위는 판매자 자료 확인 전까지 미확정입니다.` `[missing seller/product data]`
- CTA state: `상세 사양 검증 후 등록 예정` `[hypothesis: D6; no purchase CTA]`

### Complete detail-copy skeleton

> **세면대용 24mm 규격 FW24** `[verified tokens: P1; ordering: hypothesis D2]`
>
> **상품 확인 범위**  
> FW24는 공식 제품 페이지에서 생활용 라인의 세면대용 제품, 24mm 규격으로 표시됩니다. `[verified: P1]`
>
> **호환성 안내**  
> 24mm 표기만으로 특정 세면대, 수전, 연결부 또는 브랜드와의 호환을 판단할 수 없습니다. 정확한 측정 위치와 방식, 나사산/연결 규격, 어댑터, 설치 조건은 판매자 검증 자료가 필요합니다. `[evidence boundary; no compatibility claim]`
>
> **확인된 기본 정보**  
> 모델: FW24 `[verified: P1]`  
> 용도 표기: 세면대용 `[verified: P1]`  
> 규격 표기: 24mm `[verified: P1]`
>
> **추가 등록 정보**  
> 옵션/SKU, 구성품, 재질, 전체 치수와 중량, 원산지·제조자, 설치·관리, 주의사항, 보증/A/S, 인증·시험, 가격·재고·배송·반품 정보는 미확정입니다. `[unresolved]`
>
> **초안 상태**  
> 검증 자료, 권리 확인된 이미지, 판매 조건, 내부 검토와 사용자 승인이 완료되기 전에는 등록·게시·판매에 사용할 수 없습니다. `[user-supplied boundary]`

## Ordered image plan

No product image is available or approved. Every row is a production requirement, not permission to create or publish an image. Do not use synthetic product imagery as factual product evidence.

| Order | Marketplace | Purpose | Visual direction | On-image copy | Evidence/claim constraint | Asset status |
|---:|---|---|---|---|---|---|
| 1 | Naver Smart Store | Main image / exact item identification | Rights-cleared, seller-supplied photo of the actual FW24 on a neutral background | Prefer no text unless current official rules permit it | Must depict the actual sellable SKU and included state; no badge, review, certification, performance, or component implication | Missing |
| 2 | Naver Smart Store | Verified fact card | Actual product or approved diagram with model/context only | `FW24 / 세면대용 / 24mm 규격` | Tokens verified by P1; diagram geometry must be seller/technical-owner approved | Missing |
| 3 | Naver Smart Store | Measurement clarification | Seller-approved annotated close-up showing exactly where/how 24 mm is measured | Placeholder until evidence: `24mm 측정 기준 확인` | Do not draw or label a measurement point without technical evidence | Missing |
| 4 | Naver Smart Store | Components | Flat lay of the exact sellable package | Seller-approved component names only | No component may appear or be named until SKU contents are verified | Missing |
| 5 | Naver Smart Store | Compatibility decision support | Evidence-based fit checklist/diagram | Seller-approved fit criteria | Never translate 24 mm into a universal compatibility claim | Missing |
| 6 | Naver Smart Store | Installation and care | Approved sequence using actual product | Verified steps, tools, warnings only | Withhold until technical evidence exists | Missing |
| 7 | Naver Smart Store | Seller terms | Text-led panel if needed | Shipping/returns/A/S facts | Use exact seller-approved terms only | Missing |
| 1 | Coupang | Main image / exact item identification | Rights-cleared actual FW24 SKU, marketplace-ready background | Prefer no text unless current official rules permit it | Same factual constraints as Naver; verify current Wing image rules | Missing |
| 2 | Coupang | Context/specification summary | Actual product plus restrained fact labels | `세면대용 / 24mm 규격 / FW24` | P1 only; no fit guarantee | Missing |
| 3 | Coupang | Measurement evidence | Technical close-up/diagram supplied or approved by seller | `24mm 측정 위치와 방법` after verification | Must show the verified measurement basis | Missing |
| 4 | Coupang | Package contents | Exact SKU contents arranged clearly | Verified names and quantities | No inferred adapter, tool, or accessory | Missing |
| 5 | Coupang | Pre-purchase check | Simple evidence-based checklist | Verified compatibility inputs | No named-system compatibility without evidence | Missing |
| 6 | Coupang | Installation / warnings / maintenance | Approved factual steps | Seller-approved wording | Withhold until verified | Missing |
| 7 | Coupang | Transaction terms | Text-led summary | Approved shipping, return, warranty/A/S facts | Must match seller and platform records | Missing |

## Missing seller and product data checklist

### Seller/account/commerce data

- [ ] Seller legal/display name, business information, customer-service route, and authorized account owner
- [ ] Naver Smart Store seller account and role-based access for a future separately approved registration
- [ ] Coupang Wing seller account and role-based access for a future separately approved registration
- [ ] Marketplace categories selected and verified against current official rules
- [ ] Price and tax/display basis
- [ ] SKU/seller code/barcode and option structure
- [ ] Stock and replenishment status by SKU
- [ ] Shipping carrier, fee, origin, regions/restrictions, handling time, and delivery promise
- [ ] Return/exchange conditions, costs, and address
- [ ] Warranty/A/S terms and authorized route
- [ ] Manufacturer, seller/importer roles, country of origin, and legally required disclosures
- [ ] Required certification or exemption evidence and exact authorized wording, if applicable

### FW24 product evidence

- [ ] Technical definition of the `24mm` specification, including measurement point, method, and tolerance
- [ ] Connector/thread geometry and complete compatibility criteria; named compatible/incompatible systems only if verified
- [ ] Exact dimensions, weight, materials, finish/color, and model variants
- [ ] Included parts, quantities, adapters, tools, packaging, and manuals
- [ ] Installation method, required tools/skills, warnings, operating conditions, and removal steps
- [ ] Maintenance, cleaning, consumables/replacement cycle, storage, useful-life guidance, and disposal
- [ ] Approved product-benefit evidence and claim wording, if any; none exists in this draft
- [ ] Test reports/certifications and scope, if any; none may be claimed now
- [ ] Warranty and after-sales details

### Assets and rights

- [ ] Actual sellable-SKU main images for each marketplace
- [ ] Measurement/connector close-ups and approved technical diagrams
- [ ] Verified package-content images
- [ ] Installation, warning, and maintenance assets after technical approval
- [ ] Packaging/label images sufficient to reconcile SKU and disclosures
- [ ] Image copyright, trademark, model/property-release, editing, and marketplace-use rights
- [ ] Final alt text/captions mapped to the claim-evidence register

## Account-access dependency

- Current dependency: no marketplace account access was requested or used.
- Operational-documentation dependency: authenticated official seller help is needed to verify current title, search term, category, option, image, disclosure, and registration-field rules before any registration package can be marked ready.
- Execution dependency: even after the data and documentation gates pass, an authorized account with least-privilege access and **explicit user approval for the exact external action** are required.
- Access is not itself approval. Campaign Director acceptance is not user approval.

## Official marketplace operational-source log

Operational sources are recorded separately and support no product claim. No detailed operational rule was used in this skeleton because authenticated rule pages were not available in the current session.

| Marketplace / attempted purpose | Exact official URL | Access date | Access result | Rule relied upon |
|---|---|---|---|---|
| Naver Smart Store seller center entry; locate current authenticated registration/help rules | https://sell.smartstore.naver.com/ | 2026-06-20 (Asia/Seoul) | HTTP 200; public seller-center shell reached. No authenticated help article or exact rule text verified. | None |
| Coupang Wing seller center entry; locate current authenticated registration/help rules | https://wing.coupang.com/ | 2026-06-20 (Asia/Seoul) | HTTP 200 followed by redirect to official seller sign-in. No authenticated help article or exact rule text verified. | None |

Required follow-up: after approved account access exists, capture the exact official help article URL, title/version or update date if shown, accessed date, verbatim rule summary, affected field, and reviewer. Do not substitute blogs, agencies, community posts, or competitor listings for official operational documentation.

## Registration-readiness checklist

### Evidence and content

- [x] Sellable scope is FW24 only; no industrial engine/nozzle included.
- [x] Product claims are limited to P1.
- [x] Naver and Coupang titles are separate and evidence-labeled.
- [x] Search-term candidates are separate and labeled as hypotheses.
- [x] No option was inferred.
- [x] Benefit and detail-copy skeletons expose the evidence gap.
- [x] Image sequence has factual constraints and missing-asset status.
- [ ] Every final factual sentence is mapped to an allowed source or seller-authorized record.
- [ ] Seller/technical owner approves the meaning of 24 mm and all compatibility wording.
- [ ] Claims/legal reviewer approves any benefit, certification, warning, warranty, origin, or manufacturer wording.

### Marketplace rules

- [ ] Exact authenticated Naver category and mandatory-field rules recorded with official URLs and access dates.
- [ ] Exact authenticated Naver title/search/options/image/detail-page rules recorded with official URLs and access dates.
- [ ] Exact authenticated Coupang category and mandatory-field rules recorded with official URLs and access dates.
- [ ] Exact authenticated Coupang title/search/options/image/detail-page rules recorded with official URLs and access dates.
- [ ] Final listing fields rechecked against current official rules immediately before any approved registration.

### Seller inputs and assets

- [ ] Price, tax basis, stock, SKU/option data, and identifiers supplied.
- [ ] Shipping, returns/exchanges, warranty/A/S, and legally required seller disclosures supplied.
- [ ] Product specifications, components, compatibility criteria, installation, warnings, and maintenance supplied and approved.
- [ ] Certification/exemption, manufacturer/origin, and claim evidence supplied where applicable.
- [ ] Rights-cleared images and diagrams supplied and reconciled to the exact SKU.

### Approval and execution gates

- [x] Campaign Director source/consistency review complete.
- [ ] Marketplace Commerce self-review concerns resolved.
- [ ] Exact Naver listing payload approved by the user.
- [ ] Exact Coupang listing payload approved by the user.
- [ ] Authorized accounts and least-privilege access confirmed for the separately approved action.
- [ ] Registration, price, inventory, shipping, and publication values revalidated at execution time.
- [ ] Post-action audit record and rollback/correction owner defined.

Current registration decision: **NO-GO**. This draft is not registration-ready because seller/product data, images, exact operational rules, account access, and user approval are missing.

## Post-approval measurement and event schema

Measurement is dormant until an evidence-complete listing is separately approved and launched. A click, impression, cart, or inquiry does not satisfy the campaign's consumer-order target.

Qualification, deduplication, exclusions, attribution, and timer start are controlled by the canonical [measurement event dictionary](../measurement-event-dictionary.md).

| Event name | Baseline | Target | Owner | Data source | Evaluation window | Trigger / counting rule | Status |
|---|---:|---:|---|---|---|---|---|
| `first_consumer_order` | `false` | `true` | `campaign-director` | verified marketplace order record | 90 days | Apply the canonical measurement event dictionary. | User-supplied event; inactive until the dictionary-defined timer start |

Recommended event-record fields for later approval `[hypothesis]`:

- `event_name`
- `occurred_at`
- `marketplace` (`naver_smart_store` or `coupang`)
- `product_model` (`FW24`)
- `listing_id`
- `order_record_reference` (restricted identifier, not customer contact data)
- `verification_status`
- `exclusion_reason`
- `verified_by`
- `verified_at`

Validation method: Campaign Director and privacy/data owner review collection implementation and data handling before collection; reconcile only against official marketplace order records under the canonical measurement event dictionary after approved launch. Do not collect or expose unnecessary personal data.

## Handoff and approval fields

- Campaign/version ID: `i-ufb-launch-90d / v1-marketplace-fw24-readiness`
- Prepared by: `marketplace-commerce`
- Recipient: `campaign-director`
- Product: `FW24`
- Sources/evidence: P1-P2 and operational-source log above
- Hypotheses: D1-D3, D5-D7; all unresolved with validation methods
- Unresolved items: all unchecked seller/product/asset/operational-rule items
- Dependencies: seller/technical evidence, rights-cleared assets, authenticated official help documentation, exact user approval, and authorized account access
- Approval state: `draft`
- Acceptance status: `passed-for-user-review`
- Campaign Director decision: `passed-for-user-review`
- Product/technical owner approval: `pending`
- Legal/claims approval: `pending`
- User decision: `pending`
- Exact external action approved: `none`
- Registration authorization: `not granted`
- Publication authorization: `not granted`
- Pricing/advertising authorization: `not granted`
- Customer contact/material delivery: `forbidden`

## Campaign Director review record

- Reviewer: `campaign-director`
- Review date: `2026-06-20`
- Outcome: `passed-for-user-review`
- Asset current status: `passed-for-user-review`
- Registration status: **NO-GO**

## Self-review

- [x] Only FW24 is covered.
- [x] FW24 is described only as a consumer/lifestyle washbasin product for the 24 mm specification.
- [x] Naver and Coupang have separate title, search-term, option, benefit, and complete detail-copy skeletons.
- [x] Every non-factual listing decision is labeled and has a validation method.
- [x] No price, stock, shipping, certification, review, performance, compatibility, installation, material, component, warranty, or image was invented.
- [x] Product sources and marketplace operational sources are separated.
- [x] Exact official entry URLs and access dates/results are recorded; no unverified operational rule is asserted.
- [x] Image plan, missing-data checklist, account dependency, registration checklist, event schema, and handoff fields are present.
- [x] No listing, publishing, pricing, advertising, contacting, sending, or account access occurred.

Status: `passed-for-user-review`. The skeleton is complete for editorial review, but it is intentionally `NO-GO` for registration until the documented evidence, seller inputs, official operational rules, assets, access, specialist reviews, and explicit user approvals are complete.
