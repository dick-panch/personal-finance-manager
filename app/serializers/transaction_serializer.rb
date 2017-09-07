class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :title, :start, :amount, :allDay, :color

  def title
  	object.description
  end

  def start
  	object.transaction_date
  end

  def allDay
  	true
  end

  def color
  	if object.type_id == 2
  		'#1ab394'
  	elsif object.type_id == 1
  		'#ed5565'
  	elsif object.type_id == 3
  		'#23c6c8'
  	else
  		'#D6DBDF'
  	end
  end
end
