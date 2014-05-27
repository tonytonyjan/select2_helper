Install
=======

`Gemfile`

```ruby
gem 'select2_helper', github: 'tonytonyjan/select2_helper'
```

`application.js`

```coffee
//= require select2
//= require select2_helper
```

Usage
=======

Let project has many tasks.

`project.rb`
------------

```ruby
class Project < ActiveRecord::Base
  include Select2Concern
  select2_white_list :name
  has_many :tasks
end

```

`task.rb`
---------

```ruby
class Task < ActiveRecord::Base
  include Select2Concern
  select2_white_list :status
  belongs_to :project
end
```

Single Select
-------------

```erb
<%=
  text_field_tag :single_demo, nil,
    class: 'select2-single',
    data: {
      model: :Project,
      column: :name
    }
%>
```


Multiple Select
---------------

```erb
<%=
  text_field_tag :multiple_demo, nil,
    class: 'select2-multiple',
    data: {
      model: :Project,
      column: :name
    }
%>
```

Nested Select
-------------

```erb
<%=
  text_field_tag :level_1, nil,
    class: 'select2-single',
    data: {
      model: :Project,
      column: :name,
      child_field: '#level_2'
    } 
%>

<%=
  text_field_tag :level_2, nil,
    data: {
      model: :Task,
      column: :status,
      foreign_key: :project_id
    }
%>
```