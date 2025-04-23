python visitlog.py  

pscp -i "C:\Users\ROG\Downloads\llave-cluster.ppk" "C:\Users\ROG\Desktop\big data\indice invertido\visits.log" hadoop@ec2-34-226-141-155.compute-1.amazonaws.com:/home/hadoop/


hdfs dfs -mkdir -p /user/hadoop/visitlog/

hdfs dfs -put visits.log /user/hadoop/visitlog/

hdfs dfs -ls /user/hadoop/visitlog/



CREATE EXTERNAL TABLE visit_logs (
  username STRING,
  website STRING,
  visit_time STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
STORED AS TEXTFILE
LOCATION '/user/hadoop/visitlog/';


SELECT username, COUNT(*) AS num_visits
FROM visit_logs
GROUP BY username;


SELECT username, COUNT(*) AS num_visits, 
       AVG(COUNT(*)) OVER () AS avg_visits_per_user
FROM visit_logs
GROUP BY username;


SELECT username, 
       COUNT(*) AS num_visits,
       COUNT(*) / (SELECT COUNT(DISTINCT username) FROM visit_logs) AS avg_visits_per_user
FROM visit_logs
GROUP BY username;
