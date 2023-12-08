class ReceiptsController < ApplicationController
  def index
    matching_receipts = Receipt.all

    @list_of_receipts = matching_receipts.order({ :created_at => :desc })

    render({ :template => "receipts/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_receipts = Receipt.where({ :id => the_id })

    @the_receipt = matching_receipts.at(0)

    render({ :template => "receipts/show" })
  end

  def create
    the_receipt = Receipt.new
    the_receipt.caption = params.fetch("query_caption")
    the_receipt.image = params.fetch("query_image")
    the_receipt.owner_id = params.fetch("query_owner_id")
    the_receipt.location = params.fetch("query_location")
    the_receipt.category_id = params.fetch("query_category_id")
    the_receipt.subtotal = params.fetch("query_subtotal")
    the_receipt.tax = params.fetch("query_tax")
    the_receipt.total = params.fetch("query_total")
    the_receipt.datetime = params.fetch("query_datetime")
    the_receipt.comments_count = params.fetch("query_comments_count")
    the_receipt.line_items_count = params.fetch("query_line_items_count")

    if the_receipt.valid?
      the_receipt.save
      redirect_to("/receipts", { :notice => "Receipt created successfully." })
    else
      redirect_to("/receipts", { :alert => the_receipt.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_receipt = Receipt.where({ :id => the_id }).at(0)

    the_receipt.caption = params.fetch("query_caption")
    the_receipt.image = params.fetch("query_image")
    the_receipt.owner_id = params.fetch("query_owner_id")
    the_receipt.location = params.fetch("query_location")
    the_receipt.category_id = params.fetch("query_category_id")
    the_receipt.subtotal = params.fetch("query_subtotal")
    the_receipt.tax = params.fetch("query_tax")
    the_receipt.total = params.fetch("query_total")
    the_receipt.datetime = params.fetch("query_datetime")
    the_receipt.comments_count = params.fetch("query_comments_count")
    the_receipt.line_items_count = params.fetch("query_line_items_count")

    if the_receipt.valid?
      the_receipt.save
      redirect_to("/receipts/#{the_receipt.id}", { :notice => "Receipt updated successfully."} )
    else
      redirect_to("/receipts/#{the_receipt.id}", { :alert => the_receipt.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_receipt = Receipt.where({ :id => the_id }).at(0)

    the_receipt.destroy

    redirect_to("/receipts", { :notice => "Receipt deleted successfully."} )
  end
end
