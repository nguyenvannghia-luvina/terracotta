@echo off
cls
echo Start configuring Wiperdog without using JOB MANAGER
move wiperdog\bin\ListBundle.csv wiperdog\bin\ListBundle.csv_bak
copy terracottaWithWiperdogUseGroovyScript\bin\ListBundle.csv wiperdog\bin\ListBundle.csv
move wiperdog\bin\startGroovy wiperdog\bin\startGroovy_bak
copy terracottaWithWiperdogUseGroovyScript\bin\startGroovy wiperdog\bin\startGroovy
move wiperdog/bin/startGroovy.bat wiperdog\bin\startGroovy.bat_bak
copy terracottaWithWiperdogUseGroovyScript\bin\startGroovy.bat wiperdog\bin\startGroovy.bat

move wiperdog\etc\boot.groovy wiperdog\etc\boot.groovy_bak
copy terracottaWithWiperdogUseGroovyScript\etc\boot.groovy wiperdog\etc\boot.groovy
move wiperdog\etc\config.properties wiperdog\etc\config.properties_bak
copy terracottaWithWiperdogUseGroovyScript\etc\config.properties wiperdog\etc\config.properties
# copy terracottaWithWiperdogUseGroovyScript\etc\quartz.properties wiperdog\etc\quartz.properties

copy terracottaWithWiperdogUseGroovyScript\lib\groovy\libs.common\Terracotta_Prototype.groovy wiperdog\lib\groovy\libs.common\Terracotta_Prototype.groovy

copy terracottaWithWiperdogUseGroovyScript\lib\groovy\libs.target\CustomJob.groovy wiperdog\lib\groovy\libs.target\CustomJob.groovy
copy terracottaWithWiperdogUseGroovyScript\lib\groovy\libs.target\Helper.groovy wiperdog\lib\groovy\libs.target\Helper.groovy

# copy terracottaWithWiperdogUseGroovyScript\lib\java\bundle\quartz-2.2.1.jar wiperdog\lib\java\bundle\quartz-2.2.1.jar
copy quartz-2.2.1\target\quartz-2.2.1.jar wiperdog\lib\java\bundle\quartz-2.2.1.jar

copy terracottaWithWiperdogUseGroovyScript\var\conf\dbconnect.cfg wiperdog\var\conf\dbconnect.cfg

del /F wiperdog\var\job\*.*
copy terracottaWithWiperdogUseGroovyScript\var\job\a.trg wiperdog\var\job\a.trg
copy terracottaWithWiperdogUseGroovyScript\var\job\job1.job wiperdog\var\job\job1.job
