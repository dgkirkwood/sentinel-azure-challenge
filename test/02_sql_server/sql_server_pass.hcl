mock "tfplan/v2" {
  module {
    source = "sql_server_mock_pass.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}