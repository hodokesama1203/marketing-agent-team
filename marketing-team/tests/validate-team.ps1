$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
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

function Assert-Contains {
  param(
    [Parameter(Mandatory = $true)][string]$Content,
    [Parameter(Mandatory = $true)][string]$Pattern,
    [Parameter(Mandatory = $true)][string]$Message
  )
  if (-not [regex]::IsMatch($Content, $Pattern, [Text.RegularExpressions.RegexOptions]::Multiline)) {
    throw $Message
  }
}

function Get-TopLevelSection {
  param([string]$Yaml, [string]$Name)
  $pattern = '(?m)^' + [regex]::Escape($Name) + ':[ \t]*\r?\n(?<body>(?:^  [^\r\n]*(?:\r?\n|$))*)'
  $match = [regex]::Match($Yaml, $pattern)
  if (-not $match.Success) {
    throw "Missing top-level YAML section: $Name"
  }
  return $match.Groups['body'].Value
}

function Assert-ExactDirectMap {
  param([string]$Body, [hashtable]$Expected, [string]$Section)
  $actual = Get-DirectMap $Body
  if ($actual.Count -ne $Expected.Count) {
    throw "Invalid direct fields in YAML section: $Section"
  }
  foreach ($key in $Expected.Keys) {
    if (-not $actual.ContainsKey($key) -or $actual[$key] -cne [string]$Expected[$key]) {
      throw "Missing or invalid YAML value: $Section.$key = $($Expected[$key])"
    }
  }
}

function Get-DirectMap {
  param([string]$Body)
  $actual = @{}
  foreach ($match in [regex]::Matches($Body, '(?m)^  (?<key>[A-Za-z_][A-Za-z0-9_-]*):[ \t]+(?<value>[^\r\n]+?)[ \t]*\r?$')) {
    $actual[$match.Groups['key'].Value] = $match.Groups['value'].Value.Trim()
  }
  return $actual
}

function Test-SimpleYamlScalar {
  param([string]$Value)
  if ([string]::IsNullOrWhiteSpace($Value)) { return $false }
  if ($Value -cne $Value.Trim()) { return $false }
  if ($Value -ceq 'null') { return $true }
  if ($Value -match '^[+-]?(?:0|[1-9][0-9]*)(?:\.[0-9]+)?$') { return $true }
  if ($Value -cmatch '^(?:true|false)$') { return $true }
  if ($Value.StartsWith("'") -or $Value.EndsWith("'")) {
    return $Value -match "^'(?:[^']|'')*'$"
  }
  if ($Value.StartsWith('"') -or $Value.EndsWith('"')) {
    return $Value -match '^"(?:[^"\\\r\n]|\\["\\/bfnrt]|\\u[0-9A-Fa-f]{4})*"$'
  }
  $yamlIndicatorCodes = @(45, 63, 58, 44, 91, 93, 123, 125, 35, 38, 42, 33, 124, 62, 39, 34, 37, 64, 96)
  if ($yamlIndicatorCodes -contains [int][char]$Value[0]) { return $false }
  if ($Value -match ':\s|\s#') { return $false }
  return $Value -notmatch '[\u0000-\u001F\u007F]'
}

function Assert-ExactList {
  param([string]$Body, [string[]]$Expected, [string]$Section, [int]$Indent = 2)
  $spaces = ' ' * $Indent
  $pattern = '(?m)^' + [regex]::Escape($spaces) + '-[ \t]+(?<value>[^\r\n]+?)[ \t]*\r?$'
  $actual = @([regex]::Matches($Body, $pattern) | ForEach-Object { $_.Groups['value'].Value.Trim() })
  if ($actual.Count -ne $Expected.Count) {
    throw "Invalid or empty YAML list: $Section"
  }
  for ($index = 0; $index -lt $Expected.Count; $index++) {
    if ($actual[$index] -cne $Expected[$index]) {
      throw "Missing or invalid YAML list value: $Section[$index] = $($Expected[$index])"
    }
  }
}

$readme = Get-Content -Raw -Encoding UTF8 (Join-Path $root 'README.md')
Assert-Contains $readme '(?i)customer contact and material delivery are permanently forbidden' 'README must permanently forbid customer contact and material delivery'
Assert-Contains $readme '(?i)only approved outputs move to separately authorized external execution' 'README must separate approval from external-execution authorization'

