resource "aws_s3_bucket" "codepipeline_bucket" {
  bucket = var.s3_bucket_name
  acl    = "public-read"
  policy = templatefile("./templates/policy_s3.json", { aws_s3_bucket = "s3-static-website-training" })

  website {
    index_document = "index.html"
    error_document = "error.html"


  }
  tags = {
    project   = "training"
    createdby = "pabloOjeda"
  }
}