# kubernetes-lab-deployment v1.0
this project will setup kubernetes environment witl 1 master and n worker nodes based on Ubuntu operating system

1. prerequisites:
    a. server with OS installed , ip assigned:
        yes , only this is enough , the package start from very basic configuration like  key exchange with ansible master, setting hostname,hosts file update, etc..
    b. ansible_ssh_user need to have root permission
    c. Internet connecton for installing packages


The package will take very minimum inputs IP,hostname , and install k8s with predefined version in vars file 
Note: Every dynamic requirement for deployment holds a variable in vars, can be used for testing multiple package versions

2.Inputs required:
  Mandatory inputs:
  a. Fill in the ansible "hosts" files appropriately
     NOTE: comment "ansible_ssh_pass" variable if you have done ssh key exchanges already
     NOTE: the name you provide for "new_hostname" will be hostname of the nodes. In case of DNS provison hostnames , you can provide received hostname here so it wont be changed

      ##hosts file guide
      [masternode]
      master ansible_host=<<master_node_ip> new_hostname=<master_node_hostname>

      [workernode]
      worker-1 ansible_host=<<worker_node_1_ip>>  new_hostname=<<worker_node_1_hostname>>
      worker-2 ansible_host=<<worker_node_2_IP>> new_hostname=<<worker_node_2_hostname>>
      .
      .
      #fill in all the worker N nodes you need

      [masternode:vars]
      ansible_ssh_user=<<user_name>>
      ansible_ssh_port=22
      ansible_ssh_pass=<<password>>
      
      [workernode:vars]
      ansible_ssh_user=<<user_name>>
      ansible_ssh_port=22
      ansible_ssh_pass=<<password>>

  b. Update Kubernetes API IP in vars/vars.yaml
     Specify the IP of masternode to be used by kubernetes API , this will be more useful if nodes have multipe network interfaces attached and you need to decide which Interface to be exposed for kubernetes APi as per your environmant and firewall settings 

     apiserver_advertise_address : <<master_io_to_be_used_by_k8s_master_node>>

     Note: verify if pod_network_cidr valus do not overlap with your existing network. update the CIDR if overlapping

  Optional parameters:

      you can go through /vars/vars.yaml file and tweak the inputs as per you test environment.

3. verify connecivity:
    Execute below command from ansible host to verify of all nodes are rechable by ansible
    
    ansible all -m ping -i hosts

4. Commands for using the package
   1. Install command:
   
      ansible-playbook install_k8s_ubuntu.yaml -i hosts --tags=install
   
   2. After installation to get token for gui login.
   
      ansible-playbook install_k8s_ubuntu.yaml -i hosts --tags=get_token
   
   3. delete k8s cluster and uninstall packages
   
      ansible-playbook install_k8s_ubuntu.yaml -i hosts --tags=uninstall_cluster
   
   