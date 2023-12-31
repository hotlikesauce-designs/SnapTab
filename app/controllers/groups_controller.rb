class GroupsController < ApplicationController
  def index
    my_memberships = current_user.memberships
    matching_groups = Group.where({ :id => my_memberships.pluck(:group_id) })

    @list_of_groups = matching_groups.order({ :created_at => :desc })

    render({ :template => "groups/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_groups = Group.where({ :id => the_id })

    @the_group = matching_groups.at(0)

    render({ :template => "groups/show" })
  end

  def create
    the_group = Group.new
    the_group.group_name = params.fetch("query_group_name")
    the_group.creator_id = current_user.id
    the_group.group_description = params.fetch("query_group_description")
    the_group.memberships_count = 0
    the_group.categories_count = 0

    if the_group.valid?
      the_group.save
      
      # also need to create Membership record! 
      # TODO: consider calling the create method in the memberships controller
      the_member = Membership.new
      the_member.group_id = the_group.id
      the_member.user_id = current_user.id
      the_member.role = "admin"
      the_member.save

      redirect_to("/groups", { :notice => "Group created successfully." })
    else
      redirect_to("/groups", { :alert => the_group.errors.full_messages.to_sentence })
    end
    
  end

  def update
    the_id = params.fetch("path_id")
    the_group = Group.where({ :id => the_id }).at(0)

    the_group.group_name = params.fetch("query_group_name")
    the_group.group_description = params.fetch("query_group_description")

    if the_group.valid?
      the_group.save
      redirect_to("/groups/#{the_group.id}", { :notice => "Group updated successfully."} )
    else
      redirect_to("/groups/#{the_group.id}", { :alert => the_group.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_group = Group.where({ :id => the_id }).at(0)

    the_group.destroy

    redirect_to("/groups", { :notice => "Group deleted successfully."} )
  end
end
