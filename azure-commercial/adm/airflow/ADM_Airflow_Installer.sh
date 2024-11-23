#!/bin/bash
########################################################################################################################
#Script_name: airflowinstaller.sh
#Script_description: This script is used to install and configure the apache airflow with dependent tools and packages for ambient data management.
#Version:1
#Date: 04/05/2022
#########################################################################################################################

#Functions declaration

#Getting secrets from key vault
function secret_collector()
{
	keyvault_name=$1
	secret_name=$2
	az keyvault secret show --vault-name $keyvault_name --name $secret_name | grep value | cut -d':' -f2 | tr -d "[:space:]" | tr -d '"'
}

#Azure-cli installation
function akv_key_fetcher() 
{
	keyvault_name=$keyvault_name
	#Installing az-cli
	sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
	echo -e "[azure-cli]\nname=Azure CLI\nbaseurl=https://packages.microsoft.com/yumrepos/azure-cli\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/azure-cli.repo
	yes | sudo dnf install azure-cli
	#sudo dnf install azure-cli
	#azure login
	az login --identity --allow-no-subscriptions
	az_login_stats="$?"
	echo "az_login_status=$az_login_stats" >>$log_file
	if [ $az_login_stats -eq 0 ]
	then
		echo "az login succeeded" >>$log_file
	else
		echo "problem while login the azure cli" >>$log_file
	fi
	echo "fetching secret for airflow" >>$log_file
	postgre_password=`secret_collector $keyvault_name postgre-password`
	postgre_password_stats="$?" 
	postgre_servername=`secret_collector $keyvault_name postgre-servername`
	postgre_servername_stats="$?"
	postgre_database=`secret_collector $keyvault_name postgre-database`
	postgre_database_stats="$?"
	postgre_username=`secret_collector $keyvault_name postgre-username`
	postgre_username_stats="$?"
	airflow_password=`secret_collector $keyvault_name airflow-password`
	airflow_password_stats="$?"
	airflow_username=`secret_collector $keyvault_name airflow-username`
	airflow_username_stats="$?"
	airflow_logs_storage=`secret_collector $keyvault_name adm-storage`
	airflow_logs_storage_stats="$?"
	storage_sas=`secret_collector $keyvault_name adm-storage-sas`
	storage_sas_stats="$?"
	echo "postgre_username_status=$postgre_username_stats" >>$log_file
	echo "postgre_password_status=$postgre_password_stats" >>$log_file
	echo "postgre_servername_status=$postgre_servername_stats" >>$log_file
	echo "postgre_database_status=$postgre_database_stats" >>$log_file
	echo "airflow_username_status=$airflow_username_stats" >>$log_file
	echo "airflow_password_status=$airflow_password_stats" >>$log_file
	echo "airflow_logs_storage_status=$airflow_logs_storage_stats" >>$log_file
	echo "storage_sas_status=$storage_sas_stats" >>$log_file
	if [ $postgre_password_stats -eq 0 ] && [ $postgre_servername_stats -eq 0 ] && [ $postgre_database_stats -eq 0 ] && [ $postgre_username_stats -eq 0 ] && [ $airflow_password_stats -eq 0 ]  && [ $airflow_username_stats -eq 0 ] && [ $airflow_logs_storage_stats -eq 0 ] && [ $storage_sas_stats -eq 0 ]
	then 
		echo "secrets fetched successfully from the key vault" >>$log_file
	else
		echo "ERROR: There is a problem while fetching a secret from the keyvault" >>$log_file
	fi
}

#creating or checking the required folders for airflow exists
function admtools_foldercheck() 
{
	python_home=$python_home
	if [ -d $python_home ]
	then 
		echo -e "$python_home exists!" >>$log_file
		cd $python_home
		if [[ ! -d "airflow" ]]
		then
			sudo mkdir airflow
			echo "airflow directory has been created" >>$log_file
		else
			echo "airflow directory exists" >>$log_file
		fi
	else 
		sudo mkdir $python_home
		sudo mkdir airflow
		echo "$python_home and airflow has been created" >>$log_file
	fi
}

#user creation in airflow server
function user_group_creation()
{
	user=$user
	sessionuser=$sessionuser
	sudo useradd $user
	sudo usermod -a -G $user $sessionuser
}

#ownership change for folders
function change_group_owner_permission()
{
	user=$user
	sessionuser=$sessionuser
	python_home=$python_home
	sudo chown $user:$sessionuser $python_home -R
	sudo chmod 775 $python_home -R
}

