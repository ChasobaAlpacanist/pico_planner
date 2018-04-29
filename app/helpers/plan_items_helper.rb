module PlanItemsHelper
  ACTION_LABEL_MAP = {
    index: '予定表',
    of_today: '今日の予定表'
  }

  def plan_item_nav_link(action)
    label = ACTION_LABEL_MAP[action]
    url = (action == :index ? :plan_items : [ action, :plan_items])
    html_classes = %w(nav-link)
    html_classes << 'active' if action.to_s == action_name
    link_to label, url, class: html_classes.join(' ')
  end
end
