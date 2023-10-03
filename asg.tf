# Autoscaling Group 
resource "google_compute_autoscaler" "autoscaling" {
    name    =   "autoscaling"
#    project =   "cloud-security"
#    zone    =   "us-central1-c"
    target  =   google_compute_instance_group_manager.igm.self_link
    
    autoscaling_policy {
        max_replicas = 5
        min_replicas = 2
        cooldown_period = 60

        cpu_utilization {
            target = 0.5
        }
    }
}
