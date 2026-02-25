variable "REPO" {
  default = "ghcr.io/<org>/<project>"
}

variable "TAG" {
  default = "latest"
}

group "default" {
  targets = ["api", "web"]
}

target "api" {
  context = "./backend"
  dockerfile = "Dockerfile"
  tags = ["${REPO}/api:${TAG}"]
  platforms = ["linux/amd64"]
}

target "web" {
  context = "./frontend"
  dockerfile = "Dockerfile.prod"
  tags = ["${REPO}/web:${TAG}"]
  platforms = ["linux/amd64"]
}
