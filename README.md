# kubernetes-lab-deployment v1.0
this project will setup kubernetes environment witl 1 master and n worker nodes based on Ubuntu operating system

1. prerequisites:
    a. server with OS installed , ip assigned:
        yes , only this is enough , the package start from very basic configuration like  key exchange with ansible master, setting hostname,hosts file update, etc..
    b. ansible_ssh_user is need to have root permission
    c. Internet connecton for installing packages


The package will take very minimum inputs IP,hostname , and install k8s with predefined version in vars file 
Note: Every dynamic requirement for deployment holds a variable in vars, can be used for testing multiple package versions

2.Inputs:
    Mandatory inputs:
    a. Fill in the ansible "hosts" files appropriately
    
        [masternode]
        master ansible_host=<<master_node_ip> new_hostname=<master_node_hostname>

        [workernode]
        worker-1 ansible_host=<<worker_node_1_ip>>  new_hostname=<<worker_node_1_hostname>>
        worker-2 ansible_host=<<worker_node_2_IP>> new_hostname=<<worker_node_2_hostname>>
        .
        .
        #fill in all the worker N nodes you need

        [vars]
        ansible_ssh_user=<<user_name>>
        ansible_ssh_port=22
        ansible_ssh_pass=<<password>>

    b. Update Kubernetes API IP in vars/vars.yaml
       Specify the IP of masternode to be used by kubernetes API , this will be useful if nodes have multipe network interfaces attached and you need to decide which Interface to be exposed for kubernetes APi as per your environmant and firewall settings 

       apiserver_advertise_address : <<master_io_to_be_used_by_k8s_master_node>>

    Optional parameters:

        you can go through /vars/vars.yaml file and tweak the inputs as per you test environment.



