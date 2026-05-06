FROM turknethub/tn-wolfios:0.0.6-169

COPY version /tmp/version

RUN apk update && apk add --no-cache python-3.13=$(cat /tmp/version) py3-pip

ENV OTEL_PYTHON_HOME=/opt/otel-python
WORKDIR $OTEL_PYTHON_HOME

RUN python3 -m pip install --no-cache-dir --prefix=$OTEL_PYTHON_HOME \
    opentelemetry-distro \
    opentelemetry-exporter-otlp && \
    chmod -R a+rX $OTEL_PYTHON_HOME

ENV PATH=$OTEL_PYTHON_HOME/bin:$PATH
ENV PYTHONPATH=$OTEL_PYTHON_HOME/lib/python3.13/site-packages

ENV OTEL_TRACES_EXPORTER=otlp \
    OTEL_METRICS_EXPORTER=otlp \
    OTEL_LOGS_EXPORTER=otlp \
    OTEL_EXPORTER_OTLP_PROTOCOL=http/protobuf \
    OTEL_EXPORTER_OTLP_INSECURE=true

WORKDIR /app
CMD ["tail", "-f", "/dev/null"]
