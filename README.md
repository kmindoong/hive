# 하이브 (Hive) 교육
## 실습 환경 구축

- Virtualbox 다운로드 & 설치

    > https://www.virtualbox.org/wiki/Downloads
- HDP 샌드박스(v2.6.3) 다운로드

    > https://downloads-hortonworks.akamaized.net/sandbox-hdp-2.6.3/HDP_2.6.3_virtualbox_16_11_2017.ova
- putty 다운로드

    > https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html
- Local PC hosts 에 hostname 등록

    `127.0.0.1 sandbox-hdp.hortonworks.com`  

    - for windows

        > C:\Windows\System32\drivers\etc\hosts 파일 수정

    - for mac or linux

        > /etc/hosts 
    
- HDP 샌드박스에 ssh 접속 (putty)
    - ssh 접속정보
    
        |속성|값|
        |-|-|
        |hostname|sandbox-hdp.hortonworks.com|
        |port|2222|
        |username|root|
        |password|hadoop|
    - hostname : sandbox-hdp.hortonworks.com
    - port : 2222
    - username : root
    - password : hadoop
- root 패스워드 변경 : hadoop(초기 패스워드) -> bigdata123
- hdfs 계정으로 전환 (실습은 hdfs 계정으로 진행)
    ```bash
    # hdfs 계정에 패스워드 생성
    # "hdfs"로 설정
    $ passwd hdfs
    $ su - hdfs
    ```

<br>

## Hadoop 구동 및 상태 확인
- Ambari 접속 (Web browser)

    > http://sandbox-hdp.hortonworks.com:8080 (raj_ops / raj_ops)
- Hadoop Eco 구동
    - HDFS
        - Maintenance mode off
    - YARN
    - MapReduce
    - Hive
    - Oozie
    - Zookeeper
    - Kafka
        - Maintenance mode off
    - Spark2
- Hadoop Eco 상태 확인
    - HDFS
        ```bash
        $ hadoop fs -ls /
        Found 13 items
        drwxrwxrwx   - yarn   hadoop          0 2017-11-10 14:59 /app-logs
        drwxr-xr-x   - hdfs   hdfs            0 2017-11-10 14:45 /apps
        drwxr-xr-x   - yarn   hadoop          0 2017-11-10 14:37 /ats
        drwxr-xr-x   - hdfs   hdfs            0 2017-11-10 14:52 /demo
        drwxr-xr-x   - hdfs   hdfs            0 2017-11-10 14:38 /hdp
        drwx------   - livy   hdfs            0 2017-11-10 14:40 /livy2-recovery
        drwxr-xr-x   - mapred hdfs            0 2017-11-10 14:38 /mapred
        drwxrwxrwx   - mapred hadoop          0 2017-11-10 14:38 /mr-history
        drwxr-xr-x   - hdfs   hdfs            0 2017-11-10 14:37 /ranger
        drwxrwxrwx   - spark  hadoop          0 2017-11-10 15:08 /spark2-history
        drwxrwxrwx   - hdfs   hdfs            0 2017-11-10 15:00 /tmp
        drwxr-xr-x   - hdfs   hdfs            0 2017-11-10 15:00 /user
        drwxr-xr-x   - hdfs   hdfs            0 2017-11-10 14:38 /webhdfs
        ```
    - YARN
    
        > http://sandbox-hdp.hortonworks.com:8088
    - MapReduce
    
        > http://sandbox-hdp.hortonworks.com:19888    
    - Hive
        ```bash
        $ hive
        hive> select * from sample_07 limit 5;
        OK
        00-0000	All Occupations	134354250	40690
        11-0000	Management occupations	6003930	96150
        11-1011	Chief executives	299160	151370
        11-1021	General and operations managers	1655410	103780
        11-1031	Legislators	61110	33880
        Time taken: 1.466 seconds, Fetched: 10 row(s)
        ```
        set hive.cli.print.header=true;

    - Oozie
        
        > http://sandbox-hdp.hortonworks.com:11000/oozie

## 실습1. Ambari 살펴보기

- Ambari 접속 (Web browser)

    > http://sandbox-hdp.hortonworks.com:8080 (raj_ops / raj_ops)

## 실습2. HDFS 명령어

- 교재 21페이지

## 실습3. HIVE CLI 명령어

- 교재 48페이지

## 실습4. 항공데이터

    