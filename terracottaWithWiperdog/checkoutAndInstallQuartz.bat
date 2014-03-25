@echo off
cls
set CUR_DIR=%CD%
echo Cheking installed Subversion client...
set hasErrors=0
call svn --version || set hasErrors=1
if %hasErrors%==1 GOTO EXIT_WITH_ERROR

echo Checking installed Maven...
set hasErrors=0
call mvn -v || set hasErrors=1
if %hasErrors%==1 GOTO EXIT_WITH_ERROR

if EXIST quartz-2.2.1 GOTO QUARTZ_EXIST
        echo Start checkout quartz from subversion repository...
        svn checkout http://svn.terracotta.org/svn/quartz/tags/quartz-2.2.1/quartz/ quartz-2.2.1
        copy quartz\pom.xml quartz-2.2.1\
        cd %CUR_DIR%\quartz-2.2.1
        set hasErrors=0
        call mvn install || set hasErrors=1
        :: got error while installing
        if %hasErrors%==1 (
        	echo There are error in maven building! Maybe dependencies errors.
        	echo Please checkout and build ehcache, quartz, terracotta.
            echo For help. Please refer to https://github.com/dothihuong-luvina/terracotta.git terracotta_lib_and_server
			GOTO NORMAL_EXIT
        )

:QUARTZ_EXIST
echo Quartz already exist in folder %CD%\quartz-2.2.1, if you want to re-install, please delete first!
GOTO NORMAL_EXIT

:EXIT_WITH_ERROR
echo Maven or Subversion command not found, please install that software first!

:NORMAL_EXIT
