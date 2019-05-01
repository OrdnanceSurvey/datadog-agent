FROM centos:centos7
RUN yum -y install https://download.postgresql.org/pub/repos/yum/9.4/redhat/rhel-7-x86_64/pgdg-centos94-9.4-3.noarch.rpm
RUN yum -y install postgresql94

FROM datadog/docker-dd-agent
MAINTAINER support@tutum.co
COPY dd-agent/conf.d /etc/dd-agent/conf.d

FROM centos:centos7
RUN yum -y install https://download.postgresql.org/pub/repos/yum/9.4/redhat/rhel-7-x86_64/pgdg-centos94-9.4-3.noarch.rpm
RUN yum -y install postgresql94


# Output of: yaml2json tutum.yml | tr "\n" " " | sed 's/"/\\"/g'
LABEL co.tutum.yml="{   \"datadog\": {     \"image\": \"tutum/datadog-agent\",     \"restart\": \"on-failure\",     \"privileged\": true,     \"volumes\": [       \"/var/run/docker.sock:/var/run/docker.sock\",       \"/proc:/host/proc:ro\",       \"/sys/fs/cgroup:/host/sys/fs/cgroup:ro\"     ],     \"environment\": [       \"HOSTNAME=$TUTUM_NODE_HOSTNAME\",       \"API_KEY=YOUR-API-KEY-HERE\"     ],     \"deployment_strategy\": \"every_node\"   } }"
