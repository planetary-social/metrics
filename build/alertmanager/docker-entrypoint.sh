#!/bin/sh

# alert manager does not allow for env vars in its config, so we edit in place before running.
sed -i "s|SLACK_API_URL|'$SLACK_API_URL'|g" /etc/alertmanager/alertmanager.yml

/bin/alertmanager --config.file=/etc/alertmanager/alertmanager.yml --storage.path=/alertmanager
