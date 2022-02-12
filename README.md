# Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![This is an image](/Diagrams/azure_elk_deployment.png)

These files have been tested and used to generate a live ELK deployment on Azure. 
They can be used to either recreate the entire deployment pictured above.
Alternatively, select portions of the playbook files may be used to install only certain pieces of it, such as Filebeat.

### - ansible playbook [ansible](https://github.com/ghuguenot/sombra/blob/main/Ansible/docker.yml)
### - elk playbook [elk stack](https://github.com/ghuguenot/sombra/blob/main/Ansible/install-elk.yml)
### - filebeat playbook [filebeat](https://github.com/ghuguenot/sombra/blob/main/Ansible/filebeat-playbook.yml)
### - metricbeat playbook [metricbeat](https://github.com/ghuguenot/sombra/blob/main/Ansible/metric-playbook.yml)

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build to setup the Elk stack server


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly stable, in addition to restricting access to the network.
- The load balancer creates redundancy so that if one of the VMs is taken down by a threat actor, the other requests and posts will be handled by the other VMs.  The Jump box allows us to limit access to the VMs by only allowing outside access through the jumpbox.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the network and system settings/status.
- Filebeat helps to collect revelent logs and files for the Elk Stack
- Metricbeat collects metrics (ex. cpu and disk usage) from your system and servers 

The configuration details of each machine may be found below.

| Name      | Function     | IP Address    | Operating System |
|-----------|--------------|---------------|------------------|
| Jump Box  | Gateway      | 40.83.167.23  | Linux            |
| Web-1     | DVWA/VM      | 10.0.0.4      | Linux            |
| Web-2     | DVWA/VM      | 10.0.0.5      | Linux            |
| Elk-Stack | Monitor/Siem | 20.119.51.160 | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box machine and Elk-Stack VMs can accept connections from the Internet. Access to these is only allowed from the following IP addresses:
- 24.20.149.192
Machines within the network can only be accessed by SSH.

A summary of the access policies in place can be found in the table below.

| Name      | Publicly Accessible | Allowed IP Addresses                         |
|-----------|---------------------|----------------------------------------------|
| Jump Box  | Yes                 | 24.20.149.192 20.119.51.160 40.83.167.23     |
| Web-1     | No                  | 10.0.0.5 20.119.51.160                       |
| Web-2     | No                  | 10.0.0.4 20.119.51.160                       |
| Elk-Stack | Yes                 | 24.20.149.192 10.0.0.4 10.0.0.5 40.83.167.23 |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because you then deploy this to any number of virtual machines in your network.

The playbook implements the following tasks:
- Installs docker, python3 and the docker python module
- Downloads and launches an elk docker container
- Increases allowable memory of the VM
- Ensures Docker and this sysctl setting is always up after restart

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![This is an image](Images/docker_ps.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web-1 10.0.0.4
- Web-2 10.0.0.5

We have installed the following Beats on these machines:
- Metricbeats
- Filebeats

These Beats allow us to collect the following information from each machine:
- With filebeats we are hoping to capture relevent log data such as logins and possible changes by an admin
- Metricbeat's monitoring of system diagnostics will help alert to possible unusual activity such as a dos attack or a C2

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the elk_stack .yml file to /etc/ansible
> curl https://github.com/ghuguenot/sombra/blob/main/Ansible/install-elk.yml > /etc/ansible/elk_stack_playbook.yml
- You will need to copy over the Beats playbooks as well if needed
- Update the hosts file to include the ip addresses (or range) of the target machines.  Make sure you include a header.
> nano hosts
- Run the playbook, and navigate to the machine to check that the installation worked.  To do that, navigate to your elk stack server's ip address from your workstation using http://IP_address:5601/
>ansible-playbook elk_stack_playbook.yml
