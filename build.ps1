# Build (and optionally sign) Focus Timers as one portable .exe.  Run in PowerShell from this folder.
#   .\build.ps1                                   -> unsigned dist\FocusTimers.exe
#   .\build.ps1 -Thumbprint <SHA1 of cert in your Windows cert store>
#   .\build.ps1 -Pfx C:\path\cert.pfx -PfxPassword "..."
# One-time prerequisites: Rust (rustup.rs) + "Desktop development with C++" Build Tools;
# signing also needs the Windows SDK (signtool.exe) and your code-signing certificate.
param(
  [string]$Thumbprint,
  [string]$Pfx,
  [string]$PfxPassword,
  [string]$Timestamp = "http://timestamp.digicert.com"
)
$ErrorActionPreference = "Stop"

if (-not (Get-Command cargo-tauri -ErrorAction SilentlyContinue)) {
  cargo install tauri-cli --version "^2" --locked
}

cargo tauri build --no-bundle

$built = "src-tauri\target\release\focus-timers.exe"
if (-not (Test-Path $built)) { throw "Build failed: $built not found" }
New-Item -ItemType Directory -Force dist | Out-Null
$out = "dist\FocusTimers.exe"
Copy-Item $built $out -Force

if ($Thumbprint -or $Pfx) {
  $st = Get-ChildItem "${env:ProgramFiles(x86)}\Windows Kits\10\bin\*\x64\signtool.exe" |
        Sort-Object FullName -Descending | Select-Object -First 1
  if (-not $st) { throw "signtool.exe not found - install the Windows SDK" }
  $signArgs = @("sign", "/fd", "SHA256", "/tr", $Timestamp, "/td", "SHA256")
  if ($Thumbprint) { $signArgs += @("/sha1", $Thumbprint) }
  else             { $signArgs += @("/f", $Pfx, "/p", $PfxPassword) }
  & $st.FullName @signArgs $out
  & $st.FullName verify /pa $out
}
Write-Host "Done: $out"
