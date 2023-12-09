class MembershipsController < ApplicationController
  def index
    matching_memberships = Membership.all

    @list_of_memberships = matching_memberships.order({ :created_at => :desc })

    render({ :template => "memberships/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_memberships = Membership.where({ :id => the_id })

    @the_membership = matching_memberships.at(0)

    render({ :template => "memberships/show" })
  end

  def create
    
    the_group_id = params.fetch("group_id")
    the_username = params.fetch("query_username")

    # pull the corresponding user id from the users table
    matching_user = User.where({ :username => the_username }).first
    
    the_membership = Membership.new
    the_membership.user_id = matching_user.id
    the_membership.group_id = the_group_id
    the_membership.role = "member"

    if the_membership.valid?
      the_membership.save
      redirect_to("/groups/#{the_group_id}", { :notice => "Membership created successfully." })
    else
      redirect_to("/groups/#{the_group_id}", { :alert => the_membership.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_membership = Membership.where({ :id => the_id }).at(0)

    the_membership.user_id = params.fetch("query_user_id")
    the_membership.group_id = params.fetch("query_group_id")
    the_membership.role = params.fetch("query_role")

    if the_membership.valid?
      the_membership.save
      redirect_to("/memberships/#{the_membership.id}", { :notice => "Membership updated successfully."} )
    else
      redirect_to("/memberships/#{the_membership.id}", { :alert => the_membership.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_membership = Membership.where({ :id => the_id }).at(0)

    the_membership.destroy

    redirect_to("/memberships", { :notice => "Membership deleted successfully."} )
  end
end
