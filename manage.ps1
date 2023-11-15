# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#

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