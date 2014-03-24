@echo off 
cls
set errorLevel=0
call mvn -v || set errorLevel=1
if %errorLevel% == 1 (
  echo Maven command not found, please install
  goto NORMAL_EXIT
)

::SET CUR_DIR="%~dp0"
SET CUR_DIR="%CD%"

echo Current directory %CUR_DIR%
echo Getting wiperdog from maven repository. It could takes minutes...
mvn org.apache.maven.plugins:maven-dependency-plugin:2.4:get -Dartifact=org.wiperdog:wiperdog-assembly:0.2.4:jar:unix -Ddest=%CUR_DIR%/wiperdog-assembly.jar -Dmdep.useBaseVersion=true
:NORMAL_EXIT