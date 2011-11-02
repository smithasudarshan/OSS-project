class PermissionForQuestionAdvice < ActiveRecord::Migration
  def self.up
    newPerm = Permission.find_or_create_by_name('create and edit advice')
    site_controller = SiteController.find_or_create_by_name('question_advice')
    site_controller.permission_id = newPerm.id
     site_controller.save
     Role.rebuild_cache
  end

  def self.down
    site_controller = SiteController.find_by_name('question_advice')
    if site_controller != nil
      actions = ControllerAction.find(:all, :conditions => ['site_controller_id = ?',site_controller.id])
      actions.each {|action|
        menuItems = MenuItem.find(:all, :conditions => ['controller_action_id = ?',action.id])
        menuItems.each{ |item| item.destroy}
        action.destroy
      }
      site_controller.destroy
    end
    Role.rebuild_cache
  end
end