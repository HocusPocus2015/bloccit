require 'test_helper'

class DatabaseTest < ActiveSupport::TestCase
  def setup
    clean_db
  end

  test "tables" do
    assert_equal RailsDb::Database.tables, ["accounts", "comments", "contacts", "legacy_accounts", "payments", "projects", "projects_users", "users"]
  end

  test "accessible tables" do
    assert_equal RailsDb::Database.accessible_tables, ["accounts", "comments", "contacts", "legacy_accounts", "payments", "projects", "projects_users", "users"]
  end

  test 'adapter' do
    assert_not_equal RailsDb::Database.adapter.to_s, ""
  end
end