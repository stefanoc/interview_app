# Interview App

This is a skeleton Rails application created for a developer interview design problem. It demonstrates a simple vendor-project assignment system with three core models.

This app models a simple integration between two systems, known as "Local"
and "Remote".

The "Local" system exposes a REST API with 3 operations:
* sync a vendor
* sync a project
* add a vendor to a project

The "Remote" system exposes a REST API with 3 operations:
* list vendors
* list projects
* list the assignments for a project

The integration needs to keep "Local" in sync with "Remote":

* update a vendor if the data has changed
* update a project if the data has changed
* add a vendor to a project if a new assignment is created

## Models

### Vendor
- **Attributes:** name, local_id, remote_id
- **Relationships:** has many assignments, has many projects through assignments

### Project
- **Attributes:** name, local_id, remote_id
- **Relationships:** has many assignments, has many vendors through assignments

### Assignment
- **Attributes:** vendor_id, project_id
- **Relationships:** belongs to vendor, belongs to project

## Database Schema

```
vendors
- id (primary key)
- local_id (string)
- remote_id (string, not null)
- name (string, not null)
- created_at, updated_at

projects
- id (primary key)
- local_id (string)
- remote_id (string, not null)
- name (string, not null)
- created_at, updated_at

assignments
- id (primary key)
- vendor_id (foreign key to vendors)
- project_id (foreign key to projects)
- created_at, updated_at
```

## Design Discussion Points

This skeleton provides a foundation for discussing various design patterns and improvements:

- **Validations:** How to ensure data integrity
- **Associations:** Many-to-many relationships through join tables
- **Scopes:** Query optimization and reusability
- **Indexing:** Database performance considerations
- **Business Logic:** Where to place domain-specific methods
- **Extensibility:** How to add new features (e.g., assignment dates, vendor ratings)
