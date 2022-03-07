dim WSHshell 
set WSHshell = wscript.createobject("wscript.shell") 
WSHshell.run "taskkill /im wscript.exe /f ",0 ,true 
