"""Example Notebook connecting to Spark"""

import os
import pyspark


def conf():
    return {'spark.driver.host':                          os.environ['HOSTNAME'],
            'spark.mesos.principal':                      os.environ.get('MESOS_PRINCIPAL', ''),
            'spark.mesos.secret':                         os.environ.get('MESOS_SECRET', ''),
            'spark.mesos.role':                           os.environ.get('MESOS_ROLE', ''),
            'spark.mesos.executor.docker.image':          os.environ.get('IMAGE', ''),
            'spark.mesos.executor.docker.forcePullImage': 'false',
            'spark.mesos.task.labels':                    'lcmap-spark:{}'.format(os.environ['USER']),
            'spark.serializer':                           'org.apache.spark.serializer.KryoSerializer',
            'spark.python.worker.memory':                 '1g',
            'spark.executor.cores':                       '1',
            'spark.cores.max':                            '1',
            'spark.executor.memory':                      '1g'}


def context(conf):
    return pyspark.SparkContext(master=os.environ['MASTER'],
                                appName='lcmap-spark:{}'.format(os.environ['USER']),
                                conf=pyspark.SparkConf().setAll(conf.items()))

from subprocess import check_output
def run_c_application(x):
    return str(check_output(["ls", "-l"]))[:10]

def application():
    sc = None
    try:
        sc   = context(conf())
        rdd1  = sc.parallelize(range(10))
        rdd2 = rdd1.map(run_c_application)
        return rdd2.collect()
    finally:
        sc.stop()

# run it
application()