#check the aiflow user exists or not
function airflow_linux_user_creation()
{
	user=$user
	python_home=$python_home
	echo  "###### user creation #" >>$log_file
	#Fetching the sessionuser
	sessionuser=`who | cut -d ' ' -f1`
	echo "session-user=$sessionuser" >>$log_file
	cat /etc/passwd | grep ${user} >/dev/null 2>&1
	if [ $? -eq 0 ]
	then
		echo "User :${user} Exists" >>$log_file
		change_group_owner_permission $user $sessionuser $python_home
	else
		echo "${user} User Not Found" >>$log_file
		user_group_creation $user $sessionuser
		change_group_owner_permission $user $sessionuser $python_home
	fi
}

#Airflow environment variable declaration
function airflow_env_variable_checker()
{
	airflow_home=$airflow_home
	echo "### Airflow environment variable declaration ##" >>$log_file
	var=`printenv | grep AIRFLOW_HOME`
	echo "airhome=$var" >>$log_file
	ERROR_check=`printenv | grep AIRFLOW_HOME | wc -w`
	if [ "$ERROR_check" -gt 1 ]
	then
		echo "Home path available" >>$log_file
	else
		echo "variable AIRFLOW home path is not availble"
		echo -e "export AIRFLOW_HOME=$airflow_home\n" >>~/.bash_profile
		echo "export AIRFLOW_HOME" >>~/.bash_profile
		source ~/.bash_profile
		echo "airflowhome=$AIRFLOW_HOME" >>$log_file
		airflowhomevar=`printenv | grep AIRFLOW_HOME`
		echo "$airflowhomevar" >>$log_file
	fi
}

#Linux packages installation
function linux_dependencies_Installer()
{
	packages=$@
	echo "## linux package Installation ##" >>$log_file
	sudo yum install $packages -y >>$log_file
	package_status="$?"
	echo "rhel_package_status=$package_status" >>$log_file
}

#python installation
function python_installer()
{
	python_home=$python_home
	py_url=$py_url
	python_version=$python_version
	echo "### downloading and configuring the python ###" >>$log_file
	cd $python_home
	sudo wget $py_url
	status="$?"
	echo "python_download_status=$status" >>$log_file
	sudo tar xzf Python-"$python_version".tgz
	cd Python-"$python_version"
	sudo ./configure --enable-optimizations
	sudo make altinstall
	python_stats="$?"
	echo "python_status=$python_stats" >>$log_file
	sudo rm -rf /usr/bin/python
	sudo ln -s /usr/local/bin/python3.8 /usr/bin/python
	if [ $package_status -eq 0 ] && [ $status -eq 0 ] && [ $python_stats -eq 0 ]
	then
		echo "Linux packages and python installed successfully" >>$log_file
	else 
		echo "ERROR: There is problem while installing linux packages or python" >>$log_file
	fi
}

#virtual environment creation
function virtual_environment_creator()
{
	python_home=$python_home
	virenv=$virenv
	echo "####### virtual environment creation and activation ##################" >>$log_file
	python -m venv $python_home/$virenv
	virenv_stats="$?"
	echo "virenv_status=$virenv_stats" >>$log_file
	source $python_home/$virenv/bin/activate
	virenv_act_stats="$?"
	echo "virenv_act_status=$virenv_act_stats" >>$log_file
	if [ $virenv_stats -eq 0 ] && [ $virenv_act_stats -eq 0 ]
	then
		echo "Python Virtual environment created and activated successfully" >>$log_file
	else 
		echo "ERROR: There is problem while installing creating or activating virtual environment" >>$log_file
	fi
}

#airflow package installations
function airflow_python_package_installer()
{
	echo "### python package File creation and installation #########" >>$log_file
	pip install --upgrade pip==22.0.4
	pip install --upgrade setuptools==61.2.0
	pip install wheel==0.37.1
	echo -e "psycopg2-binary==2.9.3\napache-airflow==2.2.4\napache-airflow-providers-microsoft-azure==3.9.0" >$python_home/airflow_env/requirements.txt
	pip install -r $python_home/airflow_env/requirements.txt
}

