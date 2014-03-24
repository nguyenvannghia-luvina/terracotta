@echo off
SET /P TC_URL=Please input Terracotta server IP address and port, e.g. 10.0.0.123:9510:
if "%TC_URL%" == "" (
    echo You did not input TC Server URL, use system default value: localhost:9510
    set TC_URL=localhost:9510
)

move wiperdog\etc\quartz.properties wiperdog\etc\quartz.properties_bak
echo org.quartz.scheduler.instanceName:TestScheduler >> wiperdog\etc\quartz.properties
echo org.quartz.scheduler.instanceId:groovy_instance >> wiperdog\etc\quartz.properties
echo org.quartz.scheduler.skipUpdateCheck:true >> wiperdog\etc\quartz.properties
echo org.quartz.threadPool.class:org.quartz.simpl.SimpleThreadPool >> wiperdog\etc\quartz.properties
echo org.quartz.threadPool.threadCount:1 >> wiperdog\etc\quartz.properties
echo org.quartz.threadPool.threadPriority:5 >> wiperdog\etc\quartz.properties
echo org.quartz.jobStore.misfireThreshold:60000 >> wiperdog\etc\quartz.properties
echo org.quartz.jobStore.class:org.terracotta.quartz.TerracottaJobStore >> wiperdog\etc\quartz.properties
echo org.quartz.jobStore.tcConfigUrl:$TC_URL >> wiperdog\etc\quartz.properties
.\wiperdog\bin\startWiperdog.sh
