mock "tfconfig/v2" {
  module {
    source = "module_version_mock_fail.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}