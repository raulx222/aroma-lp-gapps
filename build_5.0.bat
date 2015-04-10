	set STRUCTURE="structure"
	set COPYSTRUCTURE="D:\Github\slimlp_gapps\structure"
	echo y|rmdir %STRUCTURE% /s
	
    mkdir %STRUCTURE%

	xcopy %COPYSTRUCTURE% %STRUCTURE% /S
	
	ant -buildfile build_5.0.xml
	
    pause