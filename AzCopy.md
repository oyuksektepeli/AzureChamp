**Copy File with new Name**\
AzCopy /Source:C:\upload\testfile1.txt /Dest:https://testaccount.blob.core.windows.net/newcontainer1/myfile.txt /DestKey:

**Copy Only txt files**\
AzCopy /Source:C:\upload\  /Dest:https://testaccount.blob.core.windows.net/newcontainer1 DestKey: /Pattern:"*.txt"

**Copy Recursively**\
AzCopy /Source:C:\upload\  /Dest:https://testaccount.blob.core.windows.net/newcontainer1 DestKey: /Pattern:"*.txt" /S

**Copy Only Changed Files**\
AzCopy /Source:C:\upload\  /Dest:https://testaccount.blob.core.windows.net/newcontainer1 DestKey: /Pattern:"*.txt" /S /XO

**Copy only new files**\
AzCopy /Source:C:\upload\  /Dest:https://testaccount.blob.core.windows.net/newcontainer1 DestKey: /Pattern:"*.txt" /S /XN

**Copy only read only attribute files**\
AzCopy /Source:C:\upload\  /Dest:https://testaccount.blob.core.windows.net/newcontainer1 DestKey: /Pattern:"*.txt" /IA:R

**Concurrent Copy**\
AzCopy /Source:C:\upload\  /Dest:https://testaccount.blob.core.windows.net/newcontainer1 DestKey: /NC:10

**Create a Log File**\
AzCopy /Source:C:\upload\  /Dest:https://testaccount.blob.core.windows.net/newcontainer1 DestKey: /S /Y /V:C:\Logs

**Upload with SaS Key And Blob Type paramater**\
AzCopy /Source:C:\upload\  /Dest:https://testaccount.blob.core.windows.net/newcontainer1 DestSAS:"" /BlobType:"append"