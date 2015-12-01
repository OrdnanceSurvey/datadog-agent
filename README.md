# tutum/datadog-agent

[![Deploy to Tutum](https://s.tutum.co/deploy-to-tutum.svg)](https://dashboard.tutum.co/stack/deploy/)

Datadog agent inside a container optimized for Tutum

## Usage

	docker-compose run -d -e API_KEY=<your-api-key> -e HOSTNAME=<your-hostname> datadog

replacing `<your-api-key>` with the 32 character API key found in your account Integrations APIs and `<your-hostname>` with the name you want it to appear in the DataDog infrastructure list.

## Extending datadog-agent configurations

Add the datadog-agent custom configurations into dd-agent/conf.d directory
E.g. To configure datadog-agent to not report metrics for the following containers

        - docker_image:tutum/metrics
        - docker_image:tutum/ntpd
the configuration file docker_daemon.yaml would be as below (YAML syntax)

	init_config:
	instances:
	    - url: "unix://var/run/docker.sock"
	      include: []
	      exclude:
	        - docker_image:tutum/metrics"
	        - docker_image:tutum/ntpd"
 
## Unsupported metrics

* Network
* Process list

## Notes

* Once the containers start running, it can take several minutes to start being monitored by DataDog.
* Once the DataDog container is stopped, it can take up to 24h for the host to disappear from the infrastructure page, but it will only be part of the host count for billing purposes if we’re actually receiving data.
