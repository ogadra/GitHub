resource "github_issue_labels" "cli_demo" {
  repository = github_repository.cli_demo_20260327.name

  label {
    name        = "front"
    color       = "61dafb"
    description = "Frontend microservice"
  }

  label {
    name        = "runner"
    color       = "f0ad00"
    description = "Runner microservice"
  }

  label {
    name        = "broker"
    color       = "e5245e"
    description = "Broker microservice"
  }

  label {
    name        = "nginx"
    color       = "009639"
    description = "Nginx microservice"
  }

  label {
    name        = "terraform"
    color       = "7b42bc"
    description = "Terraform"
  }
}
