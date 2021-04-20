mock "tfplan/v2" {
  module {
    source = "sql_server_mock_fail.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}