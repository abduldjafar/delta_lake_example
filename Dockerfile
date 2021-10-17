FROM gcr.io/spark-operator/spark-py:v3.1.1
USER root
RUN pip install --no-dependencies   delta-spark==1.0.0
RUN pip install importlib-metadata==4.8.1
RUN pip install zipp==3.6.0
RUN pip install py4j
ADD gcs-connector-hadoop2-2.0.1.jar   $SPARK_HOME/jars
ADD delta-contribs_2.12-1.0.0.jar $SPARK_HOME/jars
ADD gcp_config.json $SPARK_HOME/jars
ENV GOOGLE_APPLICATION_CREDENTIALS $SPARK_HOME/jars/gcp_config.json
ADD exampleDeltaLake.py /opt/spark/examples/src/main/python
ADD Sample_data_analyst.csv /opt/spark/examples/src/main/python
COPY Sample_data_analyst.csv Sample_data_analyst.csv
ADD delta-core_2.12-1.0.0.jar $SPARK_HOME/jars
USER ${spark_uid}
