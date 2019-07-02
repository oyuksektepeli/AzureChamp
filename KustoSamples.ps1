#kustosamples
https://github.com/MicrosoftDocs/LogAnalyticsExamples/tree/master/log-analytics

#sample data playground
https://portal.loganalytics.io/demo#/discover/query/main


#list computers has most errors
Event
| where (EventLeventName == "Error")
| where (TimeGenerated > ago(5days))
| summarize ErrorCount = count() by Computer
| top 10 by ErrorCount desc

SecurityEvent
| where TimeGenerated > ago(30m) 
| project Activity 
| parse Activity with activityID " - " activityDesc
| summarize count() by activityID

SecurityEvent	
| sort by TimeGenerated desc

SecurityEvent 
| top 10 by TimeGenerated 
| project TimeGenerated, Computer, Activity

#find stale computers
Heartbeat
| where TimeGenerated > ago(1d)
| summarize LastHeartbeat = max(TimeGenerated) by Computer
| where isnotempty(Computer)
| where LastHeartbeat < ago(1h)

#server availability rate
let start_time=startofday(datetime("2019-05-01"));
let end_time=now();
Heartbeat
| where TimeGenerated > start_time and TimeGenerated < end_time
| summarize heartbeat_per_hour=count() by bin_at(TimeGenerated, 1h, start_time), Computer
| extend available_per_hour=iff(heartbeat_per_hour>0, true, false)
| summarize total_available_hours=countif(available_per_hour==true) by Computer 
| extend total_number_of_buckets=round((end_time-start_time)/1h)+1
| extend availability_rate=total_available_hours*100/total_number_of_buckets

#find security events
SecurityEvent
| where TimeGenerated > ago(30m) 
| project Activity 
| parse Activity with activityID " - " activityDesc
| summarize count() by activityID

#performance counter event
Perf
| where TimeGenerated > ago(1h)
| summarize count() by ObjectName, CounterName

Perf
| where TimeGenerated > ago(4h)
| where Computer startswith "mac" 
| where CounterName == @"% Processor Time"
| summarize avg(CounterValue) by Computer, bin(TimeGenerated, 15m) 
| render timechart

#computer missing updates
let ComputersMissingUpdates3DaysAgo = Update
| where TimeGenerated between (ago(3d)..ago(2d))
| where  Classification == "Critical Updates" and UpdateState != "Not needed" and UpdateState != "NotNeeded"
| summarize makeset(Computer);

Update
| where TimeGenerated > ago(1d)
| where  Classification == "Critical Updates" and UpdateState != "Not needed" and UpdateState != "NotNeeded"
| where Computer in (ComputersMissingUpdates3DaysAgo)
| summarize UniqueUpdatesCount = dcount(Product) by Computer, OSType