$campaign = Get-Content -Raw -Encoding UTF8 (Join-Path $root 'state/campaign.yaml')
$expectedTopKeys = @('campaign', 'period_days', 'baseline', 'targets', 'b2b_industries', 'b2c_products', 'channels', 'cadence', 'approved_scope', 'external_actions', 'known_product_evidence', 'seller_data', 'measurement_definitions')
$actualTopKeys = @([regex]::Matches($campaign, '(?m)^(?<key>[A-Za-z_][A-Za-z0-9_-]*):') | ForEach-Object { $_.Groups['key'].Value })
$actualTopKeyString = (($actualTopKeys | Sort-Object) -join ',')
$expectedTopKeyString = (($expectedTopKeys | Sort-Object) -join ',')
if ($actualTopKeyString -cne $expectedTopKeyString) {
  throw 'Campaign YAML top-level keys are missing, misplaced, or unexpected'
}
Assert-Contains $campaign '(?m)^period_days: 90[ \t]*\r?$' 'Missing exact top-level campaign key: period_days: 90'
$campaignMap = Get-DirectMap (Get-TopLevelSection $campaign 'campaign')
if ($campaignMap.Count -ne 3 -or $campaignMap['id'] -cne 'i-ufb-launch-90d') {
  throw 'Campaign metadata must contain exactly id, version, and status with the expected campaign id'
}
if ($campaignMap['version'] -notmatch '^[1-9][0-9]*$') {
  throw 'Campaign version must be a positive integer'
}
if (@('draft', 'active', 'paused', 'completed') -cnotcontains $campaignMap['status']) {
  throw 'Campaign status must be one of: draft, active, paused, completed'
}
Assert-ExactDirectMap (Get-TopLevelSection $campaign 'baseline') @{ monthly_qualified_inquiries = '0' } 'baseline'
Assert-ExactDirectMap (Get-TopLevelSection $campaign 'targets') @{ qualified_inquiries = '5'; first_consumer_order = 'true' } 'targets'
Assert-ExactList (Get-TopLevelSection $campaign 'b2b_industries') @('agriculture-smart-farm', 'livestock', 'aquaculture', 'industrial-cleaning-water-treatment') 'b2b_industries'
Assert-ExactList (Get-TopLevelSection $campaign 'b2c_products') @('FW24', 'FWP6A', 'Bubblio') 'b2c_products'
Assert-ExactList (Get-TopLevelSection $campaign 'channels') @('naver-blog', 'ufb-website', 'naver-smart-store', 'coupang') 'channels'
$cadence = Get-TopLevelSection $campaign 'cadence'
Assert-Contains $cadence '(?m)^  weekly_blog_drafts: 2[ \t]*\r?$' 'Missing or invalid cadence.weekly_blog_drafts'
Assert-Contains $cadence '(?m)^  marketplace_sequence:[ \t]*\r?$' 'Missing cadence.marketplace_sequence'
Assert-ExactList $cadence @('FW24', 'FWP6A', 'Bubblio') 'cadence.marketplace_sequence' 4
Assert-ExactDirectMap (Get-TopLevelSection $campaign 'approved_scope') @{ activity = 'draft creation only' } 'approved_scope'
Assert-ExactDirectMap (Get-TopLevelSection $campaign 'external_actions') @{ customer_material_delivery = 'forbidden'; other_external_actions = 'explicit_user_approval_and_access_required' } 'external_actions'
Assert-ExactDirectMap (Get-TopLevelSection $campaign 'known_product_evidence') @{ official_site = 'https://www.ufb.co.kr'; official_blog = 'https://blog.naver.com/i-ultrafinebubble' } 'known_product_evidence'
$sellerData = Get-DirectMap (Get-TopLevelSection $campaign 'seller_data')
$sellerKeys = @('price', 'stock', 'shipping', 'options', 'certifications', 'returns', 'product_images')
if ($sellerData.Count -ne $sellerKeys.Count) {
  throw 'Seller data must contain every required key exactly once'
}
foreach ($key in $sellerKeys) {
  if (-not $sellerData.ContainsKey($key)) {
    throw "Seller data missing required key: $key"
  }
  if (-not (Test-SimpleYamlScalar $sellerData[$key])) {
    throw "Seller data value must be null or a non-empty valid simple YAML scalar: $key"
  }
}
$measurement = Get-TopLevelSection $campaign 'measurement_definitions'
foreach ($definition in @(
  @{ name = 'qualified_inquiry'; values = @{ event = 'qualified_inquiry'; baseline = '0'; target = '5'; owner = 'campaign-director'; data_source = 'verified inquiry log'; evaluation_window = '90 days' } },
  @{ name = 'first_consumer_order'; values = @{ event = 'first_consumer_order'; baseline = 'false'; target = 'true'; owner = 'campaign-director'; data_source = 'verified marketplace order record'; evaluation_window = '90 days' } }
)) {
  $pattern = '(?m)^  ' + [regex]::Escape($definition.name) + ':[ \t]*\r?\n(?<body>(?:^    [^\r\n]*(?:\r?\n|$))*)'
  $match = [regex]::Match($measurement, $pattern)
  if (-not $match.Success) { throw "Missing measurement definition: $($definition.name)" }
  $normalized = [regex]::Replace($match.Groups['body'].Value, '(?m)^  ', '')
  Assert-ExactDirectMap $normalized $definition.values "measurement_definitions.$($definition.name)"
}

