mock "tfconfig/v2" {
  module {
    source = "module_version_mock_pass.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}