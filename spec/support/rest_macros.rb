module RestMacros

  def get_task_id
    JSON.parse(response.body)['id']
  end

end