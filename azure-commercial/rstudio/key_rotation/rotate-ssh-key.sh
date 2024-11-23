#!/bin/bash
echo "Starting rotate-ssh-key script"
while [ $# -gt 0 ]; do
     if [[ $1 == *"--"* ]]; then
          param="${1/--/}"
          declare $param="$2"
     fi
     shift
done

echo "$pub_data"
echo "$azureuser_password"

echo "Update ssh authorized_keys starting.."

echo "$azureuser_password" | su - azureuser -c "echo \"$pub_data\" >> ~/.ssh/authorized_keys"

echo "Update ssh authorized_keys finished."
