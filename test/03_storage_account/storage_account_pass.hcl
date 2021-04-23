mock "tfplan/v2" {
  module {
    source = "storage_account_mock_pass.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}