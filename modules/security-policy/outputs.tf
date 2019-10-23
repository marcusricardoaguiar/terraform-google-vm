# ------------------------------------------------------------------------------
# LOAD BALANCER OUTPUTS
# ------------------------------------------------------------------------------

output "self_link" {
  value       = google_compute_security_policy.security-policy-1.self_link
}

