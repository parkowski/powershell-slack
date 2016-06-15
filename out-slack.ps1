<#
.SYNOPSIS
Script Name: Out-Slack
Created: 4/19/2016
Author: Yong Park

.DESCRIPTION
Purpose: output a message to slack
#>

[cmdletBinding()]
Param
(
    [Parameter(Mandatory=$True)][string]$channel,
    [Parameter(Mandatory=$True)][string]$URL,
    [Parameter(Mandatory=$True)][string]$messagetext,
    [Parameter(Mandatory=$True)][string]$username,
    [Parameter(Mandatory=$False)][string]$icon=':robot_face:'
)

$postSlackMessage = @{
    text=$messagetext
    channel=$channel
    username=$username
    icon_emoji=$icon
}

$json = $postSlackMessage | ConvertTo-Json
$response = Invoke-RestMethod $URL -Method Post -Body $json -ContentType 'application/json'
