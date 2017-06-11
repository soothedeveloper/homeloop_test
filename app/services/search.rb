class Search
  attr_reader :query

  def initialize query_id=nil, radius=nil
    query_id = query_id.id if query_id.respond_to?(:id)
    @query = Query.find_by_id(query_id) || Query.new
    @radius = radius || 1.0
  end

  def results
    transactions = get_transactions_within_radius
    query.update_attribute(:result_count, transactions.length) if transactions.length.positive?
    return transactions
  end

  private

    def get_transactions_within_radius
      Transaction.all.select do |transaction|
        @radius >= Geocoder::Calculations.distance_between( [query.latitude, query.longitude],
                                                            [transaction.latitude, transaction.longitude],
                                                            :units => :km )
      end
    end

end
