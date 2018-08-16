# db_create.py

from main import db
from models import User, Knowledge, Expirience


db.create_all()

db.session.add(
    User(
        'Bruce Willis',
        '+380.68.808.45.74',
        'ipeacocks@example.com',
        'ipeacocks',
        'Kyiv, Ukraine'
    )
)

skills = ["OS: Linux (admin level, Debian and RedHat derivatives)",
          "Web: Apache, Nginx, Php-Fpm, Varnish, Memcache, etc.",
          "Search platforms: Elasticsearch",
          "Mail: Postfix, Exim, Dovecot",
          "DBs: MySQL, MongoDB, Cassandra, Redis",
          "Messaging Systems: Kafka, RabbitMQ",
          "Distributed directory information services: OpenLDAP",
          "Linux HA: Pacemaker/Corosync, HAProxy",
          "VPN: OpenVPN",
          "Scripts languages: Bash, Python (Flask)",
          "Monitoring systems: Cacti, Graphite/Grafana, " \
          "Nagios (Nagiosgraph), Sensu, ELK stack",
          "Virtualization/containerization: KVM, XEN, LXC, OpenVZ, Docker",
          "Server virtualization management: Proxmox",
          "Container orchestration systems: Mesos/Marathon, " \
          "Cloud Foundry/Bosh, Kubernetes/OpenShift",
          "Cloud Platforms: Amazon Web Services",
          "Configuration management tools: Puppet (Foreman), " \
          "Ansible (Tower), Terraform",
          "Distributed revision control and source " \
          "code management systems: Git (GitLab), Svn",
          "CI/CD tools: Jenkins (Groovy pipeplines), Rundeck",
          "Storage/FS: LVM, hardware/software RAID, NFS, GlusterFS, ZFS"]


for skill in skills:
    db.session.add(Knowledge(skill))


db.session.add(
    Expirience(
        "Devops at Kaaiot",
        "February 2017 - Present",
        "https://kaaiot.io",
        "Installation/configuration/support of Kubernetes Clusters " \
        "(AWS/Bare-metal); AWS network designing with Terraform;" \
        "Containerization of services with Docker; Writing Ansible " \
        "code for automatic deployment of OpenLDAP/Jenkins/GitLab " \
        "servers; CI/CD work with Jenkins (Groovy pipelines);" \
        "Backup automatization with Python (boto + AWS Lambda)"
    )
)

db.session.add(
    Expirience(
        "SRE / DevOps at Playtech",
        "February 2017 - February 2018",
        "https://playtech.com",
        "Working on migration of company's clients from Cloud Foundry " \
        "DEA to Diego; Writing Ansible code for automatic deployment of " \
        "Cloud Foundry; Configuring monitoring for already working instances;" \
        "Migration to OpenShift (RedHat Kubernetes distro);" \
        "Support developers in their activities, daily tasks"
    )
)

db.session.commit()
