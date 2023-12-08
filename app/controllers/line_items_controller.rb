class LineItemsController < ApplicationController
  def index
    matching_line_items = LineItem.all

    @list_of_line_items = matching_line_items.order({ :created_at => :desc })

    render({ :template => "line_items/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_line_items = LineItem.where({ :id => the_id })

    @the_line_item = matching_line_items.at(0)

    render({ :template => "line_items/show" })
  end

  def create
    the_line_item = LineItem.new
    the_line_item.receipt_id = params.fetch("query_receipt_id")
    the_line_item.cost = params.fetch("query_cost")
    the_line_item.quantity = params.fetch("query_quantity")
    the_line_item.even_split_flag = params.fetch("query_even_split_flag", false)
    the_line_item.claims_count = params.fetch("query_claims_count")

    if the_line_item.valid?
      the_line_item.save
      redirect_to("/line_items", { :notice => "Line item created successfully." })
    else
      redirect_to("/line_items", { :alert => the_line_item.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_line_item = LineItem.where({ :id => the_id }).at(0)

    the_line_item.receipt_id = params.fetch("query_receipt_id")
    the_line_item.cost = params.fetch("query_cost")
    the_line_item.quantity = params.fetch("query_quantity")
    the_line_item.even_split_flag = params.fetch("query_even_split_flag", false)
    the_line_item.claims_count = params.fetch("query_claims_count")

    if the_line_item.valid?
      the_line_item.save
      redirect_to("/line_items/#{the_line_item.id}", { :notice => "Line item updated successfully."} )
    else
      redirect_to("/line_items/#{the_line_item.id}", { :alert => the_line_item.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_line_item = LineItem.where({ :id => the_id }).at(0)

    the_line_item.destroy

    redirect_to("/line_items", { :notice => "Line item deleted successfully."} )
  end
end
