-- :: CASSANDRA QUERIES ::

CREATE KEYSPACE IF NOT EXISTS test_keyspace 
WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 2 };
  
-- 'NetworkTopologyStrategy' cannot have replication factor.

-- Create table basic
CREATE TABLE test_keyspace.sample_tbl_1 (
   category text, 
   points int, 
   lastname text, 
   PRIMARY KEY (category, points)) 
WITH CLUSTERING ORDER BY (points DESC);


insert into sample_tbl_1 (category , points , lastname ) VALUES ( 'category1', 20, 'lastname2') if not exists;
insert into sample_tbl_1 (category , points , lastname ) VALUES ( 'category1', 30, 'lastname2') if not exists;
insert into sample_tbl_1 (category , points , lastname ) VALUES ( 'category1', 40, 'lastname2') if not exists;
insert into sample_tbl_1 (category , points , lastname ) VALUES ( 'category2', 30, 'lastname2') if not exists;
insert into sample_tbl_1 (category , points , lastname ) VALUES ( 'category2', 20, 'lastname2') if not exists;
insert into sample_tbl_1 (category , points , lastname ) VALUES ( 'category2', 40, 'lastname2') if not exists;
