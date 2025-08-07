class SyncProjectsJob
  def perform
    remote_projects = remote_api.fetch_projects
  end
end
