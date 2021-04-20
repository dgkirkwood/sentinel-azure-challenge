mock "tfplan/v2" {
  module {
    source = "app_services_mock_fail.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}