class RemoteApi
  def fetch_vendors
    # returns a list of vendors
    [
      {
        id: 1,
        name: 'Party 1'
      },
      {
        id: 2,
        name: 'Party 2'
      }
    ]
  end

  def fetch_projects
    # returns a list of projects
    [
      {
        id: 1,
        name: 'Project 1'
      },
      {
        id: 2,
        name: 'Project 2'
      }
    ]
  end

  def fetch_assignments(project)
    # returns a list of assignments for the project
    [
      {
        id: 1,
        vendorId: 1
      },
      {
        id: 2,
        vendorId: 2
      }
    ]
  end
end
