resource "google_compute_instance" "jenkins" {

  name         = "jenkins-server"
  machine_type = "e2-medium"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
      size  = 30
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.public_subnet.id

    access_config {}
  }

  tags = ["jenkins"]

  service_account {
    email  = google_service_account.backend_sa.email
    scopes = ["cloud-platform"]
  }

  metadata_startup_script = <<-EOF
#!/bin/bash

apt update

apt install -y openjdk-17-jdk

curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | tee \
/usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
https://pkg.jenkins.io/debian-stable binary/ | tee \
/etc/apt/sources.list.d/jenkins.list > /dev/null

apt update

apt install -y jenkins docker.io git

systemctl enable docker
systemctl start docker

systemctl enable jenkins
systemctl start jenkins

usermod -aG docker jenkins
EOF
}