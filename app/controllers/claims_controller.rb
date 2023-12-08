class ClaimsController < ApplicationController
  def index
    matching_claims = Claim.all

    @list_of_claims = matching_claims.order({ :created_at => :desc })

    render({ :template => "claims/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_claims = Claim.where({ :id => the_id })

    @the_claim = matching_claims.at(0)

    render({ :template => "claims/show" })
  end

  def create
    the_claim = Claim.new
    the_claim.user_id = params.fetch("query_user_id")
    the_claim.line_item_id = params.fetch("query_line_item_id")

    if the_claim.valid?
      the_claim.save
      redirect_to("/claims", { :notice => "Claim created successfully." })
    else
      redirect_to("/claims", { :alert => the_claim.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_claim = Claim.where({ :id => the_id }).at(0)

    the_claim.user_id = params.fetch("query_user_id")
    the_claim.line_item_id = params.fetch("query_line_item_id")

    if the_claim.valid?
      the_claim.save
      redirect_to("/claims/#{the_claim.id}", { :notice => "Claim updated successfully."} )
    else
      redirect_to("/claims/#{the_claim.id}", { :alert => the_claim.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_claim = Claim.where({ :id => the_id }).at(0)

    the_claim.destroy

    redirect_to("/claims", { :notice => "Claim deleted successfully."} )
  end
end
