	set STRUCTURE="structure"
	set COPYSTRUCTURE="D:\GApps\structure"
	echo y|rmdir %STRUCTURE% /s
	
    mkdir %STRUCTURE%

	xcopy %COPYSTRUCTURE% %STRUCTURE% /S
	
	call ant -buildfile build_5.1.xml
	
    pause