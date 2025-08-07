# Interview App

This is a skeleton Rails application created for a developer interview design problem. It demonstrates a simple vendor-project assignment system with three core models.

This app models a simple integration between two systems, known as "A"
and "B".

The "A" system exposes a REST API with 3 operations:

* sync a vendor
```
POST /vendors
{
  "id": "Vendor ID",
  "name": "Vendor name"
}
```
The "id" attribute is optional; if missing a new vendor is created. Otherwise,
the existing vendor with the given ID is updated.
The response payload contains the vendor ID:
```
{
  "id": "Vendor ID"
}
```

* sync a project
```
POST /projects
{
  "id": "Project ID",
  "name": "Project name"
}
```
This works exactly like the /vendors endpoint


* add a vendor to a project
```
POST /vendors/:id/assign-to-project
{
  "project_id": "Project ID"
}
```

The "B" system exposes a REST API with 3 operations:

* list vendors
```
GET /vendors?page=N
{
  "data": [
    {
      "id": "Vendor ID",
      "name": "Vendor name"
    }
  ]
}
```

* list projects
```
GET /projects?page=N
{
  "data": [
    {
      "id": "Project ID",
      "name": "Project name"
    }
  ]
}
```

* list the commitments for a project
```
GET /projects/:id/commitments
{
  "data": [
    {
      "project_id": "Project ID",
      "vendor_id": "Vendor ID"
    }
  ]
}
```


The integration needs to keep "A" in sync with "B", by polling periodically
"B" and invoking the necessary operations on "A".

* "A" and "B" can _only_ be accessed via their respective APIs.
* Unnecessary operations must be avoided (e.g. do not perform operations on A if
the data in B has not changed)
