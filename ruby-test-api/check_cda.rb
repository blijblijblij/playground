#!/usr/bin/env ruby

require 'minitest/autorun'
require 'rest-client'
require 'json'

# bloeb
class APITest < Minitest::Test
  def setup
    u = "http://#{ENV['PENTAHO_ADMIN_USERNAME']}:"
    u << "#{ENV['PENTAHO_ADMIN_PASSWORD']}@#{ENV['PENTAHO_HOSTNAME']}:"
    u << "#{ENV['PENTAHO_PORT']}/pentaho/plugin/cda/api/doQuery?path="
    u << '/public/files/parameters.cda&dataAccessId=cabinet_type_query'

    response = RestClient.get(u,
                              headers: { accept: :json,
                                         content_type: :json })
    @data = JSON.parse response.body
  end

  def test_cabinettype_metadata
    assert_includes (@data['metadata']).to_s, 'Name'
    assert_includes (@data['metadata']).to_s, 'Cabinet Type'
    assert_includes (@data['resultset']).to_s,
                    '[Cabinet Type].[All Cabinet Types]", "All Cabinet Types"'
    assert_includes (@data['queryInfo']).to_s, 'totalRows'
  end

  def test_cabinettype_data
    assert @data['queryInfo']['totalRows'].to_i.positive?
  end
end