$approvalTemplate = Get-Content -Raw -Encoding UTF8 (Join-Path $root 'templates/approval-package.md')
foreach ($field in @('Campaign ID:', 'Version ID:', 'Decision requested:', 'Target channel:', 'Audience/product:', 'Proposed asset:', 'Status', 'Source URL', 'Access date', 'Validation method', 'Unresolved items', 'Dependencies', 'Missing information', 'Event', 'Baseline', 'Target', 'Owner', 'Data source', 'Evaluation window', 'Approval state:', 'Acceptance status:')) {
  Assert-Contains $approvalTemplate ([regex]::Escape($field)) "Approval template missing required field: $field"
}
foreach ($encodedChoice in @('7Iq57J24', '7IiY7KCVIO2bhCDsirnsnbg=', '67O066WY')) {
  $choice = [Text.Encoding]::UTF8.GetString([Convert]::FromBase64String($encodedChoice))
  Assert-Contains $approvalTemplate ([regex]::Escape($choice)) "Approval template missing required user choice: $choice"
}

$blogTemplate = Get-Content -Raw -Encoding UTF8 (Join-Path $root 'templates/blog-package.md')
Assert-Contains $blogTemplate '(?m)^## Dependencies[ \t]*\r?$' 'Blog template must include Dependencies'
Assert-Contains $blogTemplate '(?mi)hypothesis validation method' 'Blog template must include a hypothesis validation method field'
Assert-Contains $blogTemplate '(?m)^## Website conversion[ \t]*\r?$' 'Blog template must include Website conversion'
foreach ($field in @('CTA headline:', 'Supporting copy:', 'Recommended placement:', 'Inquiry-form or navigation improvement:')) {
  Assert-Contains $blogTemplate ([regex]::Escape($field)) "Blog website-conversion section missing field: $field"
}

$marketplaceTemplate = Get-Content -Raw -Encoding UTF8 (Join-Path $root 'templates/marketplace-package.md')
Assert-Contains $marketplaceTemplate '(?m)^## Dependencies[ \t]*\r?$' 'Marketplace template must include Dependencies'
Assert-Contains $marketplaceTemplate '(?i)marketplace account access' 'Marketplace dependencies must include marketplace account access'
Assert-Contains $marketplaceTemplate '(?m)^## Decision evidence[ \t]*\r?$' 'Marketplace template must include Decision evidence'
foreach ($field in @('Listing decision', 'Channel', 'Status', 'Source URL', 'Access date', 'Validation method')) {
  Assert-Contains $marketplaceTemplate ([regex]::Escape($field)) "Marketplace decision-evidence table missing field: $field"
}
foreach ($decision in @('title', 'search terms', 'option structure', 'benefit hierarchy', 'detail-page framing', 'image plan')) {
  Assert-Contains $marketplaceTemplate ('(?i)' + [regex]::Escape($decision)) "Marketplace decision-evidence table missing decision: $decision"
}

$team = Get-Content -Raw -Encoding UTF8 (Join-Path $root 'team.yaml')
$multiline = [Text.RegularExpressions.RegexOptions]::Multiline
foreach ($expected in @('team: i-ufb-marketing', 'concurrency: 4')) {
  $pattern = '^' + [regex]::Escape($expected) + '[ \t]*\r?$'
  if (-not [regex]::IsMatch($team, $pattern, $multiline)) {
    throw "Missing or invalid team.yaml setting: $expected"
  }
}

$rolesMatch = [regex]::Match($team, '(?m)^roles:[ \t]*\r?\n(?<body>(?:^[ \t]+[^\r\n]*(?:\r?\n|$))*)')
if (-not $rolesMatch.Success) {
  throw 'Missing roles section in team.yaml'
}
$rolesBody = $rolesMatch.Groups['body'].Value
foreach ($role in @(
  @{ id = 'campaign-director'; owner = 'primary-agent' },
  @{ id = 'product-marketing'; owner = 'subagent' },
  @{ id = 'content-search'; owner = 'subagent' },
  @{ id = 'marketplace-commerce'; owner = 'subagent' }
)) {
  $pattern = '(?m)^  - id: ' + [regex]::Escape($role.id) + '[ \t]*\r?\n    owner: ' + [regex]::Escape($role.owner) + '[ \t]*\r?$'
  if (-not [regex]::IsMatch($rolesBody, $pattern)) {
    throw "Missing or invalid role in team.yaml: $($role.id) owner $($role.owner)"
  }
}

