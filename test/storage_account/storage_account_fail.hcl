mock "tfplan/v2" {
  module {
    source = "storage_account_mock_fail.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}