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
      -# Initialize Google Analytics
      = flan_js

### Generates

    <script type="text/javascript">
      _gaq.push(['_trackPageview', '/_virtual/pudding/creation']);
    </script>
