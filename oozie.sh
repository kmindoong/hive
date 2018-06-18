
# workflow
su - hdfs


wget http://archive.apache.org/dist/oozie/4.2.0/oozie-4.2.0.tar.gz


tar zxvf oozie-4.2.0.tar.gz


mkdir examples


cp -R ~/oozie-4.2.0/examples/src/main/apps ./examples


hadoop fs -mkdir /user/hdfs/examples/apps


hadoop fs -put examples/apps/hive examples/apps/hive


# script.q
USE xademo;
DROP TABLE IF EXISTS new_count_tab;
CREATE TABLE AS SELECT unix_timestamp(), count(*) FROM call_detail_records;


# workflow.xml
<workflow-app xmlns="uri:oozie:workflow:0.2" name="hive-wf">
    <start to="hive-node"/>

    <action name="hive-node">
        <hive xmlns="uri:oozie:hive-action:0.2">
            <job-tracker>${jobTracker}</job-tracker>
            <name-node>${nameNode}</name-node>
            <prepare>
                <delete path="${nameNode}/user/${wf:user()}/${examplesRoot}/output-data/hive"/>
                <mkdir path="${nameNode}/user/${wf:user()}/${examplesRoot}/output-data"/>
            </prepare>
            <configuration>
                <property>
                    <name>mapred.job.queue.name</name>
                    <value>${queueName}</value>
                </property>
            </configuration>
            <script>script.q</script>
        </hive>
        <ok to="end"/>
        <error to="fail"/>
    </action>

    <kill name="fail">
        <message>Hive failed, error message[${wf:errorMessage(wf:lastErrorNode())}]</message>
    </kill>
    <end name="end"/>
</workflow-app>


# job.properties
nameNode=hdfs://sandbox-hdp.hortonworks.com:8020
jobTracker=sandbox-hdp.hortonworks.com:8032
queueName=default
examplesRoot=examples
oozie.use.system.libpath=true



oozie job -oozie http://sandbox-hdp.hortonworks.com:11000/oozie -config examples/apps/hive/job.properties -run


###### coordinator

# coordinator.xml
<coordinator-app name="cron-coord" frequency="0/10 * * * *" start="${start}" end="${end}" timezone="Asia/Seoul"
                 xmlns="uri:oozie:coordinator:0.2">
        <action>
        <workflow>
            <app-path>${workflowAppUri}</app-path>
            <configuration>
                <property>
                    <name>jobTracker</name>
                    <value>${jobTracker}</value>
                </property>
                <property>
                    <name>nameNode</name>
                    <value>${nameNode}</value>
                </property>
                <property>
                    <name>queueName</name>
                    <value>${queueName}</value>
                </property>
            </configuration>
        </workflow>
    </action>
</coordinator-app>


# job.properties
nameNode=hdfs://sandbox-hdp.hortonworks.com:8020
jobTracker=sandbox-hdp.hortonworks.com:8032
queueName=default
examplesRoot=examples

oozie.coord.application.path=${nameNode}/user/${user.name}/${examplesRoot}/apps/cron-schedule
start=2018-06-18T21:25Z
end=2018-06-18T22:00Z
workflowAppUri=${nameNode}/user/${user.name}/${examplesRoot}/apps/cron-schedule

#workflow.xml
<workflow-app xmlns="uri:oozie:workflow:0.2" name="hive-wf">
    <start to="hive-node"/>
    <action name="hive-node">
        <hive xmlns="uri:oozie:hive-action:0.2">
            <job-tracker>${jobTracker}</job-tracker>
            <name-node>${nameNode}</name-node>
            <prepare>
                <delete path="${nameNode}/user/${wf:user()}/${examplesRoot}/output-data/hive"/>
                <mkdir path="${nameNode}/user/${wf:user()}/${examplesRoot}/output-data"/>
            </prepare>
            <configuration>
                <property>
                    <name>mapred.job.queue.name</name>
                    <value>${queueName}</value>
                </property>
            </configuration>
            <script>script.q</script>
        </hive>
        <ok to="end"/>
        <error to="fail"/>
    </action>

    <kill name="fail">
        <message>Hive failed, error message[${wf:errorMessage(wf:lastErrorNode())}]</message>
    </kill>
    <end name="end"/>
</workflow-app>


hadoop fs -put examples/apps/hive examples/apps/hive

oozie job -oozie http://sandbox-hdp.hortonworks.com:11000/oozie -config examples/apps/cron-schedule/job.properties -run
