sudo sed -i 's/# process_config:/process_config:/g' /etc/datadog-agent/datadog.yaml
sudo sed -i 's/# enabled: "true"/enabled: "true"/g' /etc/datadog-agent/datadog.yaml

FILE=/etc/datadog-agent/conf.d/process.d/conf.yaml
if [ -f "$FILE" ]; then
    echo "$FILE exists."
    sudo \cp -r /home/azureuser/provisioner/datadog-workbench-conf.yaml /etc/datadog-agent/conf.d/process.d/conf.yaml
else 
    echo "$FILE does not exist; copying it in."
    sudo cp /home/azureuser/provisioner/datadog-workbench-conf.yaml /etc/datadog-agent/conf.d/process.d/conf.yaml
fi

FILE2=/etc/datadog-agent/http_check.d/conf.yaml
if [ -f "$FILE2" ]; then
    echo "$FILE2 exists."
    sudo \cp -r /home/azureuser/provisioner/datadog-workbench-http-check-conf.yaml /etc/datadog-agent/conf.d/http_check.d/conf.yaml
else 
    echo "$FILE2 does not exist; copying it in."
    sudo cp /home/azureuser/provisioner/datadog-workbench-http-check-conf.yaml /etc/datadog-agent/conf.d/http_check.d/conf.yaml
fi

FILE3=/etc/datadog-agent/system-probe.yaml
if [ -f "$FILE3" ]; then
    echo "$FILE3 exists."
    sudo \cp -r /home/azureuser/provisioner/datadog-connect-system-probe.yaml /etc/datadog-agent/system-probe.yaml
else 
    echo "$FILE3 does not exist; copying it in."
    sudo cp /home/azureuser/provisioner/datadog-connect-system-probe.yaml /etc/datadog-agent/system-probe.yaml
fi

sudo systemctl restart datadog-agent

