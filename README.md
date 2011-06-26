## 1-2-3 Go

### Controller

    include Flan

    def create
      # ...
      flan(:pageview, 'pudding/creation')
      # ...
    end

### Layout

    %head
      -# Google Analytics
      = flan_js
