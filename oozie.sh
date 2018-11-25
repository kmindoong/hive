###### workflow
su - hdfs

cd ~
wget http://archive.apache.org/dist/oozie/4.2.0/oozie-4.2.0.tar.gz
tar zxvf oozie-4.2.0.tar.gz
mkdir examples
cp -R ~/oozie-4.2.0/examples/src/main/apps ./examples
hadoop fs -mkdir -p /user/hdfs/examples/apps


# vi script.q
USE xademo;
DROP TABLE IF EXISTS new_count_tab;
CREATE TABLE AS SELECT unix_timestamp(), count(*) FROM call_detail_records;

# vi workflow.xml
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


# vi job_wf.properties
nameNode=hdfs://sandbox-hdp.hortonworks.com:8020
jobTracker=sandbox-hdp.hortonworks.com:8032
queueName=default
examplesRoot=examples
oozie.use.system.libpath=true
oozie.wf.application.path=${nameNode}/user/${user.name}/${examplesRoot}/apps/hive




cd /home/hdfs/examples/apps/hive/

hadoop fs -put script.q workflow.xml /user/hdfs/examples/apps/hive

oozie job -oozie http://sandbox-hdp.hortonworks.com:11000/oozie -config /home/hdfs/examples/apps/hive/job_wf.properties -run


oozie jobs
oozie job -info





###### coordinator


mkdir coordinator

# vi test.q
USE xademo;
DROP TABLE IF EXISTS CREATE_KWON;
CREATE TABLE CREATE_KWON AS SELECT unix_timestamp(), count(*) FROM call_detail_records;


# coordinator.xml
<coordinator-app name="cron-coord" frequency="${coord:minutes(5)}" start="${start}" end="${end}" timezone="Asia/Seoul"
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


# job_co.properties
nameNode=hdfs://sandbox-hdp.hortonworks.com:8020
jobTracker=sandbox-hdp.hortonworks.com:8032
queueName=default
examplesRoot=examples
oozie.use.system.libpath=true
oozie.coord.application.path=${nameNode}/user/${user.name}/${examplesRoot}/apps/schedule
start=2018-11-25T05:45Z
end=2018-11-25T06:00Z
workflowAppUri=${nameNode}/user/${user.name}/${examplesRoot}/apps/schedule


# vi workflow.xml
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
            <script>test.q</script>
        </hive>
        <ok to="end"/>
        <error to="fail"/>
    </action>

    <kill name="fail">
        <message>Hive failed, error message[${wf:errorMessage(wf:lastErrorNode())}]</message>
    </kill>
    <end name="end"/>
</workflow-app>



cd /home/hdfs/examples/apps/hive/coordinator

hadoop fs -mkdir -p /user/hdfs/examples/apps/schedule

hadoop fs -put test.q workflow.xml examples/apps/schedule

oozie job -oozie http://sandbox-hdp.hortonworks.com:11000/oozie -config /home/hdfs/examples/apps/hive/coordinator/job_co.properties -run

