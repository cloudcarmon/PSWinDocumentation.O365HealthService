﻿Import-Module PSWinDocumentation.O365HealthService -Force
Import-Module Dashimo -Force

$ApplicationID = ''
$ApplicationKey = ''
$TenantDomain = 'evotec.pl' # CustomDomain (onmicrosoft.com won't work), alternatively you can use DirectoryID

$O365 = Get-Office365Health -ApplicationID $ApplicationID -ApplicationKey $ApplicationKey -TenantDomain $TenantDomain -ToLocalTime -Verbose

Dashboard -FilePath $PSScriptRoot\Health.html {
    Tab -Name 'Services' {
        Section -Invisible {
            Section -Name 'Service List' {
                Table -DataTable $O365.Services
            }
            Section -Name 'Service & Feature List' {
                Table -DataTable $O365.ServicesExtended
            }
        }
    }
    Tab -Name 'Current Status' {
        Section -Invisible {
            Section -Name 'Current Status' {
                Table -DataTable $O365.CurrentStatus
            }
            Section -Name 'Current Status Extended' {
                Table -DataTable $O365.CurrentStatusExtended
            }
        }
    }
    Tab -Name 'Historical Status' {
        Section -Invisible {
            Section -Name 'Historical Status' {
                Table -DataTable $O365.HistoricalStatus
            }
            Section -Name 'Historical Status Extended' {
                Table -DataTable $O365.HistoricalStatusExtended
            }
        }
    }
    Tab -Name 'Message Center Information' {
        Section -Invisible {
            Section -Name 'Message Center' {
                Table -DataTable $O365.MessageCenterInformation
            }
            Section -Name 'Message Center Extended' {
                Table -DataTable $O365.MessageCenterInformationExtended -InvokeHTMLTags
            }
        }
    }
    Tab -Name 'Incidents' {
        Section -Invisible {
            Section -Name 'Incidents' {
                Table -DataTable $O365.Incidents
            }
            Section -Name 'Incidents Extended' {
                Table -DataTable $O365.IncidentsExtended
            }
        }
    }
    Tab -Name 'Incidents Messages' {
        Section -Invisible {
            Section -Name 'Incidents Messages' {
                Table -DataTable $O365.IncidentsMessages
            }
        }
    }
    Tab -Name 'Planned Maintenance' {
        Section -Invisible {
            Section {
                Table -DataTable $O365.PlannedMaintenance
            }
            Section {
                Table -DataTable $O365.PlannedMaintenanceExtended
            }
        }
    }
}