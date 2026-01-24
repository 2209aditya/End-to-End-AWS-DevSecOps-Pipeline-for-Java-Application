resource "aws_ecr_repository" "app" {
  name = "devsecops-java-app"
  image_scanning_configuration {
    scan_on_push = true
  }
}
