# Copyright (c) 2023 Ronaldo Faria Lima <ronaldo@brazuca.dev>
# ===
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

<#!
.SYNOPSIS
Managerial script to deal to simplify this example.
.PARAMETER Action
Action to be carried out by the manager. Can be:
- up: Runs the example under docker compose
- down: Turns off the docker compose example
- clean: Removes all generated files, cleaning up the local folders
#>

param(
    [Parameter()]
    [string]$Action 
)

$Env:STORAGE_ROOT = (Get-Location)
$Env:AIRFLOW_UID = 0
$Env:AIRFLOW_GID = 0

switch ($Action) {
    "up" {
        & docker compose up --detach
    }
    "down" {
        & docker compose down
    }
    "clean" {
        Remove-Item -Path $Env:STORAGE_ROOT\airflow -Recurse
    }
    default {
        Write-Output "Action not recognized"
    }
}