#airflow configuration edition
function airflow_configuration_setup()
{
	if [ $1 = dv ]
	then
	val=True
	else
	val=False
	fi
	postgre_servername=$postgre_servername
	postgre_database=$postgre_database
	postgre_username=$postgre_username
	postgre_password=$postgre_password
	airflow_home=$airflow_home
	echo "#####airflow db setup ###" >>$log_file
	echo "adding the airflow db details"
	v_sql_alchemy_conn="postgresql+psycopg2://$postgre_username:$postgre_password@$postgre_servername:5432/$postgre_database"
	echo "$v_sql_alchemy_conn" >>$log_file
	sed -i "s|^\(sql_alchemy_conn\s*=\s*\).*\$|\1$v_sql_alchemy_conn|" $airflow_home/airflow.cfg

	echo "#####airflow configuration###" >>$log_file
	v_remote_logging=True
	v_remote_log_conn_id=airflowlogs
	v_remote_base_log_folder=wasb-airflow-logs
	v_logging_config_class=log_config.DEFAULT_LOGGING_CONFIG
	v_load_examples=$val
	v_executor=LocalExecutor
	v_auth_backend=airflow.api.auth.backend.basic_auth
	v_dag_dir_list_interval=15

	sed -i "s|^\(remote_logging\s*=\s*\).*\$|\1$v_remote_logging|" $airflow_home/airflow.cfg
	sed -i "s|^\(remote_log_conn_id\s*=\s*\).*\$|\1$v_remote_log_conn_id|" $airflow_home/airflow.cfg
	sed -i "s|^\(remote_base_log_folder\s*=\s*\).*\$|\1$v_remote_base_log_folder|" $airflow_home/airflow.cfg
	sed -i "s|^\(logging_config_class\s*=\s*\).*\$|\1$v_logging_config_class|" $airflow_home/airflow.cfg
	sed -i "s|^\(load_examples\s*=\s*\).*\$|\1$v_load_examples|" $airflow_home/airflow.cfg
	sed -i "s|^\(executor\s*=\s*\).*\$|\1$v_executor|" $airflow_home/airflow.cfg
	sed -i "s|^\(auth_backend\s*=\s*\).*\$|\1$v_auth_backend|" $airflow_home/airflow.cfg
	sed -i "s|^\(dag_dir_list_interval\s*=\s*\).*\$|\1$v_dag_dir_list_interval|" $airflow_home/airflow.cfg

	mkdir $airflow_home/config
	cd $airflow_home/config
	cp /srv/airflow_env/lib/python3.8/site-packages/airflow/config_templates/airflow_local_settings.py log_config.py
	touch __init__.py
	airflow connections add airflowlogs --conn-extra '{"extra__wasb__connection_string": "", "extra__wasb__sas_token": "'$storage_sas'", "extra__wasb__shared_access_key": "", "extra__wasb__tenant_id": ""}' --conn-login "$airflow_logs_storage" --conn-type 'wasb'

}

#airflow db initialization
function airflow_db_initialization()
{
	echo "######## airflow db initialization ########################" >>$log_file
	airflow db init
	af_db_stats="$?"
	echo "af_db_status=$af_db_stats" >>$log_file
	if [ $af_db_stats -eq 0 ]
	then
		echo "Airflow Database has been initialized successfully" >>$log_file
	else
		echo "ERROR: Airflow Database having problem while initialization" >>$log_file
	fi
}

#Airflow Daemon service creation
function airflow_daemon_service_file_creation()
{
	airflow_home=$airflow_home
	user=$user
	python_home=$python_home
	virenv=$virenv
	sessionuser=$sessionuser
	echo "# airflow service file creation #" >>$log_file
	cd $airflow_home
	
	echo -e "[Unit]\nDescription=Airflow scheduler daemon\n\n[Service]\nEnvironmentFile=/etc/sysconfig/airflow\nUser=$user\nGroup=$user\nType=simple\n
	ExecStart=/usr/bin/bash -c 'source $python_home/$virenv/bin/activate ; $python_home/$virenv/bin/airflow scheduler'
	Restart=always\nRestartSec=10s\n\n[Install]\nWantedBy=multi-user.target" >airflow-scheduler.service
	
	echo -e "[Unit]\nDescription=Airflow webserver daemon\nAfter=airflow-scheduler.service\nWants=airflow-scheduler.service\n[Service]\nEnvironmentFile=/etc/sysconfig/airflow\n
	User=$user\nGroup=$user\nType=simple\n
	ExecStart=/usr/bin/bash -c 'source $python_home/$virenv/bin/activate  ; airflow webserver --pid $airflow_home/webserver.pid -p 8080' 
	\nRestart=on-failure\nRestartSec=10s\n\nPrivateTmp=true\n[Install]\nWantedBy=multi-user.target" >airflow-webserver.service
	
	echo -e "AIRFLOW_CONFIG=$airflow_home/airflow.cfg\nAIRFLOW_HOME=$airflow_home" >airflow
}

