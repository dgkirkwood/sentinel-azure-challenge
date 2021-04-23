mock "tfplan/v2" {
  module {
    source = "app_services_mock_pass.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}