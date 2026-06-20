# i-UFB Website Inquiry Conversion Package

## Package identity and decision state

- Campaign: `i-ufb-launch-90d`
- Package version: `v1-website-inquiry-conversion`
- Prepared: 2026-06-21 (Asia/Seoul)
- Approval state: `draft`
- Acceptance status: `pending-campaign-director-review`
- External action authorized: none
- Scope boundary: recommendation and implementation specification only. This package does not authorize a website or published-post edit, publication, customer contact, or material delivery.

## Key recommendation

Replace the current phone/email-only handoff with one structured, privacy-safe web inquiry route. Lead with `산업 분야 + 처리 유량 + 배관 규격 + 사용 목적`, allow an explicit `미확인` response instead of forcing guesses, and count only records that later satisfy the canonical `qualified_inquiry` definition. Use the two published Blog posts as separately attributable entry points into the same route.

The input facts are `verified`; the expectation that this flow increases qualified inquiries is a `hypothesis`. Validate it using the canonical measurement dictionary, not raw CTA clicks.

## Current-state evidence

Public pages were inspected read-only on 2026-06-21.

| Observation | Evidence | Status | Conversion implication |
|---|---|---|---|
| The global header exposes `문의하기`, but it routes to the contact page rather than a web form. | [Official homepage](https://www.ufb.co.kr), [contact page](https://www.ufb.co.kr/contact/index.html) | `verified` | Inquiry intent is handed off to phone/email, so structured qualification and source attribution are not captured on-site. |
| The contact page asks visitors to provide use purpose, site conditions such as flow/pipe/tank capacity, and reply contact information. Its actionable paths are phone and a prefilled `mailto:` link. | [Contact page](https://www.ufb.co.kr/contact/index.html) | `verified` | The required qualification concepts already exist in copy, but not as validated fields or an attributable submission record. |
| The i-UFB page says flow, pipe specification, and intended use are needed to propose a model/application approach. | [i-UFB page](https://www.ufb.co.kr/ufb/index.html) | `verified` | These are the correct core intake fields. They do not support an automatic model recommendation. |
| The i-UFB hero sends visitors to the lineup or the Blog. A later module requests specification/price materials by email, and the final application CTA offers phone/contact-page routes. | [i-UFB page](https://www.ufb.co.kr/ufb/index.html) | `verified` | High-intent visitors encounter multiple generic exits instead of one structured application-review path. This package must not perform or promise material delivery. |
| The UFB characteristics page ends with `i-UFB 제품 보기` and generic `문의하기` links after its conditions caveat. | [UFB characteristics page](https://www.ufb.co.kr/ufb-features/index.html) | `verified` | The caveat-to-inquiry bridge is present but does not tell the visitor what to prepare. |
| Blog 01 and Blog 02 are published, and their packages route readers to official-site i-UFB content without distinct campaign parameters. | [Blog 01](https://blog.naver.com/i-ultrafinebubble/224322114556), [Blog 02](https://blog.naver.com/i-ultrafinebubble/224322115176), `content/blog-01.md`, `content/blog-02.md`, `publication-log.md` | `verified` | The posts are eligible approved campaign touches, but their website-driven inquiries cannot be distinguished reliably until approved markers are added and persisted. |
| The campaign baseline is zero qualified inquiries and the target is five within 90 days. The timer began with the first approved publication at the canonical time `2026-06-21T00:10:00+09:00`. | `marketing-team/state/campaign.yaml`, `publication-log.md` | `user-supplied` | The implementation must preserve campaign-touch attribution and reconcile to the verified inquiry log within the already-running window. |

### Current-state caution

Some public-site benefit and specification wording is broader or more absolute than the evidence-safe language approved in the campaign packages. Reusing that wording in the new CTA/form is not authorized. Technical/content review of adjacent copy is a dependency, not part of this conversion implementation.

## Proposed inquiry experience

### Route

`Blog or site CTA → structured inquiry page → field validation → privacy notice/consent → review → submit → on-page confirmation`

Recommended destination: `https://www.ufb.co.kr/contact/index.html` upgraded to contain the form while retaining phone, email, map, and business-hour information. If the current contact page cannot host server-side submission, use `/contact/inquiry.html` and make all proposed CTAs point there.

Do not auto-select a product/model, promise a field test, promise results, promise a response time, send materials, or trigger an agent/customer follow-up from this flow.

## Exact CTA copy and placement

### Primary CTA system

| Page/location | Headline or nearby lead | Button copy | Supporting copy | Exact placement | Evidence status |
|---|---|---|---|---|---|
| i-UFB hero | `우리 현장 조건으로 i-UFB 적용을 검토하세요` | `현장 조건으로 문의하기` | `산업 분야, 처리 유량, 배관 규격, 사용 목적을 정리하면 모델·적용 방식 검토에 필요한 기본 조건을 전달할 수 있습니다.` | Make this the hero primary CTA. Keep `제품 라인업 보기` as a secondary text link. | Input basis `verified`; placement/conversion effect `hypothesis`. |
| i-UFB page, immediately after product lineup and before the current specification/price email module | `모델명보다 현장 조건이 먼저입니다` | `유량·배관·목적으로 검토 시작` | `확인되지 않은 항목은 ‘미확인’으로 선택할 수 있습니다. 공개 정보만으로 특정 모델을 추천하지 않습니다.` | Full-width CTA module after the consumer-line cards, before any email/material CTA. | `hypothesis`, constrained by verified input facts. |
| i-UFB Applications section | `우리 현장에 맞는 적용을 검토하려면` | `적용 조건 입력하기` | `처리 유량, 배관 규격, 사용 목적과 현장 조건을 알려주세요.` | Replace the generic final phone-first CTA with this primary button; retain phone as secondary contact information. | Input basis `verified`; conversion effect `hypothesis`. |
| UFB characteristics page, immediately after the conditions disclaimer and before `i-UFB 제품 보기` | `UFB 특성을 확인했다면, 현장 조건을 정리해 보세요` | `현장 조건으로 적용 검토` | `실제 효과와 측정값은 적용 조건에 따라 달라질 수 있습니다. 처리 유량·배관 규격·사용 목적을 기준으로 문의를 준비하세요.` | Single bridge module between the disclaimer and product link. | Caveat/input basis `verified`; placement effect `hypothesis`. |
| Global header on i-UFB and UFB characteristics pages | none | `적용 문의` | none | Replace the ambiguous `문의하기` label only on i-UFB-related pages; route to the same form and preserve attribution. | `hypothesis`. |

### Industry-prefilled CTA labels

Use these labels only where an application card/section unambiguously identifies the industry. Every button opens the same form and preselects only the industry value; the visitor can change it.

- Agriculture/smart farm: `관수 조건으로 검토`
- Livestock: `음용수·현장 조건으로 검토`
- Aquaculture: `수조·수질 조건으로 검토`
- Industrial cleaning/water treatment: `공정 조건으로 검토`

These labels are `hypothesis`. Validate with attributable completed inquiries, not clicks.

## Proposed inquiry fields

### Step 1 — Application conditions

| Field/key | Required | Control and exact options/copy | Validation and counting rule |
|---|---:|---|---|
| Industry `industry` | Yes | Radio/select: `농업·스마트팜`, `축산`, `수산 양식`, `산업 세척·수처리`, `기타`, `아직 모름` | Store an allowlisted code only: `agriculture-smart-farm`, `livestock`, `aquaculture`, `industrial-cleaning-water-treatment`, `other`, `unknown`. `other` requires a short description in the restricted inquiry record. `unknown` allows submission but is not an in-scope identified application for canonical qualification. |
| Flow status `flow_status` | Yes | `수치 입력`, `아직 모름` | If known, require positive numeric `flow_value` plus unit. If unknown, no estimate is requested. `unknown` allows submission but cannot satisfy `qualified_inquiry` until a verified record identifies flow. |
| Flow unit `flow_unit` | Conditional | `L/min`, `m³/h`, `기타 단위` | Required only for known flow. `기타 단위` requires a restricted free-text unit. Do not send raw values/units to general analytics. |
| Pipe status `pipe_status` | Yes | `규격 입력`, `아직 모름` | Known value uses a free-text `pipe_spec` with helper copy `도면이나 설비 표기를 그대로 입력해 주세요.` Unknown allows submission but cannot satisfy canonical qualification until resolved in the verified record. Do not infer fit from public model labels. |
| Intended-use status `purpose_status` | Yes | `목적 입력`, `아직 구체화되지 않음` | Known requires `intended_use`. Unknown allows submission but is incomplete for canonical qualification. |
| Intended use `intended_use` | Conditional | Textarea label: `어디에, 무엇을 위해 적용하려는지 알려주세요.` Helper: `예: 관수 라인 수질 관리 검토. 기대 성과나 수치는 확정된 사실처럼 입력하지 않아도 됩니다.` | Required when status is known; 20–1,000 characters. Restricted record only; never copied to analytics. |
| Additional site conditions `site_conditions` | No | Textarea label: `수조 용량, 수원·수질, 사용 기체, 설치 위치 등 추가 조건이 있으면 적어주세요.` | 0–1,000 characters; restricted record only. |

### Step 2 — Organization and reply route

| Field/key | Required | Control/copy | Privacy rule |
|---|---:|---|---|
| Organization/site `organization_name` | Yes | `회사·농장·시설명` | Restricted inquiry system only. Never send to analytics or campaign reports. Needed for canonical organization/need and deduplication review. |
| Requester name `requester_name` | Yes | `담당자명` | Restricted inquiry system only. |
| Reply channel `reply_channel` | Yes | `이메일`, `전화` | Require exactly the selected contact field; both may be provided voluntarily. This package does not authorize the agent team to contact the submitter. |
| Email `email` | Conditional | Standard email input | Restricted inquiry system only. Never put in URL parameters, page events, logs visible to marketing, or error messages. |
| Phone `phone` | Conditional | Phone input; normalize server-side | Same restriction as email. |
| Consent `privacy_consent` | Yes | Checkbox: `문의 처리와 회신을 위한 개인정보 수집·이용 내용을 확인했으며 동의합니다.` Link: `개인정보 처리 내용 보기` | Legal/privacy owner must supply purpose, fields, retention, controller, withdrawal/contact method, and required/optional distinctions before launch. Do not pre-check. |
| Campaign markers | Hidden | Allowlisted values described below | Never accept arbitrary values into reporting; validate and normalize server-side. No PII. |

### Form introduction and review copy

- Form heading: `i-UFB 적용 조건 문의`
- Intro: `확인 가능한 항목만 입력해 주세요. 모르는 수치나 규격은 ‘아직 모름’으로 선택할 수 있습니다. 제출 내용은 특정 모델이나 성과를 자동으로 보장하지 않습니다.`
- Review heading: `제출 전 입력 내용을 확인해 주세요`
- Submit button: `적용 조건 문의 제출`
- Secondary action: `입력 내용 수정`

## Source attribution for the two published posts

Campaign URL parameters are public, non-personal markers. They support the measurement dictionary's approved campaign-touch attribution rule.

### Approved-value schema

| Parameter | Blog 01 | Blog 02 | Rule |
|---|---|---|---|
| `utm_source` | `naver_blog` | `naver_blog` | Fixed allowlisted source. |
| `utm_medium` | `owned_content` | `owned_content` | Fixed allowlisted medium. |
| `utm_campaign` | `i-ufb-launch-90d` | `i-ufb-launch-90d` | Matches campaign ID. |
| `utm_content` | `v1-content-blog-01` | `v1-content-blog-02` | Matches package version. |
| `asset_id` | `224322114556` | `224322115176` | Public Naver post identifier; no reader identity. |

### Proposed CTA URLs

- Blog 01 landing URL: `https://www.ufb.co.kr/ufb-features/index.html?utm_source=naver_blog&utm_medium=owned_content&utm_campaign=i-ufb-launch-90d&utm_content=v1-content-blog-01&asset_id=224322114556`
- Blog 02 landing URL: `https://www.ufb.co.kr/ufb/index.html?utm_source=naver_blog&utm_medium=owned_content&utm_campaign=i-ufb-launch-90d&utm_content=v1-content-blog-02&asset_id=224322115176`

When the visitor clicks an on-site inquiry CTA, append a separate allowlisted `cta_id` and persist the five campaign markers to the form:

- Blog 01 bridge: `cta_id=ufb-features-post-caveat`
- Blog 02 hero: `cta_id=ufb-hero-application-review`
- i-UFB post-lineup module: `cta_id=ufb-lineup-conditions`
- i-UFB Applications module: `cta_id=ufb-applications-conditions`

Persist only the last identifiable approved campaign touch before submission, as required by the dictionary. Use first-party session storage or a short-lived first-party campaign cookie only after privacy/legal approval. Never persist raw referrer query strings, personal identifiers, free text, or contact data in analytics. Direct/unattributed records may be operational inquiries but are excluded from the campaign count.

Editing either published Blog post or its CTA requires separate explicit user approval. This draft does not authorize those edits.

## Confirmation, validation, and error copy

### Field validation

- Missing required choice: `필수 항목입니다.`
- Known flow without value: `처리 유량 수치를 입력하거나 ‘아직 모름’을 선택해 주세요.`
- Known flow without unit: `처리 유량 단위를 선택해 주세요.`
- Known pipe without text: `배관 규격을 입력하거나 ‘아직 모름’을 선택해 주세요.`
- Known purpose without detail: `사용 목적을 20자 이상 입력하거나 ‘아직 구체화되지 않음’을 선택해 주세요.`
- Invalid email: `이메일 주소 형식을 확인해 주세요.`
- Invalid phone: `연락 가능한 전화번호 형식을 확인해 주세요.`
- Consent missing: `문의 제출을 위해 개인정보 수집·이용 동의가 필요합니다.`
- Suspected duplicate submit: `제출을 처리하고 있습니다. 잠시만 기다려 주세요.` Disable the button while the request is in flight.

### Submission outcomes

- Success heading: `문의가 접수되었습니다.`
- Success body: `입력하신 적용 조건이 접수되었습니다. 접수번호를 확인해 주세요. 이 화면은 특정 모델, 결과, 현장 테스트 또는 자료 제공을 확정하지 않습니다.`
- Success reference: `접수번호: {restricted_submission_reference}`
- Success next action: `i-UFB 제품 정보로 돌아가기`
- Recoverable server error: `문의가 제출되지 않았습니다. 입력 내용은 이 화면에 유지됩니다. 잠시 후 다시 시도해 주세요.`
- Network error: `네트워크 연결을 확인한 뒤 다시 시도해 주세요. 중복 제출을 방지하기 위해 접수 완료 화면이 표시됐는지도 확인해 주세요.`
- Validation summary heading: `입력 내용을 확인해 주세요.`
- Unknown server error: `현재 온라인 문의를 처리할 수 없습니다. 입력한 개인정보를 URL이나 분석 도구에 복사하지 마세요. 공개된 전화·이메일 연락처는 문의 페이지에서 확인할 수 있습니다.`

Do not expose stack traces, database errors, email addresses, phone numbers, entered free text, qualification status, or deduplication status in error responses or client analytics.

## Privacy-safe measurement events

The only campaign outcome event is the canonical `qualified_inquiry` in `../measurement-event-dictionary.md`: baseline `0`, target `5`, owner `campaign-director`, data source `verified inquiry log`, evaluation window `90 days`. Diagnostic events below do not count toward the target.

| Event | When fired | Allowed parameters | Explicitly prohibited | Relation to dictionary |
|---|---|---|---|---|
| `website_cta_view` | CTA becomes viewable once per page view | `page_path`, `cta_id`, approved campaign markers | IP, contact data, free text, flow value, pipe text, organization | Diagnostic only. |
| `website_cta_click` | Unique CTA click | Same as above | Same as above | Diagnostic only; clicks are explicitly excluded from `qualified_inquiry`. |
| `inquiry_form_start` | First interaction with the form | `form_id`, `cta_id`, approved campaign markers | Raw field values or contact data | Diagnostic only. |
| `inquiry_field_status` | A core field reaches a coarse status | `field_group` (`industry`, `flow`, `pipe`, `purpose`), `status` (`known`, `unknown`) | Selected free text, numeric flow, pipe value, identity | Funnel diagnostic only. Industry enum may be recorded only if analytics/privacy owner approves; otherwise record `selected/unselected`. |
| `inquiry_validation_error` | Client/server validation blocks progress | `form_id`, `step`, allowlisted `error_code` | Entered value, DOM text, exception detail, contact data | Diagnostic only. |
| `inquiry_submit_attempt` | User activates submit after consent | `form_id`, `cta_id`, approved campaign markers | All raw form values | Diagnostic only; never treat as an inquiry. |
| `inquiry_submission_confirmed` | Server returns a durable restricted submission reference | `form_id`, `cta_id`, approved campaign markers, opaque one-way/non-reversible event token if approved | Contact data, organization, free text, raw submission reference | Operational funnel confirmation; not automatically qualified. |
| `qualified_inquiry` | Campaign Director reconciles a verified inbound record that meets all canonical qualification, deduplication, exclusion, and attribution rules | Restricted record reference, approved campaign marker, non-personal exclusion/qualification codes in the verified inquiry log | Contact data in campaign reporting; client-side firing | The sole counted campaign event. Must be created/reconciled from the verified inquiry log, not the browser. |

### Qualification guardrail

A submission choosing `unknown` for industry, flow, pipe, or intended use may be accepted operationally but cannot count as `qualified_inquiry` until the verified inquiry record identifies a real organization/need, in-scope application, intended use, flow, pipe, and enough information for technical next-step assessment. The form must not silently convert unknowns to guesses. Deduplicate by normalized restricted contact reference + organization + application need within 30 days; never expose that key in marketing reports.

## Acceptance criteria

1. Every proposed i-UFB inquiry CTA resolves to exactly one structured form route and preserves allowlisted campaign markers plus `cta_id` without copying arbitrary query values.
2. Blog 01 and Blog 02 can be distinguished in the verified inquiry log using the exact parameter values above after separately approved post edits.
3. Industry, flow, pipe, and purpose each support a visible unknown option; known selections enforce the corresponding value/unit/detail.
4. No form logic recommends a product/model, predicts a result, promises a test, promises a response time, or triggers material delivery.
5. Required contact information and free text are stored only in the restricted inquiry system and are absent from URLs, client analytics, console logs, pixels, error telemetry, and campaign reports.
6. Consent is explicit, not pre-checked, and the privacy notice contains approved purpose, fields, retention, controller, and withdrawal/contact details.
7. Server-side validation, CSRF protection, rate limiting/bot controls, idempotency, and duplicate-submit protection are implemented; client-side validation alone is insufficient.
8. Successful submission produces a durable restricted reference and the exact success copy; failures preserve input locally on the page where safe and never claim success.
9. `qualified_inquiry` is never fired client-side. Campaign Director reconciliation follows the canonical definition, deduplication, exclusions, attribution, and 90-day window.
10. Direct/unattributed submissions remain available for operational handling but are excluded from the campaign count.
11. Keyboard-only navigation, visible focus, programmatic labels, error-summary links, and screen-reader announcements work; mobile and desktop layouts remain usable.
12. Existing phone/email/map contact information remains available as secondary paths, and no live site or external post changes occur without explicit user approval.

## Implementation checklist

### Content and UX

- [ ] Obtain Campaign Director review of all CTA/form copy and adjacent claim context.
- [ ] Obtain technical-owner review confirming that the intake fields do not imply model fit or guaranteed performance.
- [ ] Confirm final route: enhanced `/contact/index.html` or new `/contact/inquiry.html`.
- [ ] Implement the exact CTA hierarchy and placements above.
- [ ] Add all unknown states and helper copy; never force estimated technical data.
- [ ] Retain phone/email as secondary, non-counted routes unless the verified log independently records an approved source marker.

### Form and backend

- [ ] Define restricted inquiry datastore, access roles, retention, deletion, and audit ownership.
- [ ] Implement server-side validation and normalization for enums, flow/unit, pipe, purpose, contact channel, and consent.
- [ ] Implement CSRF protection, rate limiting/bot controls, idempotency key, duplicate-submit handling, encryption in transit/at rest, and secrets management.
- [ ] Generate an opaque restricted submission reference; do not derive it from contact information.
- [ ] Add internal-only operational notification/routing only after explicit user approval plus site-owner authorization. It must not authorize customer contact or material delivery, and the marketing agent team must not receive customer contact data.
- [ ] Implement success/error states and accessible focus management.

### Attribution and analytics

- [ ] Approve the five campaign parameters and four `cta_id` values as allowlisted enums.
- [ ] Preserve the last approved campaign touch across landing → form → submission using an approved first-party method.
- [ ] Strip arbitrary parameters and never store full query strings/referrers in the verified campaign record.
- [ ] Implement diagnostic events with the minimal parameters specified above.
- [ ] Ensure analytics/tag-manager configuration blocks form-field capture, URL-based PII, session replay of inputs, and raw submission references.
- [ ] Map durable submissions to the restricted verified inquiry log.
- [ ] Implement Campaign Director reconciliation and non-personal exclusion reasons against the canonical dictionary.
- [ ] Verify the measurement start remains the existing campaign timestamp; do not restart it for the site edit.

### QA and release control

- [ ] Test both proposed Blog URLs and all on-site CTA routes with marker persistence.
- [ ] Test known/unknown combinations, validation boundaries, refresh/back behavior, network loss, retries, duplicate clicks, and server errors.
- [ ] Test desktop/mobile layouts, keyboard flow, screen reader labels, contrast, focus, and error announcements.
- [ ] Verify no PII/free text appears in analytics, network query strings, console logs, error telemetry, or marketing exports.
- [ ] Obtain explicit user approval identifying the exact website files/pages and any Blog CTA edits before deployment.
- [ ] Record implementation date, live URLs, approved scope, and reviewer in the run publication/change log.

## Unresolved technical dependencies and blockers

| Dependency/blocker | Owner | Status/impact |
|---|---|---|
| The public site currently exposes no visible web-form backend or verified inquiry datastore. Hosting/runtime, submission endpoint, database, email routing, and deployment access are unknown. | Web/technical owner | `unresolved`; blocks implementation and durable confirmation. |
| No analytics/tag-manager platform, consent manager, session-storage policy, or event transport is identified. | Analytics/privacy owner | `unresolved`; blocks attribution persistence and diagnostic events. |
| The exact verified inquiry log system and its import/reconciliation interface are not specified. | Campaign Director + technical owner | `unresolved`; blocks counted `qualified_inquiry`. |
| Privacy notice text, retention period, controller details, processor list, and lawful consent implementation are not supplied. | Legal/privacy owner | `unresolved`; blocks collecting contact data through a new form. |
| The site architecture and whether static pages can accept server-side submissions are unverified. | Web owner | `unresolved`; determines whether `/contact/index.html` can be enhanced or a new service is required. |
| Bot/spam controls, security review, access controls, data residency, backup/deletion procedures, and incident handling are unspecified. | Security/web owner | `unresolved`; blocks production release. |
| Current public-site benefit/specification copy may require evidence/technical review before it is reused or placed adjacent to the conversion module. | Technical owner + Campaign Director | `pending`; does not block drafting, blocks final copy approval. |
| Blog CTA edits and website edits require separate explicit user approval and external-system access. | User + authorized operator | `not requested`; blocks all external changes. |

Customer contact and material delivery are forbidden for this agent team and are not approvable dependencies.

## Evidence, hypotheses, and validation

| Item | Label | Source/validation |
|---|---|---|
| i-UFB model/application review begins with flow, pipe specification, and intended use. | `verified` | https://www.ufb.co.kr/ufb/index.html, accessed 2026-06-21. |
| The contact page already asks for purpose, conditions, and reply contact but uses phone/email routes. | `verified` | https://www.ufb.co.kr/contact/index.html, accessed 2026-06-21. |
| UFB results/measurements may vary by application conditions. | `verified` | https://www.ufb.co.kr/ufb-features/index.html, accessed 2026-06-21. |
| Blog 01 and Blog 02 are approved and published campaign assets. | `verified` | `content/blog-01.md`, `content/blog-02.md`, `publication-log.md`. |
| Structured, industry-aware intake and these placements/copy will increase qualified inquiries. | `hypothesis` | Validate attributable, deduplicated `qualified_inquiry` records and field completeness at 30/60/90-day checkpoints; do not use click-through rate as the outcome. |
| Allowing unknown values will reduce false technical data without unacceptable abandonment. | `hypothesis` | Compare unknown-state frequency, completion, exclusion reasons, and later verified qualification; do not infer qualification from submission alone. |
| Separately tagged Blog entry points will identify which content contributes qualified inquiries. | `hypothesis` | Confirm approved markers in the verified log and reconcile last approved touch under the dictionary. |

## Handoff

- Sources/evidence: official pages above, `marketing-team/agents/content-search.md`, `marketing-team/policies/approval-and-sources.md`, `marketing-team/state/campaign.yaml`, `product-marketing/30-day-campaign-brief.md`, both published content packages, `publication-log.md`, and `measurement-event-dictionary.md`.
- Unresolved items: technical dependencies table above.
- Approval state: `draft`
- Acceptance status: `pending-campaign-director-review`
- Recommended next decision: approve the structured form specification for technical/privacy feasibility review; do not authorize live changes until the blockers and exact external scope are resolved.
