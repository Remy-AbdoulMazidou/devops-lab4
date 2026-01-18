run "apply" {
  command = apply
}

run "assert_endpoint" {
  command = apply

  assert {
    condition     = output.status_code == 200
    error_message = "Expected status_code=200"
  }
}