$actionsMatch = [regex]::Match($team, '(?m)^external_actions:[ \t]*\r?\n(?<body>(?:^[ \t]+[^\r\n]*(?:\r?\n|$))*)')
if (-not $actionsMatch.Success) {
  throw 'Missing external_actions section in team.yaml'
}
$actionsBody = $actionsMatch.Groups['body'].Value
foreach ($action in @(
  @{ name = 'customer_material_delivery'; value = 'forbidden' },
  @{ name = 'publish_or_list'; value = 'approval_required' },
  @{ name = 'price_change'; value = 'approval_required' },
  @{ name = 'advertising'; value = 'approval_required' }
)) {
  $expected = '  ' + $action.name + ': ' + $action.value
  $pattern = '(?m)^' + [regex]::Escape($expected) + '[ \t]*\r?$'
  if (-not [regex]::IsMatch($actionsBody, $pattern)) {
    throw "Missing or invalid external action in team.yaml: $($action.name) $($action.value)"
  }
}

$policy = Get-Content -Raw -Encoding UTF8 (Join-Path $root 'policies/approval-and-sources.md')
foreach ($rule in @(
  'Customer contact and material delivery are permanently forbidden and excluded from every approval pathway.',
  'External approval applies only to publishing, listing, price changes, and advertising; it never applies to customer contact or material delivery.'
)) {
  Assert-Contains $policy ('(?m)^- ' + [regex]::Escape($rule) + '[ \t]*\r?$') "Missing exact permanent-boundary policy rule: $rule"
}
$sources = @(
  'https://www.ufb.co.kr',
  'https://blog.naver.com/i-ultrafinebubble',
  'User-supplied product data'
)
foreach ($source in $sources) {
  $pattern = '(?m)^- ' + [regex]::Escape($source) + '[ \t]*\r?$'
  if (-not [regex]::IsMatch($policy, $pattern)) {
    throw "Missing allowed product source: $source"
  }
}

$encodedRules = @(
  '6rO17IudIOyekOujjOyZgCDsgqzsmqnsnpDqsIAg7KCc6rO17ZWcIOygleuztOunjCDsoJztkogg7IKs7Iuk7J2YIOq3vOqxsOuhnCDsgqzsmqntlZzri6Qu',
  '7ZmV7J2465CY7KeAIOyViuydgCDshLHriqUg7IiY7LmY66W8IOyDneyEse2VmOyngCDslYrripTri6Qu',
  '7ZmV7J2465CY7KeAIOyViuydgCDsnbjspp0sIOqzoOqwnSDtm4TquLAsIOu5hOq1kOyasOychOulvCDsg53shLHtlZjsp4Ag7JWK64qU64ukLg==',
  '7YyQ66ekIO2VhOyImCDsoJXrs7TqsIAg7JeG7Jy866m0IOuIhOudvSDsoJXrs7Qg66qp66Gd7J2EIOq4sOuhne2VmOqzoCDstpTsuKHtlZjsp4Ag7JWK64qU64ukLg==',
  '6rOg6rCd7JeQ6rKMIOyekOujjOulvCDrsJzshqHtlZjsp4Ag7JWK64qU64ukLg==',
  '7Iq57J24IOyghOyXkCDsmbjrtoAg6rKM7Iuc66W8IO2VmOyngCDslYrripTri6Qu',
  '7Iq57J24IOyghOyXkCDsg4Htkogg65Ox66GdLCDqsIDqsqkg67OA6rK9IOuYkOuKlCDqtJHqs6Ag7KeR7ZaJ7J2EIO2VmOyngCDslYrripTri6Qu',
  '7Jm467aAIOyekeyXheydgCDsgqzsmqnsnpDqsIAg64yA7IOBLCDsgrDstpzrrLzqs7wg7J6R7JeFIOuylOychOulvCDrqoXsi5zsoIHsnLzroZwg7Iq57J247ZWcIOqyveyasOyXkOunjCDsp4TtlontlZzri6Qu'
)
foreach ($encodedRule in $encodedRules) {
  $rule = [Text.Encoding]::UTF8.GetString([Convert]::FromBase64String($encodedRule))
  $pattern = '(?m)^- ' + [regex]::Escape($rule) + '[ \t]*\r?$'
  if (-not [regex]::IsMatch($policy, $pattern)) {
    throw "Missing policy rule: $rule"
  }
}

Write-Output 'PASS: i-UFB marketing team structure is valid.'
