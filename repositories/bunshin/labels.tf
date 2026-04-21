resource "github_issue_labels" "bunshin" {
  repository = github_repository.bunshin.name

  label {
    name        = "runner"
    color       = "5277c3"
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

  label {
    name        = "dependencies"
    color       = "0366d6"
    description = "Pull requests that update a dependency file"
  }

  label {
    name        = "github_actions"
    color       = "000000"
    description = "Pull requests that update GitHub Actions code"
  }

  label {
    name        = "docker"
    color       = "21ceff"
    description = "Pull requests that update docker code"
  }
}
