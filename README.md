# Azure

Azure cloud infra

write a key project for my resume as an sre topic is "cost optimization"
where i have monitored the app using on grafana by exporting data from prometheus and depends on the usage have reduced the resource request and limit in kubernetes yaml file. also monitored the node resource usage of our GKE Nodepool and downsized the nodepool accordingly. also migrated our main service to a downsized pool. all this action cuts our cost by 40%

write a project with name automations in jenkins
1. created a pipeline to create staging and canary deployment for manual testing
1. created a CD pipeline to rollout restart/rolling update deployments and to rollback to previous version of the app
created a cleaner pipelines to clean all our staging and canary deployments based on their time to leave period and clean our GCR and AR registry weekly
1. created to pipeline to update the certificate across all of aur apps
1. created a pipeline to monitor over number of on demand nodes and automate it's deleteion
