require_relative '../dynamo_lister.rb'
require_relative 'factories/dynamo_factory.rb'

include DynamoFactory

describe DynamoLister do
  context 'list tables' do
    before :context do
      Aws.config[:dynamodb] = {
        stub_responses: {
          list_tables: list_tables_response(prefix: 'test')
        }
      }
    end

    it 'lists all tables' do
      expect(DynamoLister.list_all.length)
        .to eq(10)
    end

    it 'lists all tables in given environment' do
      expect(DynamoLister.list_all(environment: 'dev')
        .length)
        .to eq(0)
    end
  end
end