#Airflow daemon service file creation
function airflow_service_files_copier()
{
	airflow_home=$airflow_home
	echo "##################### Copying the service files ##############" >>$log_file
	cd $airflow_home
	echo "files copied into root" >>$log_file
	sudo cp *.service /usr/lib/systemd/system/
	cp_service_stats="$?"
	echo "cp_service_status=$cp_service_stats" >>$log_file
	sudo cp airflow /etc/sysconfig/airflow
	cp_config_stats="$?"
	echo "cp_config_status=$cp_config_stats" >>$log_file
	if [ $cp_service_stats -eq 0 ] && [ $cp_config_stats -eq 0 ]
	then
		echo "Airflow files transferred successfully" >>$log_file
	else 
		echo "ERROR: Airflow service files having problem while transfer" >>$log_file
	fi
}

#Running the Daemon services
function daemon_service_trigger()
{
	echo "##### starting daemon service #####" >>$log_file
	sudo systemctl daemon-reload
	sudo systemctl enable airflow-webserver
	sudo systemctl enable airflow-scheduler
	sudo systemctl start airflow-scheduler
	af_scheduler_stats="$?"
	echo "af_scheduler_status=$af_scheduler_stats" >>$log_file
	sudo systemctl start airflow-webserver
	af_webserver_stats="$?"
	echo "af_webserver_status=$af_webserver_stats" >>$log_file
	if [ $af_scheduler_stats -eq 0 ] && [ $af_webserver_stats -eq 0 ]
	then
		echo "Daemon service started succesfully" >>$log_file
		sudo systemctl status airflow-scheduler >>$log_file
		sudo systemctl status airflow-webserver >>$log_file
	else 
		echo "ERROR: There is a problem while starting the Daemon service" >>$log_file
	fi
}

#Checking the daemon status
function daemon_service_status_check()
 {
	service_name=$1
	service_check=`sudo systemctl status $1 | grep Active | grep running`
	if [ -n "$service_check" ]
	then
		echo "airflow $1 service is running fine" >>$log_file
	else
		echo "ERROR: airflow $1 service is not running" >>$log_file
	fi
}

#airflow user creation
function airflow_user_creator()
{
	af_user=$airflow_username
	password=$airflow_password
	role=$role
	airflow users create --username "$af_user" --firstname "adm" --lastname "project" --role $role --email "adm@kpmg.com" -p $password
}

## Main ###

###Variable-declaration ########
python_home=/srv
airflow_home="$python_home/airflow"
python_version="3.8.8"
py_url=https://www.python.org/ftp/python/$python_version/Python-"$python_version".tgz
user="airflow-user"
virenv="airflow_env"
packages='wget make gcc zlib-devel openssl-devel sqlite-devel libffi-devel'
keyvault_name="useadmdv-kv"
role="Admin"


## Logfile creation ####
sudo mkdir /logfiles/
sudo chmod 777 /logfiles -R
log_file="/logfiles/airflowinstaller-`date +%d-%m-%Y-%H-%M-%S`.log"
>$log_file
echo "####### Airflow installation has been started ############" >>$log_file
echo "">>$log_file

akv_key_fetcher $keyvault_name
admtools_foldercheck $python_home
airflow_linux_user_creation $user $python_home
airflow_env_variable_checker $airflow_home
linux_dependencies_Installer $packages
python_installer $python_home $py_url $python_version
virtual_environment_creator $python_home $virenv
airflow_python_package_installer
airflow_db_initialization
airflow_configuration_setup $postgre_servername $postgre_database $postgre_username $postgre_password $airflow_home
airflow_db_initialization
airflow_daemon_service_file_creation $airflow_home $user $python_home $virenv $sessionuser
airflow_service_files_copier $airflow_home
airflow_user_creator $airflow_password $role
echo "##### changing permission and ownership  for sub folders #####" >>$log_file
change_group_owner_permission $user $sessionuser $python_home
daemon_service_trigger
daemon_service_status_check airflow-webserver
daemon_service_status_check airflow-scheduler
echo "##### adding firewall rules #####" >>$log_file
sudo firewall-cmd --zone=public --permanent --add-port 8080/tcp
firewall_stats="$?"
echo "firewall_status=$firewall_stats" >>$log_file
sudo firewall-cmd --reload
	if [ $firewall_stats -eq 0 ]
	then
		echo "port 8080 opened succesfully" >>$log_file
	else 
		echo "ERROR: problem while executing the firewall commands" >>$log_file
	fi

echo "#### Logging Discrepencies ##########" >>$log_file
ERROR_check=`cat $log_file | grep ERROR | wc -l`
	if [ "$ERROR_check" -eq 0 ]
	then
		echo "Script completed successfully" >>$log_file
	else
		echo "ERROR: There is a problem while running the script" >>$log_file
	fi
