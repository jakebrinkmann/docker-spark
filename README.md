# special-excessive-panther

[Apache Spark™](https://spark.apache.org/) framework introduced for speeding up the Hadoop computational process, uses a read-only, partitioned collection of records: Resilient Distributed Datasets (RDD). Storing state in a distributed memory, it allows the re-use of intermediate results across jobs in the cluster (e.g. map, filter, reducer, join)

## Deployment Stack

    +------------+
    |   SPARK    |
    +------------+
    +------------+
    | YARN/MESOS |
    +------------+
    +------------+
    |    HDFS    |
    +------------+

## Building & Running

First, install Java, Hadoop, and Spark: 

* Java JDK 1.8.0
* Hadoop 2.8.0
* Spark 2.2.0

Build the base spark image:
```
cd special-excessive-panther/
docker build -t special-spark-base ./spark-base
```

* **Image size:** 1.36GB 

Run container in local mode with 2 threads:
```
docker run -it --rm --name=some-spark special-spark-base --master local[2]
```

## Links

* [Download Apache Spark™](https://spark.apache.org/downloads.html)
* [Spark 2.2.0 Overview](https://spark.apache.org/docs/2.2.0/index.html)
* [Spark 2.2.0 Programming Guide](https://spark.apache.org/docs/2.2.0/rdd-programming-guide.html)

