FROM datadog/agent
COPY conf.d /etc/datadog-agent/conf.d/
COPY datadog.yaml /etc/datadog-agent/datadog.yaml
