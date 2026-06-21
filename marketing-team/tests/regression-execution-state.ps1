$ErrorActionPreference = 'Stop'

$validator = Join-Path $PSScriptRoot 'validate-team.ps1'
$output = & powershell -ExecutionPolicy Bypass -File $validator 2>&1

if ($LASTEXITCODE -ne 0) {
  throw "A valid active campaign with an execution record must pass validation.`n$output"
}

if (($output -join "`n") -notmatch 'PASS: i-UFB marketing team structure is valid\.') {
  throw 'Validator did not emit its success contract.'
}

Write-Output 'PASS: active campaign execution record is accepted.'
