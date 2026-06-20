# i-UFB Launch v1 Measurement Event Dictionary

## Authority and use

This file is the canonical run-level counting authority for `qualified_inquiry` and `first_consumer_order`. The event names and schema values below are copied verbatim from `marketing-team/state/campaign.yaml`; the exact operational rules that follow supplement those values without changing them. All v1 assets must reference this dictionary instead of restating or treating these rules as unresolved.

Counting an event does not authorize customer contact, material delivery, publication, website editing, marketplace activity, pricing, advertising, or any other external action.

## Canonical event schema

```yaml
measurement_definitions:
  qualified_inquiry:
    event: qualified_inquiry
    baseline: 0
    target: 5
    owner: campaign-director
    data_source: verified inquiry log
    evaluation_window: 90 days
  first_consumer_order:
    event: first_consumer_order
    baseline: false
    target: true
    owner: campaign-director
    data_source: verified marketplace order record
    evaluation_window: 90 days
```

## `qualified_inquiry` exact rules

### Qualification

Count one inbound, externally originated inquiry recorded in the verified inquiry log when it identifies a real organization or consumer need, an in-scope application, intended use, flow rate, and pipe specification, and contains enough information for a technical owner to assess next-step fit. Counting does not authorize customer contact.

### Deduplication

Count one qualified inquiry per normalized restricted contact reference + organization + application need within a rolling 30-day period. A later submission counts separately only when the application need or site is materially different. Never expose contact data in campaign reporting.

### Exclusions

Exclude internal, employee, agency, test, bot, spam, vendor-solicitation, job-seeker, out-of-scope, incomplete, duplicate, and unverifiable records. Exclude clicks, impressions, page views, downloads, and marketplace questions.

### Attribution

Attribute an inquiry only when the verified log contains an approved campaign source marker such as a campaign URL/UTM, referring approved asset, CTA/form route, or logged self-reported campaign source. Use the last identifiable approved campaign touch before submission. Exclude direct or unattributed records from the campaign count.

### Evaluation timer start

Start the 90-day timer when the first separately approved campaign asset with an inquiry CTA, or its associated website CTA edit, becomes publicly live. Until that launch occurs, the timer has not started.

## `first_consumer_order` exact rules

### Qualification and deduplication

Count the earliest unique marketplace order ID in the verified marketplace order record that is paid, placed by a non-internal consumer through a separately approved campaign listing, and not excluded at the verification cutoff. Count the event once across the campaign; the unique marketplace order ID is the deduplication key.

### Exclusions

Exclude internal, employee, agency, test, duplicate, cancelled, fully refunded, and otherwise unverifiable orders. Clicks, impressions, carts, inquiries, listing questions, and unpaid checkout attempts are not orders.

### Attribution

Attribute the order only when its verified marketplace record identifies a separately approved campaign listing. Orders from unapproved, unrelated, or unattributed listings do not satisfy the campaign event.

### Evaluation timer start

Start the 90-day timer when the first separately approved consumer marketplace listing becomes publicly live. Until that launch occurs, the timer has not started.

## Data handling and reconciliation

- Use restricted record references rather than customer contact data in reporting.
- The `campaign-director` owns reconciliation against the canonical data source for each event.
- Apply these rules consistently across all channels and document any excluded record with a non-personal exclusion reason.
- Customer contact and material delivery remain permanently forbidden.
