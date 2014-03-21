echo "Terracotta server address:"
        read TC_URL
        TC_URL=TC_URL | tr -d ' '
        if [ "$TC_URL" = "" ]; then
                TC_URL=localhost:9510
        fi

        mv -f wiperdog/etc/quartz.properties wiperdog/etc/quartz.properties_bak
        echo org.quartz.scheduler.instanceName:TestScheduler >> wiperdog/etc/quartz.properties
        echo org.quartz.scheduler.instanceId:groovy_instance >> wiperdog/etc/quartz.properties
        echo org.quartz.scheduler.skipUpdateCheck:true >> wiperdog/etc/quartz.properties
        echo org.quartz.threadPool.class:org.quartz.simpl.SimpleThreadPool >> wiperdog/etc/quartz.properties
        echo org.quartz.threadPool.threadCount:1 >> wiperdog/etc/quartz.properties
        echo org.quartz.threadPool.threadPriority:5 >> wiperdog/etc/quartz.properties
        echo org.quartz.jobStore.misfireThreshold:60000 >> wiperdog/etc/quartz.properties
        echo org.quartz.jobStore.class:org.terracotta.quartz.TerracottaJobStore >> wiperdog/etc/quartz.properties
        echo org.quartz.jobStore.tcConfigUrl:$TC_URL >> wiperdog/etc/quartz.properties
        ./wiperdog/bin/startWiperdog.sh
